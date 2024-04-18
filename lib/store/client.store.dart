// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  // Verification
  @observable
  bool isVisible = false;

  // Errors
  @observable
  bool isError = false;

  @observable
  String _textError = '';

  // Info Users
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

  @observable
  String _cep = '';

  @observable
  String _street = '';

  @observable
  String _number = '';

  @observable
  String? _complement = '';

  @observable
  String _district = '';

  @observable
  String _city = '';

  @observable
  String _state = '';

  @observable
  bool trueCEP = false;

  // Get functions

  // Errors
  bool getIsError() => isError;

  String getTextError() => _textError;

  // Info Users
  @action
  String userUID() => _uidUser;

  @action
  String getCEP() => _cep;

  @action
  String getStreet() => _street;

  @action
  String getNumber() => _number;

  @action
  String? getComplement() => _complement;

  @action
  String getDistrict() => _district;

  @action
  String getCity() => _city;

  @action
  String getState() => _state;

  @action
  bool getTrueCEP() => trueCEP;

  // Set functions

  // Info Users
  @action
  void setName(String name) => _name = name;

  @action
  void setEmail(String email) => _email = email;

  @action
  void setCEP(String cep) => _cep = cep;

  @action
  void setNumber(String number) => _number = number;

  @action
  void setComplement(String? complement) => _complement = complement;

  @action
  void setCPF(String cpf) => _cpf = cpf;

  @action
  void setPassword(String password) => _password = password;

  @action
  void setPhone(String phone) => _phone = phone;

  @action
  void setNumContract(String numContract) => _numContract = numContract;

  @action
  void setStreet(String street) => _street = street;

  @action
  void setDistrict(String district) => _district = district;

  @action
  void setCity(String city) => _city = city;

  @action
  void setState(String state) => _state = state;

  @action
  void setTrueCEP(bool value) => trueCEP = value;

  // Password field
  @action
  void visible() => isVisible = !isVisible;

  // Auth Firebase Functions

  Future<void> signUpWithEmailPassword(BuildContext context) async {
    try {
      print('Registration: Name: $_name, Email: $_email, Password: $_password');
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
        _uidUser = responseData['localId'];

        await registrationUser();
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
      Map<String, dynamic> addressMap = {
        "CEP": _cep,
        "Street": _street,
        "Number": _number,
        "Complement": _complement,
        "District": _district,
        "City": _city,
        "State": _state
      };

      Map<String, dynamic> userInfoMap = {
        "ID": _uidUser,
        "Name": _name,
        "CPF": _cpf,
        "Email": _email,
        "Phone": _phone,
        "Contract": _numContract,
        "Address": addressMap
      };

      await addDetailsUsers(userInfoMap, _uidUser);
    } catch (e) {
      print('Error registering: $e');
      print('Exception type: ${e.runtimeType}');
    }
  }

  @action
  Future addDetailsUsers(Map<String, dynamic> userInfoMap, String id) async {
    await db.collection("Users").doc(id).set(userInfoMap);
  }

  @action
  Future duplicateEntryCheck() async {
    try {
      List<String> duplicates = [];

      Map<String, Future<QuerySnapshot>> queries = {
        'Email': FirebaseFirestore.instance
            .collection("Usuarios")
            .where("Email", isEqualTo: _email.toLowerCase())
            .get(),
        'CPF': FirebaseFirestore.instance
            .collection("Usuarios")
            .where("CPF", isEqualTo: _cpf.toLowerCase())
            .get(),
        'Contrato': FirebaseFirestore.instance
            .collection("Usuarios")
            .where("Contrato", isEqualTo: _numContract.toLowerCase())
            .get(),
      };

      await Future.forEach(queries.entries, (entry) async {
        QuerySnapshot snapshot = await entry.value;
        if (snapshot.docs.isNotEmpty) {
          duplicates.add(entry.key);
        }
      });

      if (duplicates.isNotEmpty) {
        _textError = duplicates.join(', ');
        if (duplicates.length > 1) {
          int lastCommaIndex = _textError.lastIndexOf(',');
          _textError = _textError.replaceRange(
            lastCommaIndex,
            lastCommaIndex + 1,
            ' e',
          );
        }
        _textError += duplicates.length > 1
            ? ' já foram cadastrados'
            : ' já foi cadastrado';
        isError = true;
      } else {
        _textError = '';
        isError = false;
      }
    } catch (e) {
      print('Erro ao verificar duplicidades: $e');
      rethrow;
    }
  }

  @action
  Future<void> searchCep(String cep) async {
    print('CEP');
    try {
      _textError = '';
      isError = false;
      restoreData();
      var rsp =
          await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));

      if (rsp.body.contains('"erro": true')) {
        _textError = 'Invalid CEP';
        isError = true;
        return;
      } else {
        Map<String, dynamic> responseData = json.decode(rsp.body);

        _cep = responseData['cep'];
        _street = responseData['logradouro'];
        _district = responseData['bairro'];
        _city = responseData['localidade'];
        _state = responseData['uf'];

        trueCEP = true;
      }
    } on http.ClientException catch (_) {
      _textError = 'Invalid CEP';
      isError = true;
      return;
    } catch (e) {
      print('Error registering CEP: $e');
    }
  }

  restoreData() {
    setName('');
    setCPF('');
    setEmail('');
    setPhone('');
    setCEP('');
    setStreet('');
    setNumber('');
    setComplement('');
    setDistrict('');
    setCity('');
    setState('');
    setTrueCEP(false);
    _textError = '';
  }
}
