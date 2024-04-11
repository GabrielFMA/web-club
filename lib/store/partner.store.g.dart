// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PartnerStore on _PartnerStore, Store {
  late final _$isErrorAtom =
      Atom(name: '_PartnerStore.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$textErrorAtom =
      Atom(name: '_PartnerStore.textError', context: context);

  @override
  String get textError {
    _$textErrorAtom.reportRead();
    return super.textError;
  }

  @override
  set textError(String value) {
    _$textErrorAtom.reportWrite(value, super.textError, () {
      super.textError = value;
    });
  }

  late final _$_idClinicAtom =
      Atom(name: '_PartnerStore._idClinic', context: context);

  @override
  String get _idClinic {
    _$_idClinicAtom.reportRead();
    return super._idClinic;
  }

  @override
  set _idClinic(String value) {
    _$_idClinicAtom.reportWrite(value, super._idClinic, () {
      super._idClinic = value;
    });
  }

  late final _$_nameAtom = Atom(name: '_PartnerStore._name', context: context);

  @override
  String get _name {
    _$_nameAtom.reportRead();
    return super._name;
  }

  @override
  set _name(String value) {
    _$_nameAtom.reportWrite(value, super._name, () {
      super._name = value;
    });
  }

  late final _$_emailAtom =
      Atom(name: '_PartnerStore._email', context: context);

  @override
  String get _email {
    _$_emailAtom.reportRead();
    return super._email;
  }

  @override
  set _email(String value) {
    _$_emailAtom.reportWrite(value, super._email, () {
      super._email = value;
    });
  }

  late final _$_phoneAtom =
      Atom(name: '_PartnerStore._phone', context: context);

  @override
  String get _phone {
    _$_phoneAtom.reportRead();
    return super._phone;
  }

  @override
  set _phone(String value) {
    _$_phoneAtom.reportWrite(value, super._phone, () {
      super._phone = value;
    });
  }

  late final _$_cnpjAtom = Atom(name: '_PartnerStore._cnpj', context: context);

  @override
  String get _cnpj {
    _$_cnpjAtom.reportRead();
    return super._cnpj;
  }

  @override
  set _cnpj(String value) {
    _$_cnpjAtom.reportWrite(value, super._cnpj, () {
      super._cnpj = value;
    });
  }

  late final _$_examAtom = Atom(name: '_PartnerStore._exam', context: context);

  @override
  int? get _exam {
    _$_examAtom.reportRead();
    return super._exam;
  }

  @override
  set _exam(int? value) {
    _$_examAtom.reportWrite(value, super._exam, () {
      super._exam = value;
    });
  }

  late final _$_cepAtom = Atom(name: '_PartnerStore._cep', context: context);

  @override
  String get _cep {
    _$_cepAtom.reportRead();
    return super._cep;
  }

  @override
  set _cep(String value) {
    _$_cepAtom.reportWrite(value, super._cep, () {
      super._cep = value;
    });
  }

  late final _$_streetAtom =
      Atom(name: '_PartnerStore._street', context: context);

  @override
  String get _street {
    _$_streetAtom.reportRead();
    return super._street;
  }

  @override
  set _street(String value) {
    _$_streetAtom.reportWrite(value, super._street, () {
      super._street = value;
    });
  }

  late final _$_districtAtom =
      Atom(name: '_PartnerStore._district', context: context);

  @override
  String get _district {
    _$_districtAtom.reportRead();
    return super._district;
  }

  @override
  set _district(String value) {
    _$_districtAtom.reportWrite(value, super._district, () {
      super._district = value;
    });
  }

  late final _$_cityAtom = Atom(name: '_PartnerStore._city', context: context);

  @override
  String get _city {
    _$_cityAtom.reportRead();
    return super._city;
  }

  @override
  set _city(String value) {
    _$_cityAtom.reportWrite(value, super._city, () {
      super._city = value;
    });
  }

  late final _$_stateAtom =
      Atom(name: '_PartnerStore._state', context: context);

  @override
  String get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(String value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$_listExamAtom =
      Atom(name: '_PartnerStore._listExam', context: context);

  @override
  List<String> get _listExam {
    _$_listExamAtom.reportRead();
    return super._listExam;
  }

  bool __listExamIsInitialized = false;

  @override
  set _listExam(List<String> value) {
    _$_listExamAtom.reportWrite(
        value, __listExamIsInitialized ? super._listExam : null, () {
      super._listExam = value;
      __listExamIsInitialized = true;
    });
  }

  late final _$registrationClinicAsyncAction =
      AsyncAction('_PartnerStore.registrationClinic', context: context);

  @override
  Future<void> registrationClinic() {
    return _$registrationClinicAsyncAction
        .run(() => super.registrationClinic());
  }

  late final _$addDetailsClinicAsyncAction =
      AsyncAction('_PartnerStore.addDetailsClinic', context: context);

  @override
  Future<dynamic> addDetailsClinic(Map<String, dynamic> clinicMap, String id) {
    return _$addDetailsClinicAsyncAction
        .run(() => super.addDetailsClinic(clinicMap, id));
  }

  late final _$fetchClinicsAsyncAction =
      AsyncAction('_PartnerStore.fetchClinics', context: context);

  @override
  Future<List<Map<String, dynamic>>> fetchClinics() {
    return _$fetchClinicsAsyncAction.run(() => super.fetchClinics());
  }

  late final _$_PartnerStoreActionController =
      ActionController(name: '_PartnerStore', context: context);

  @override
  dynamic getidClinic() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getidClinic');
    try {
      return super.getidClinic();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getName() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getName');
    try {
      return super.getName();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getEmail() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getEmail');
    try {
      return super.getEmail();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCnpj() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getCnpj');
    try {
      return super.getCnpj();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPhone() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getPhone');
    try {
      return super.getPhone();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getExam() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getExam');
    try {
      return super.getExam();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getListExam() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getListExam');
    try {
      return super.getListExam();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCEP() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getCEP');
    try {
      return super.getCEP();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getStreet() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getStreet');
    try {
      return super.getStreet();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getDistrict() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getDistrict');
    try {
      return super.getDistrict();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCity() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getCity');
    try {
      return super.getCity();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getState() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getState');
    try {
      return super.getState();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdClinic(String idClinic) {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.setIdClinic');
    try {
      return super.setIdClinic(idClinic);
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String name) {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.setName');
    try {
      return super.setName(name);
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCnpj(String cnpj) {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.setCnpj');
    try {
      return super.setCnpj(cnpj);
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String phone) {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.setPhone');
    try {
      return super.setPhone(phone);
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCEP(String cep) {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.setCEP');
    try {
      return super.setCEP(cep);
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStreet(String street) {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.setStreet');
    try {
      return super.setStreet(street);
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDistrict(String district) {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.setDistrict');
    try {
      return super.setDistrict(district);
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String city) {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.setCity');
    try {
      return super.setCity(city);
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(String state) {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.setState');
    try {
      return super.setState(state);
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExam(int? exam) {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.setExam');
    try {
      return super.setExam(exam);
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListExam(List<String> listExam) {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.setListExam');
    try {
      return super.setListExam(listExam);
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isError: ${isError},
textError: ${textError}
    ''';
  }
}
