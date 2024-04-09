
// ignore_for_file: library_private_types_in_public_api, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:web_simclub/screen/auth/login.dart';

part 'client.store.g.dart';

class ClientStore = _ClientStore with _$ClientStore;

abstract class _ClientStore with Store {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBlb1hQGuNgpJs0dkTKhAQ-l5YqS3XVM88';

  FirebaseFirestore db = FirebaseFirestore.instance;

  //Verification
  @observable
  bool isVisible = false;

  //Errors
  @observable
  bool isError = false;

  @observable
  String textError = ' ';

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
  String _cpf = '';

  @observable
  String _password = '';

  @observable
  String _phone = '';

  @observable
  String _numContract = '';

  //Get funções
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

  //Set funçoes
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
  void setCPF(String cpf) {
    _cpf = cpf;
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

  //Auth Firebase Funções
  Future<void> signUpWithEmailPassword(BuildContext context) async {
    try {
      print(_name);
      print(_email);
      print(_password);
      final response = await http.post(
        Uri.parse(_url),
        body: jsonEncode({
          'email': _email,
          'password': _password,
          'returnSecureToken': true,
        }),
      );
      final responseData = jsonDecode(response.body);
      if (responseData.containsKey('idToken')) {
        _token = responseData['idToken'];
        _uidUser = responseData['localId'];

        recoveryData(_uidUser);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('Email já está em uso.');
      } else if (e.code == 'weak-password') {
        print('A senha fornecida é muito fraca.');
      } else {
        print('Erro de autenticação: ${e.message}');
      }
    } catch (e) {
      print('Erro ao fazer registro: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
  }

  //Firestore db
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
  void recoveryData(String currentUser) {
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
        },
        onError: (e) => print("Error getting document: $e"),
      );
    } catch (e) {
      print(e);
    }
  }
}
