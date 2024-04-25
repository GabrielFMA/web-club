// ignore_for_file: library_private_types_in_public_api, unused_field, avoid_print, use_build_context_synchronously, equal_keys_in_map

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'employee.store.g.dart';

class EmployeeStore = _EmployeeStore with _$EmployeeStore;

abstract class _EmployeeStore with Store {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBlb1hQGuNgpJs0dkTKhAQ-l5YqS3XVM88';

  FirebaseFirestore db = FirebaseFirestore.instance;

  // Verification
  @observable
  bool isVisible = false;

  // Errors
  @observable
  bool _isError = false;

  @observable
  String _textError = '';

  // Info Users
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
  String _position = '';

  @observable
  int _level = 3;

  // Get functions

  // Errors
  bool getIsError() => _isError;

  String getTextError() => _textError;

  // Info Users
  @action
  String userUID() => _uidUser;

  @action
  int getLevel() => _level;

  // Set functions

  // Errors
  bool setIsError(isError) => _isError = isError;

  String setTextError(textError) => _textError = textError;


  // Info Users
  @action
  void setName(String name) => _name = name;

  @action
  void setEmail(String email) => _email = email;

  @action
  void setPassword(String password) => _password = password;

  @action
  void setPhone(String phone) => _phone = phone;

  @action
  void setPosition(String position) => _position = position;

  @action
  void setLevel(int level) => _level = level;

  // Password field
  @action
  void visible() => isVisible = !isVisible;

  // Auth Firebase Functions

  Future<void> signUpWithEmailPassword() async {
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

        await registrationUser();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('Email already in use.');
      } else if (e.code == 'weak-password') {
        print('The provided password is too weak.');
      } else {
        print('Authentication error: ${e.message}');
      }
    } catch (e) {
      print('Error registering: $e');
      print('Exception type: ${e.runtimeType}');
    }
  }

  // Firestore db

  @action
  Future<void> registrationUser() async {
    print("User ID: $_uidUser");
    try {
      Map<String, dynamic> userInfoMap = {
        "ID": _uidUser,
        "Nome": _name.toLowerCase(),
        "Email": _email.toLowerCase(),
        "Telefone": _phone,
        "Cargo": _position,
        "Level": _level,
      };
      await addDetailsUsers(userInfoMap, _uidUser);
    } catch (e) {
      print('Error registering: $e');
      print('Exception type: ${e.runtimeType}');
    }
  }

  @action
  Future addDetailsUsers(Map<String, dynamic> userInfoMap, String id) async {
    await db.collection("Funcionarios").doc(id).set(userInfoMap);
  }

  @action
Future duplicateEntryCheck() async {
  try {
    List<String> duplicates = [];

    Map<String, Future<QuerySnapshot>> queries = {
      'Nome': FirebaseFirestore.instance
          .collection("Funcionarios")
          .where("Nome", isEqualTo: _email.toLowerCase())
          .get(),
      'Email': FirebaseFirestore.instance
          .collection("Funcionarios")
          .where("Email", isEqualTo: _email.toLowerCase())
          .get(),
    };

    await Future.forEach(queries.entries, (entry) async {
      QuerySnapshot snapshot = await entry.value;
      if (snapshot.docs.isNotEmpty) {
        duplicates.add(entry.key);
      }
    });

    if (duplicates.isNotEmpty) {
      _textError = duplicates.join(' e ');
      _textError += duplicates.length > 1
          ? ' já foram cadastrados'
          : ' já foi cadastrado';
      _isError = true;
    } else {
      _textError = '';
      _isError = false;
    }
  } catch (e) {
    print('Erro ao verificar duplicidades: $e');
    rethrow;
  }
}


  restoreData() {
    setName('');
    setEmail('');
    setLevel(3);
    setPhone('');
    setPassword('');
    setPosition('');
    _textError = '';
  }
}
