// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:web_simclub/screen/auth/login.dart';
import 'package:web_simclub/screen/home_page.dart';

part 'auth.store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBlb1hQGuNgpJs0dkTKhAQ-l5YqS3XVM88';

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
  String _nome = '';

  @observable
  String _email = '';

  @observable
  String _password = '';

  @observable
  String _telefone = '';

  @observable
  String _numContrato = '';

  @observable
  String textError = ' ';

  @observable
  bool isError = false;

  //Get funções
  @action
  getEmail() {
    return _email;
  }

  @action
  getNome() {
    return _nome;
  }

  @action
  getCPF() {
    return _cpf;
  }

  @action
  getTelefone() {
    return _telefone;
  }

  @action
  getPassword() {
    return _password;
  }

  @action
  usuarioUID() {
    return _uidUser;
  }

  getTextError(){
    return textError;
  }

  getIsError(){
    return isError;
  }

  //Set funçoes
  @action
  void setCPF(String cpf) {
    this._cpf = cpf;
  }

  @action
  void setNome(String nome) {
    this._nome = nome;
  }

  @action
  void setEmail(String email) {
    this._email = email;
  }

  @action
  void setPassword(String password) {
    this._password = password;
  }

  @action
  void setTelefone(String telefone) {
    this._telefone = telefone;
  }

  @action
  void setNumContrato(String numContrato) {
    this._numContrato = numContrato;
  }

  //Password field
  @action
  void visible() {
    isVisible = !isVisible;
  }

  //Auth Firebase Funções
  @action
  Future<void> signInWithEmailPassword(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      // Usuário logado com sucesso
      print('Usuário logado com sucesso: ${credential.user!.uid}');
      _uidUser = credential.user!.uid;

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);

      textError = ' ';
      recuperacaoDados(_uidUser);
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
        textError = 'Acesso a esta conta foi temporariamente desativado devido a muitas tentativas de login.';
        isError = true;
        print('Muitas tentativas de login');
      }
    } catch (e) {
      print('Erro ao fazer login: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
  }

  @action
  Future<void> signUpWithEmailPassword(BuildContext context) async {
    try {
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

        await cadastroUsuario();

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
      }
    } catch (e) {
      print('Erro ao fazer registro: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
  }

  //Função para Deslogar
  @action
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _currentUser = null;
    } catch (e) {
      print(e);
    }
  }

  //Firestore db
  @action
  Future<void> cadastroUsuario() async {
    print("ID do usuario ${_uidUser}");
    try {
      Map<String, dynamic> usuariosInfoMap = {
        "ID": _uidUser,
        "Nome": _nome,
        "CPF": _cpf,
        "Email": _email,
        "Telefone": _telefone,
        "Contrato": _numContrato,
      };
      await addDetalhesUsuarios(usuariosInfoMap, _uidUser);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future addDetalhesUsuarios(
      Map<String, dynamic> usuariosMap, String id) async {
    return await db.collection("Usuarios").doc(id).set(usuariosMap);
  }

  //Setar dados após login
  @action
  void recuperacaoDados(String currentUser) {
    _uidUser = currentUser;
    try {
      db.collection(_uidUser);
      final docRef = db.collection("Usuarios").doc(_uidUser);
      docRef.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;

          setNome(data['Nome']);
          setEmail(data['Email']);
          setCPF(data['CPF']);
          setTelefone(data['Telefone']);
        },
        onError: (e) => print("Error getting document: $e"),
      );
    } catch (e) {
      print(e);
    }
  }
}

