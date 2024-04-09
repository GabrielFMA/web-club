// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientStore on _ClientStore, Store {
  late final _$isVisibleAtom =
      Atom(name: '_ClientStore.isVisible', context: context);

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_ClientStore.isError', context: context);

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
      Atom(name: '_ClientStore.textError', context: context);

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

  late final _$_currentUserAtom =
      Atom(name: '_ClientStore._currentUser', context: context);

  @override
  User? get _currentUser {
    _$_currentUserAtom.reportRead();
    return super._currentUser;
  }

  @override
  set _currentUser(User? value) {
    _$_currentUserAtom.reportWrite(value, super._currentUser, () {
      super._currentUser = value;
    });
  }

  late final _$_tokenAtom = Atom(name: '_ClientStore._token', context: context);

  @override
  String get _token {
    _$_tokenAtom.reportRead();
    return super._token;
  }

  @override
  set _token(String value) {
    _$_tokenAtom.reportWrite(value, super._token, () {
      super._token = value;
    });
  }

  late final _$_uidUserAtom =
      Atom(name: '_ClientStore._uidUser', context: context);

  @override
  String get _uidUser {
    _$_uidUserAtom.reportRead();
    return super._uidUser;
  }

  @override
  set _uidUser(String value) {
    _$_uidUserAtom.reportWrite(value, super._uidUser, () {
      super._uidUser = value;
    });
  }

  late final _$_nameAtom = Atom(name: '_ClientStore._name', context: context);

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

  late final _$_emailAtom = Atom(name: '_ClientStore._email', context: context);

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

  late final _$_cpfAtom = Atom(name: '_ClientStore._cpf', context: context);

  @override
  String get _cpf {
    _$_cpfAtom.reportRead();
    return super._cpf;
  }

  @override
  set _cpf(String value) {
    _$_cpfAtom.reportWrite(value, super._cpf, () {
      super._cpf = value;
    });
  }

  late final _$_passwordAtom =
      Atom(name: '_ClientStore._password', context: context);

  @override
  String get _password {
    _$_passwordAtom.reportRead();
    return super._password;
  }

  @override
  set _password(String value) {
    _$_passwordAtom.reportWrite(value, super._password, () {
      super._password = value;
    });
  }

  late final _$_phoneAtom = Atom(name: '_ClientStore._phone', context: context);

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

  late final _$_numContractAtom =
      Atom(name: '_ClientStore._numContract', context: context);

  @override
  String get _numContract {
    _$_numContractAtom.reportRead();
    return super._numContract;
  }

  @override
  set _numContract(String value) {
    _$_numContractAtom.reportWrite(value, super._numContract, () {
      super._numContract = value;
    });
  }

  late final _$registrationUserAsyncAction =
      AsyncAction('_ClientStore.registrationUser', context: context);

  @override
  Future<void> registrationUser() {
    return _$registrationUserAsyncAction.run(() => super.registrationUser());
  }

  late final _$addDetailsUsersAsyncAction =
      AsyncAction('_ClientStore.addDetailsUsers', context: context);

  @override
  Future<dynamic> addDetailsUsers(Map<String, dynamic> usuariosMap, String id) {
    return _$addDetailsUsersAsyncAction
        .run(() => super.addDetailsUsers(usuariosMap, id));
  }

  late final _$_ClientStoreActionController =
      ActionController(name: '_ClientStore', context: context);

  @override
  dynamic userUID() {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.userUID');
    try {
      return super.userUID();
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String name) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setName');
    try {
      return super.setName(name);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCPF(String cpf) {
    final _$actionInfo =
        _$_ClientStoreActionController.startAction(name: '_ClientStore.setCPF');
    try {
      return super.setCPF(cpf);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String password) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String phone) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setPhone');
    try {
      return super.setPhone(phone);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumContract(String numContract) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setNumContract');
    try {
      return super.setNumContract(numContract);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void visible() {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.visible');
    try {
      return super.visible();
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isVisible: ${isVisible},
isError: ${isError},
textError: ${textError}
    ''';
  }
}
