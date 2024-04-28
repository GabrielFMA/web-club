// ignore_for_file: avoid_print, equal_keys_in_map, library_private_types_in_public_api, non_constant_identifier_names

import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'partner.store.g.dart';

class PartnerStore = _PartnerStore with _$PartnerStore;

abstract class _PartnerStore with Store {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late http.Response rsp;

  //Errors
  @observable
  bool _isError = false;

  @observable
  String _textError = '';

  //Partner
  @observable
  String _idPartner = '';

  @observable
  String _name = '';

  @observable
  String _email = '';

  @observable
  String _phone = '';

  @observable
  String _cnpj = '';

  @observable
  int? _exam = 1;

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

  @observable
  late List<String> _listExam;

  // Get functions

  // Errors
  bool getIsError() => _isError;

  String getTextError() => _textError;

  // Info Partner
  @action
  String getidPartner() => _idPartner;

  @action
  String getName() => _name;

  @action
  String getEmail() => _email;

  @action
  String getCnpj() => _cnpj;

  @action
  String getPhone() => _phone;

  @action
  int? getExam() => _exam;

  @action
  List<String> getListExam() => _listExam;

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

  // Info Partner
  @action
  void setIdPartner(String idPartner) => _idPartner = idPartner;

  @action
  void setName(String name) => _name = name;

  @action
  void setCnpj(String cnpj) => _cnpj = cnpj;

  @action
  void setEmail(String email) => _email = email;

  @action
  void setPhone(String phone) => _phone = phone;

  @action
  void setCEP(String cep) => _cep = cep;

  @action
  void setNumber(String number) => _number = number;

  @action
  void setComplement(String? complement) => _complement = complement;

  @action
  void setStreet(String street) => _street = street;

  @action
  void setDistrict(String district) => _district = district;

  @action
  void setCity(String city) => _city = city;

  @action
  void setState(String state) => _state = state;

  @action
  void setExam(int? exam) => _exam = exam;

  @action
  void setListExam(List<String> listExam) => _listExam = listExam;

  @action
  void setTrueCEP(bool value) => trueCEP = value;

  @action
  Future<void> registrationPartner() async {
    try {
      _idPartner = generateRandomId();

      Map<String, dynamic> examMap = _listExam
          .asMap()
          .map((index, exam) => MapEntry(index.toString(), exam));

      Map<String, dynamic> addressMap = {
        "CEP": _cep,
        "Rua": _street,
        "Numero": _number,
        "Complemento": _complement,
        "Bairro": _district,
        "Cidade": _city,
        "Estado": _state
      };

      Map<String, dynamic> paternInfoMap = {
        "ID": _idPartner,
        "Nome": _name.toLowerCase(),
        "CNPJ": _cnpj,
        "Email": _email.toLowerCase(),
        "Telefone": _phone,
        "Endereço": addressMap,
        "Consultas": examMap
      };

      await addDetailsPartner(paternInfoMap, _idPartner);
    } catch (e) {
      print('Erro ao fazer registro: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
    restoreData();
  }

  @action
  Future addDetailsPartner(Map<String, dynamic> PartnerMap, String id) async {
    await db.collection("Parceiros").doc(id).set(PartnerMap);
  }

  // Função para gerar um ID aleatório
  String generateRandomId() {
    Random random = Random();
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZ0123456789';
    String randomId = '';
    for (var i = 0; i < 28; i++) {
      randomId += chars[random.nextInt(chars.length)];
    }
    return randomId;
  }

  @action
  Future duplicateEntryCheck() async {
    try {
      List<String> duplicates = [];

      Map<String, Future<QuerySnapshot>> queries = {
        'Nome': FirebaseFirestore.instance
            .collection("Parceiros")
            .where("Nome", isEqualTo: _name.toLowerCase())
            .get(),
        'Email': FirebaseFirestore.instance
            .collection("Parceiros")
            .where("Email", isEqualTo: _email.toLowerCase())
            .get(),
        'CNPJ': FirebaseFirestore.instance
            .collection("Parceiros")
            .where("CNPJ", isEqualTo: _cnpj.toLowerCase())
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

  @action
  Future<void> searchCep(String cep) async {
    print('CEP');
    try {
      _textError = '';
      _isError = false;
      restoreData();
      var rsp =
          await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));

      if (rsp.body.contains('"erro": true')) {
        _textError = 'CEP inválido';
        _isError = true;
        return;
      } else {
        Map<String, dynamic> responseData = json.decode(rsp.body);

        _cep = responseData['cep'];
        _street = responseData['logradouro'];
        _district = responseData['bairro'];
        _city = responseData['localidade'];
        _state = responseData['uf'];

        trueCEP = true;
        print('CEP: $cep');
        print('Logradouro: $_street');
        print('Bairro: $_district');
        print('Cidade: $_city');
        print('Estado: $_state');
      }
    } on http.ClientException catch (_) {
      _textError = 'CEP inválido';
      _isError = true;
      return;
    } catch (e) {
      print('Erro ao fazer registro do CEP: $e');
    }
  }

  restoreData() {
    setIdPartner('');
    setName('');
    setCnpj('');
    setEmail('');
    setPhone('');
    setCEP('');
    setStreet('');
    setDistrict('');
    setCity('');
    setState('');
    setTrueCEP(false);
  }
}
