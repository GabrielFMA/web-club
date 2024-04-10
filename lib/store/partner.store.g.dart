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

  late final _$_addressAtom =
      Atom(name: '_PartnerStore._address', context: context);

  @override
  String get _address {
    _$_addressAtom.reportRead();
    return super._address;
  }

  @override
  set _address(String value) {
    _$_addressAtom.reportWrite(value, super._address, () {
      super._address = value;
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
  int get _exam {
    _$_examAtom.reportRead();
    return super._exam;
  }

  @override
  set _exam(int value) {
    _$_examAtom.reportWrite(value, super._exam, () {
      super._exam = value;
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
  dynamic getAddress() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getAddress');
    try {
      return super.getAddress();
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
  void setAddress(String address) {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.setAddress');
    try {
      return super.setAddress(address);
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExam(int exam) {
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
