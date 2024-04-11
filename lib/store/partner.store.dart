// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mobx/mobx.dart';
import 'dart:math';

part 'partner.store.g.dart';

class PartnerStore = _PartnerStore with _$PartnerStore;

abstract class _PartnerStore with Store {
  FirebaseFirestore db = FirebaseFirestore.instance;

  //Errors
  @observable
  bool isError = false;

  @observable
  String textError = '';

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
  String _district = '';

  @observable
  String _city = '';

  @observable
  String _state = '';

  @observable
  late List<String> _listExam;

  //Get functions
  //Errors
  getIsError() {
    return isError;
  }

  getTextError() {
    return textError;
  }

  //Info Users
  @action
  getidClinic() {
    return _idClinic;
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
  getCnpj() {
    return _cnpj;
  }

  @action
  getPhone() {
    return _phone;
  }

  @action
  getExam() {
    return _exam;
  }

  @action
  getListExam() {
    return _listExam;
  }

  @action
  getCEP(){
    return _cep;
  }

  @action
  getStreet(){
    return _street;
  }

  @action
  getDistrict(){
    return _district;
  }

  @action
  getCity(){
    return _city;
  }

  @action
  getState(){
    return _state;
  }

  //Set functions
  //Info Users
  @action
  void setIdClinic(String idClinic) {
    _idClinic = idClinic;
  }

  @action
  void setName(String name) {
    _name = name;
  }

  @action
  void setCnpj(String cnpj) {
    _cnpj = cnpj;
  }

  @action
  void setEmail(String email) {
    _email = email;
  }

  @action
  void setPhone(String phone) {
    _phone = phone;
  }

  @action
  void setCEP(String cep) {
    _cep = cep;
  }

  @action
  void setStreet(String street) {
    _street = street;
  }

  @action
  void setDistrict(String district) {
    _district = district;
  }

  @action
  void setCity(String city) {
    _city = city;
  }

  @action
  void setState(String state) {
    _state = state;
  }

  @action
  void setExam(int? exam) {
    _exam = exam;
  }

  @action
  void setListExam(List<String> listExam) {
    _listExam = listExam;
  }

  @action
  Future<void> registrationClinic() async {
    try {
      _idClinic = generateRandomId();
      Map<String, dynamic> clinicInfoMap = {
        "ID": _idClinic,
        "Nome": _name,
        "CNPJ": _cnpj,
        "Email": _email,
        "Telefone": _phone,
        "CEP": _cep,
        "Rua": _street,
        "Bairro": _district,
        "Cidade": _city,
        "Estado": _state
      };

      Map<String, dynamic> examMap = _listExam
          .asMap()
          .map((index, exam) => MapEntry(index.toString(), exam));

      await addDetailsClinic(clinicInfoMap, _idClinic);
      await addSubcollectionData(_idClinic, examMap);
    } catch (e) {
      print('Erro ao fazer registro: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
    restoreData();
  }

  @action
  Future addDetailsClinic(Map<String, dynamic> clinicMap, String id) async {
    return await db.collection("Parceiros").doc(id).set(clinicMap);
  }

  // Função para gerar um ID aleatório
  String generateRandomId() {
    Random random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZ0123456789';
    String randomId = '';
    for (var i = 0; i < 28; i++) {
      randomId += chars[random.nextInt(chars.length)];
    }
    return randomId;
  }

  Future<void> addSubcollectionData(String clinicId, dynamic data) async {
    try {
      // Gerar um ID aleatório para o documento dentro da subcoleção
      String documentId = generateRandomId();
      // Dados a serem adicionados
      Map<String, dynamic> dataMap = {
        "Exames": data,
      };

      // Adicionar os dados à subcoleção dentro da coleção "Clinicas"
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
  Future<List<Map<String, dynamic>>> fetchClinics() async {
    try {
      QuerySnapshot querySnapshot = await db.collection("Parceiros").get();
      List<Map<String, dynamic>> clinicDataList = [];

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> clinicData = {
          "ID": doc['ID'],
          "CNPJ": doc["CNPJ"],
          "Telefone": doc["Telefone"],
          "Email": doc["Email"],
          "CEP": doc["CEP"],
          "Rua": doc["Rua"],
          "Bairro": doc["Bairro"],
          "Cidade": doc["Cidade"],
          "Estado": doc["Estado"],
        };
        clinicDataList.add(clinicData);
        print(clinicDataList);
      });

      return clinicDataList;
    } catch (e) {
      print('Erro ao buscar clínicas: $e');
      return [];
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
  }
}