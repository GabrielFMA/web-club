// ignore_for_file: library_private_types_in_public_api, avoid_print, use_build_context_synchronously, unused_field

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

  @observable
  User? _currentUser;

  @observable
  bool isVisible = false;

  @observable
  String _token = '';

  @observable
  String _uidUser = '';

  @observable
  String _cpf = '';

  @observable
  String _name = '';

  @observable
  String _email = '';

  @observable
  String _password = '';

  @observable
  String _phone = '';

  @observable
  String _numContract = '';

  @observable
  String textError = ' ';

  @observable
  bool isError = false;

  //Get functions
  @action
  getEmail() {
    return _email;
  }

  @action
  getName() {
    return _name;
  }

  @action
  getCPF() {
    return _cpf;
  }

  @action
  getPhone() {
    return _phone;
  }

  @action
  getPassword() {
    return _password;
  }

  @action
  usuarioUID() {
    return _uidUser;
  }

  getTextError() {
    return textError;
  }

  getIsError() {
    return isError;
  }

  //Set functions
  @action
  void setCPF(String cpf) {
    _cpf = cpf;
  }

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
  void setNumContract(String numContract) {
    _numContract = numContract;
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
      print('senha:');
      print(_password);

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
    } catch (e) {
      print(e);
    }
  }

  //Firestore database
  @action
  Future<void> registrationUser() async {
    print("ID do usuario $_uidUser");
    try {
      Map<String, dynamic> usuariosInfoMap = {
        "ID": _uidUser,
        "Nome": _name,
        "CPF": _cpf,
        "Email": _email,
        "Telefone": _phone,
        "Contrato": _numContract,
      };
      await addDetailsUsers(usuariosInfoMap, _uidUser);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future addDetailsUsers(
      Map<String, dynamic> usuariosMap, String id) async {
    return await db.collection("Usuarios").doc(id).set(usuariosMap);
  }

  @action
  Future<void> recoveryData(String currentUser) async {
    _uidUser = currentUser;
    try {
      db.collection(_uidUser);
      final docRef = db.collection("Usuarios").doc(_uidUser);
      docRef.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;

          setName(data['Nome']);
          setEmail(data['Email']);
          setCPF(data['CPF']);
          setPhone(data['Telefone']);
          print('try2');
          print(_name);
          print(_email);
          print(_cpf);
          print(_phone);
        },
        onError: (e) => print("Error getting document: $e"),
      );
    } catch (e) {
      print(e);
    }
  }
}
