// ignore_for_file: avoid_print

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
  bool isError = false;

  @observable
  String _textError = '';

  //Clinic
  @observable
  String _idClinic = '';

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
  bool getIsError() => isError;

  String getTextError() => _textError;

  // Info Clinic
  @action
  String getidClinic() => _idClinic;

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

  // Info Clinic
  @action
  void setIdClinic(String idClinic) => _idClinic = idClinic;

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
  Future<void> registrationClinic() async {
    try {
      _idClinic = generateRandomId();

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
        "ID": _idClinic,
        "Nome": _name,
        "CNPJ": _cnpj,
        "Email": _email,
        "Telefone": _phone,
        "Endereço": addressMap
      };

      Map<String, dynamic> examMap = _listExam
          .asMap()
          .map((index, exam) => MapEntry(index.toString(), exam));

      await addDetailsClinic(paternInfoMap, _idClinic);
      await addSubcollectionData(_idClinic, examMap);
    } catch (e) {
      print('Erro ao fazer registro: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
    restoreData();
  }

  @action
  Future addDetailsClinic(Map<String, dynamic> clinicMap, String id) async {
    await db.collection("Parceiros").doc(id).set(clinicMap);
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

  Future<void> addSubcollectionData(String clinicId, dynamic data) async {
    try {
      String documentId = generateRandomId();
      Map<String, dynamic> dataMap = {
        "Exames": data,
      };

      await db
          .collection("Parceiros")
          .doc(clinicId)
          .collection("Exames")
          .doc(documentId)
          .set(dataMap);
    } catch (e) {
      print('Erro ao adicionar dados à subcoleção: $e');
    }
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
        _textError = 'CEP inválido';
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
        print('CEP: $cep');
        print('Logradouro: $_street');
        print('Bairro: $_district');
        print('Cidade: $_city');
        print('Estado: $_state');
      }
    } on http.ClientException catch (_) {
      _textError = 'CEP inválido';
      isError = true;
      return;
    } catch (e) {
      print('Erro ao fazer registro do CEP: $e');
    }
  }

  restoreData() {
    setIdClinic('');
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
