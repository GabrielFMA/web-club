// ignore_for_file: library_private_types_in_public_api, avoid_print, use_build_context_synchronously, unnecessary_null_comparison, dead_code

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'client.store.g.dart';

class ClientStore = _ClientStore with _$ClientStore;

abstract class _ClientStore with Store {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBlb1hQGuNgpJs0dkTKhAQ-l5YqS3XVM88';

  FirebaseFirestore db = FirebaseFirestore.instance;

  late http.Response rsp;

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
  String _cep = '';

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
  void setCep(String cep) {
    _cep = cep;
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
      print('');
      print('Registro, Nome: $_name, Email: $_email, Senha: $_password');
      print('');

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
        textError = '';
        isError = true;
        await registrationUser();
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
        "Endereço": _cep,
        "Telefone": _phone,
        "Contrato": _numContract,
      };
      await addDetailsUsers(usuariosInfoMap, _uidUser);
    } catch (e) {
      print('Erro ao fazer registro: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
  }

  @action
  Future addDetailsUsers(Map<String, dynamic> usuariosMap, String id) async {
    return await db.collection("Usuarios").doc(id).set(usuariosMap);
  }

  @action
  Future duplicateEntryCheck() async {
    try {
      List<String> duplicates = [];

      Map<String, Future<QuerySnapshot>> queries = {
        'Nome': FirebaseFirestore.instance
            .collection("Usuarios")
            .where("Nome", isEqualTo: _name)
            .get(),
        'Email': FirebaseFirestore.instance
            .collection("Usuarios")
            .where("Email", isEqualTo: _email)
            .get(),
        'CPF': FirebaseFirestore.instance
            .collection("Usuarios")
            .where("CPF", isEqualTo: _cpf)
            .get(),
        'Contrato': FirebaseFirestore.instance
            .collection("Usuarios")
            .where("Contrato", isEqualTo: _numContract)
            .get(),
      };

      await Future.forEach(queries.entries, (entry) async {
        QuerySnapshot snapshot = await entry.value;
        if (snapshot.docs.isNotEmpty) {
          duplicates.add(entry.key);
        }
      });

      if (duplicates.isNotEmpty) {
        textError = duplicates.join(', ');
        if (duplicates.length > 1) {
          int lastCommaIndex = textError.lastIndexOf(',');
          textError = textError.replaceRange(
            lastCommaIndex,
            lastCommaIndex + 1,
            ' e',
          );
        }
        textError += duplicates.length > 1
            ? ' já foram cadastrados'
            : ' já foi cadastrado';
        isError = true;
      } else {
        isError = false;
      }
    } catch (e) {
      print('Erro ao verificar duplicidades: $e');
      rethrow;
    }
  }

  @action
  Future searchCep() async {
    print('CEP');
    try {
      rsp = await http.get(Uri.parse("https://viacep.com.br/ws/$_cep/json/"));
      print('CEP2');
    } on http.ClientException catch (_) {
      textError = 'CEP inválido';
      isError = true;
      return;
    } catch (e) {
      print('Erro ao fazer registro do Cep: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
    print('CEP3');
    textError = '';
    isError = false;
  }
}
