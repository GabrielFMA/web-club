// ignore_for_file: avoid_print, use_build_context_synchronously, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:web_simclub/screen/home_page.dart';

import 'package:universal_html/html.dart' as html;

part 'auth.store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  //Observable
  @observable
  bool isVisible = false;

  @observable
  int _level = 3;

  @observable
  bool _isError = false;

  @observable
  String _textError = '';

  @observable
  User? _currentUser;

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

  //Getters
  @action
  int getLevel() => _level;

  bool getIsError() => _isError;

  String getTextError() => _textError;

  Future<User?> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  @action
  userUID() => _uidUser;

  getName() => _name;

  getEmail() => _email;

  getPassword() => _password;

  getPhone() => _phone;

  getCargo() => _cargo;

  //Setters
  @action
  void setName(String name) => _name = name;

  @action
  void setEmail(String email) => _email = email;

  @action
  void setPassword(String password) => _password = password;

  @action
  void setPhone(String phone) => _phone = phone;

  @action
  void setCargo(String cargo) => _cargo = cargo;

  @action
  void setLevel(int level) => _level = level;

  //Password field
  @action
  void visible() => isVisible = !isVisible;

  //Funções de autenticação
  @action
  Future<void> signInWithEmailPassword(BuildContext context) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      _uidUser = credential.user!.uid;

      await recoveryData(_uidUser);
      _password = ' ';

      if (!_isError) {
        Navigator.of(context).pushNamed('/home');
        _textError = ' ';
      }
    } on FirebaseAuthException catch (e) {
      // Tratamento de diferentes erros de autenticação
      handleError(e.code);
    } catch (e) {
      _textError = 'Sem permissão para acessar o sistema';
      print('Erro ao fazer login: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
  }

  @action
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      restoreData();
    } catch (e) {
      print(e);
    }
  }

  // Função de recuperação de dados do usuário
  @action
  Future<void> recoveryData(String currentUser) async {
    _uidUser = currentUser;
    try {
      _textError = '';
      final userCollection = db.collection("Usuarios");
      final userDoc = await userCollection.doc(_uidUser).get();
      if (userDoc.exists) {
        _textError = 'Conta sem autorização para entrar';
        _isError = true;
        signOut();
      } else {
        final employeeCollection = db.collection("Funcionarios");
        final employeeDoc = await employeeCollection.doc(_uidUser).get();

        if (employeeDoc.exists) {
          final data = employeeDoc.data() as Map<String, dynamic>;
          print('entrou');

          setName(data['Nome']);
          setEmail(data['Email']);
          setPhone(data['Telefone']);
          setCargo(data['Cargo']);
          setLevel(data['Level']);

          switch (_cargo) {
            case 'Administrador':
              _level = 0;
              break;
            case 'Gerente':
              _level = 1;
              break;
            case 'Funcionario':
              _level = 2;
              break;
          }
          _isError = false;
        } else {
          _textError = 'Usuário não encontrado';
          _isError = true;
        }
        return;
      }
    } catch (e) {
      print(e);
    }
  }

  // Função para limpar dados do usuário em caso de erro de permissão
  restoreData() {
    setName('');
    setEmail('');
    setPhone('');
    setCargo('');
    setLevel(3);
    _currentUser = null;
  }

  // Função para lidar com diferentes erros de autenticação
  void handleError(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        _textError = 'Email não encontrado!';
        break;
      case 'invalid-credential':
        _textError = 'Email/senha incorretos!';
        break;
      case 'too-many-requests':
        _textError =
            'Acesso a esta conta foi temporariamente desativado devido a muitas tentativas de login.';
        break;
      case 'user-disabled':
        _textError =
            'Essa conta está desativada, por favor entre em contato com o suporte.';
        break;
      default:
        _textError = 'Ocorreu um erro durante a autenticação.';
    }
    _isError = true;
  }
}
