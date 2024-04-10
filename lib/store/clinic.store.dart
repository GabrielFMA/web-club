import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mobx/mobx.dart';

part 'clinic.store.g.dart';

class ClinicStore = _ClinicStore with _$ClinicStore;

abstract class _ClinicStore with Store {
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
  String _address = '';

  @observable
  String _phone = '';

  @observable
  String _cnpj = '';

  @observable
  int _exam = 1;

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
  getExan(){
    return _exam;
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
  Future<void> registrationClinic() async {
    try {
      Map<String, dynamic> usuariosInfoMap = {
        "ID": _idClinic,
        "Nome": _name,
        "CNPJ": _cnpj,
        "Email": _email,
        "Telefone": _phone,
        "Endereco": _address,
      };
      await addDetailsUsers(usuariosInfoMap, _idClinic);
    } catch (e) {
      print('Erro ao fazer registro: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
  }

  @action
  Future addDetailsUsers(Map<String, dynamic> usuariosMap, String id) async {
    return await db.collection("Clinicas").doc(id).set(usuariosMap);
  }

  restoreData() {
    setIdClinic('');
    setName('');
    setCnpj('');
    setEmail('');
    setPhone('');
    setAddress('');
  }
}