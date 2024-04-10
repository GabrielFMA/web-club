// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClinicStore on _ClinicStore, Store {
  late final _$isErrorAtom =
      Atom(name: '_ClinicStore.isError', context: context);

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
      Atom(name: '_ClinicStore.textError', context: context);

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
      Atom(name: '_ClinicStore._idClinic', context: context);

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

  late final _$_nameAtom = Atom(name: '_ClinicStore._name', context: context);

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

  late final _$_emailAtom = Atom(name: '_ClinicStore._email', context: context);

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
      Atom(name: '_ClinicStore._address', context: context);

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

  late final _$_phoneAtom = Atom(name: '_ClinicStore._phone', context: context);

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

  late final _$_cnpjAtom = Atom(name: '_ClinicStore._cnpj', context: context);

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

  late final _$_examAtom = Atom(name: '_ClinicStore._exam', context: context);

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

  late final _$registrationClinicAsyncAction =
      AsyncAction('_ClinicStore.registrationClinic', context: context);

  @override
  Future<void> registrationClinic() {
    return _$registrationClinicAsyncAction
        .run(() => super.registrationClinic());
  }

  late final _$addDetailsUsersAsyncAction =
      AsyncAction('_ClinicStore.addDetailsUsers', context: context);

  @override
  Future<dynamic> addDetailsUsers(Map<String, dynamic> usuariosMap, String id) {
    return _$addDetailsUsersAsyncAction
        .run(() => super.addDetailsUsers(usuariosMap, id));
  }

  late final _$_ClinicStoreActionController =
      ActionController(name: '_ClinicStore', context: context);

  @override
  dynamic getidClinic() {
    final _$actionInfo = _$_ClinicStoreActionController.startAction(
        name: '_ClinicStore.getidClinic');
    try {
      return super.getidClinic();
    } finally {
      _$_ClinicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getName() {
    final _$actionInfo = _$_ClinicStoreActionController.startAction(
        name: '_ClinicStore.getName');
    try {
      return super.getName();
    } finally {
      _$_ClinicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getEmail() {
    final _$actionInfo = _$_ClinicStoreActionController.startAction(
        name: '_ClinicStore.getEmail');
    try {
      return super.getEmail();
    } finally {
      _$_ClinicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCnpj() {
    final _$actionInfo = _$_ClinicStoreActionController.startAction(
        name: '_ClinicStore.getCnpj');
    try {
      return super.getCnpj();
    } finally {
      _$_ClinicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getAddress() {
    final _$actionInfo = _$_ClinicStoreActionController.startAction(
        name: '_ClinicStore.getAddress');
    try {
      return super.getAddress();
    } finally {
      _$_ClinicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPhone() {
    final _$actionInfo = _$_ClinicStoreActionController.startAction(
        name: '_ClinicStore.getPhone');
    try {
      return super.getPhone();
    } finally {
      _$_ClinicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getExan() {
    final _$actionInfo = _$_ClinicStoreActionController.startAction(
        name: '_ClinicStore.getExan');
    try {
      return super.getExan();
    } finally {
      _$_ClinicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdClinic(String idClinic) {
    final _$actionInfo = _$_ClinicStoreActionController.startAction(
        name: '_ClinicStore.setIdClinic');
    try {
      return super.setIdClinic(idClinic);
    } finally {
      _$_ClinicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String name) {
    final _$actionInfo = _$_ClinicStoreActionController.startAction(
        name: '_ClinicStore.setName');
    try {
      return super.setName(name);
    } finally {
      _$_ClinicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCnpj(String cnpj) {
    final _$actionInfo = _$_ClinicStoreActionController.startAction(
        name: '_ClinicStore.setCnpj');
    try {
      return super.setCnpj(cnpj);
    } finally {
      _$_ClinicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_ClinicStoreActionController.startAction(
        name: '_ClinicStore.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_ClinicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String phone) {
    final _$actionInfo = _$_ClinicStoreActionController.startAction(
        name: '_ClinicStore.setPhone');
    try {
      return super.setPhone(phone);
    } finally {
      _$_ClinicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddress(String address) {
    final _$actionInfo = _$_ClinicStoreActionController.startAction(
        name: '_ClinicStore.setAddress');
    try {
      return super.setAddress(address);
    } finally {
      _$_ClinicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExam(int exam) {
    final _$actionInfo = _$_ClinicStoreActionController.startAction(
        name: '_ClinicStore.setExam');
    try {
      return super.setExam(exam);
    } finally {
      _$_ClinicStoreActionController.endAction(_$actionInfo);
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
