// ignore_for_file: avoid_print, use_build_context_synchronously, library_private_types_in_public_api, unused_field, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:web_simclub/screen/home_page.dart';

part 'auth.store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  //Verification
  @observable
  bool isVisible = false;

  @observable
  bool admin = false;

  //Errors
  @observable
  bool isError = false;

  @observable
  String textError = '';

  //Info Users
  @observable
  User? _currentUser;

  @observable
  String _token = '';

  @observable
  String _uidUser = '';

  @observable
  String _name = '';

  @observable
  String _email = '';

  @observable
  String _password = '';

  @observable
  String _phone = '';

  @observable
  String _cargo = '';

  //Get functions
  //Verification
  @action
  bool getAdmin() {
    return admin;
  }

  //Errors
  getIsError() {
    return isError;
  }

  getTextError() {
    return textError;
  }

  //Info Users
  @action
  userUID() {
    return _uidUser;
  }

  @action
  getName() {
    return _name;
  }

  @action
  getEmail() {
    return _email;
  }

  @action
  getPassword() {
    return _password;
  }

  @action
  getPhone() {
    return _phone;
  }

  @action
  getCargo() {
    return _cargo;
  }

  //Set functions
  //Info Users
  @action
  void setName(String name) {
    _name = name;
  }

  @action
  void setEmail(String email) {
    _email = email;
  }

  @action
  void setPassword(String password) {
    _password = password;
  }

  @action
  void setPhone(String phone) {
    _phone = phone;
  }

  @action
  void setCargo(String cargo) {
    _cargo = cargo;
  }

  //Password field
  @action
  void visible() {
    isVisible = !isVisible;
  }

  //Auth Firebase Functions
  @action
  Future<void> signInWithEmailPassword(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      print('Usuário logado com sucesso: ${credential.user!.uid}');
      _uidUser = credential.user!.uid;

      recoveryData(_uidUser);
      _password = ' ';

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);

      textError = ' ';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        textError = 'Email não encontrado!';
        isError = true;
        print('Email não encontrado');
      } else if (e.code == 'invalid-credential') {
        textError = 'Email/senha incorretos!';
        isError = true;
        print('Email/senha incorretos');
      } else if (e.code == 'too-many-requests') {
        textError =
            'Acesso a esta conta foi temporariamente desativado devido a muitas tentativas de login.';
        isError = true;
        print('Muitas tentativas de login');
      }
    } catch (e) {
      textError = 'Sem permissão para acessar o sistema';
      print('Erro ao fazer login: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
  }

  //Logout function
  @action
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _currentUser = null;
      admin = false;
      print('admin depois do sigout $admin');
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> recoveryData(String currentUser) async {
    _uidUser = currentUser;
    try {
      final userCollection = db.collection("Usuarios");
      final userDoc = await userCollection.doc(_uidUser).get();
      if (userDoc.exists) {
        textError = 'Você não tem permissão';
        restoreData();
        signOut();
      } else {
        final docRef = db.collection("Funcionarios").doc(_uidUser);
        docRef.get().then(
          (DocumentSnapshot doc) {
            final data = doc.data() as Map<String, dynamic>;

            setName(data['Nome']);
            setEmail(data['Email']);
            setPhone(data['Telefone']);
            setCargo(data['Cargo']);

            print('admin antes do if $admin');

            if (_cargo == 'Administrador' || _cargo == 'Gerente') {
              admin = true;
            } else {
              admin = false;
            }

            print('admin depois do if $admin');
          },
          onError: (e) => print("Error getting document: $e"),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  restoreData() {
    setName('');
    setEmail('');
    setPhone('');
    setCargo('');
  }
}
