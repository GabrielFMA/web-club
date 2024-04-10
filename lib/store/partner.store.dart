// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mobx/mobx.dart';

part 'partner.store.g.dart';

class PartnerStore = _PartnerStore with _$PartnerStore;

abstract class _PartnerStore with Store {
  FirebaseFirestore db = FirebaseFirestore.instance;
  // late DocumentReference _documentReference;
  // late CollectionReference _referenceExam;

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
  String _address = '';

  @observable
  String _phone = '';

  @observable
  String _cnpj = '';

  @observable
  int _exam = 1;

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
  getAddress() {
    return _address;
  }

  @action
  getPhone() {
    return _phone;
  }

  @action
  getExam(){
    return _exam;
  }

  @action
  getListExam(){
    return _listExam;
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
  void setAddress(String address) {
    _address = address;
  }

  @action
  void setExam(int exam){
    _exam = exam;
  }

  @action
  void setListExam(List<String> listExam){
    _listExam = listExam; 
  }

  @action
  Future<void> registrationClinic() async {
    try {
      Map<String, dynamic> clinicInfoMap = {
        "ID": _idClinic,
        "Nome": _name,
        "CNPJ": _cnpj,
        "Email": _email,
        "Telefone": _phone,
        "Endereco": _address,
      };

      await addDetailsClinic(clinicInfoMap, _idClinic);
    } catch (e) {
      print('Erro ao fazer registro: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
  }

  @action
  Future addDetailsClinic(Map<String, dynamic> clinicMap, String id) async {
    return await db.collection("Clinicas").doc(id).set(clinicMap);
  }

  //  @action
  // Future addDetailsExam(Map<String, dynamic> examMap, String id) async {
  //   _documentReference = FirebaseFirestore.instance.collection('Clinicas').doc('clinicasteste');
  //   _referenceExam = _documentReference.collection('Exames').add;

    
  //   return await db.collection("Clinicas").doc(id).set(examMap);
  // }

  restoreData() {
    setIdClinic('');
    setName('');
    setCnpj('');
    setEmail('');
    setPhone('');
    setAddress('');
  }
}