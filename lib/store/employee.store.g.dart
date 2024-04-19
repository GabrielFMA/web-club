// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeeStore on _EmployeeStore, Store {
  late final _$isVisibleAtom =
      Atom(name: '_EmployeeStore.isVisible', context: context);

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

  late final _$_isErrorAtom =
      Atom(name: '_EmployeeStore._isError', context: context);

  @override
  bool get _isError {
    _$_isErrorAtom.reportRead();
    return super._isError;
  }

  @override
  set _isError(bool value) {
    _$_isErrorAtom.reportWrite(value, super._isError, () {
      super._isError = value;
    });
  }

  late final _$_textErrorAtom =
      Atom(name: '_EmployeeStore._textError', context: context);

  @override
  String get _textError {
    _$_textErrorAtom.reportRead();
    return super._textError;
  }

  @override
  set _textError(String value) {
    _$_textErrorAtom.reportWrite(value, super._textError, () {
      super._textError = value;
    });
  }

  late final _$_currentUserAtom =
      Atom(name: '_EmployeeStore._currentUser', context: context);

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

  late final _$_tokenAtom =
      Atom(name: '_EmployeeStore._token', context: context);

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
      Atom(name: '_EmployeeStore._uidUser', context: context);

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

  late final _$_nameAtom = Atom(name: '_EmployeeStore._name', context: context);

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
      Atom(name: '_EmployeeStore._email', context: context);

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

  late final _$_passwordAtom =
      Atom(name: '_EmployeeStore._password', context: context);

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

  late final _$_phoneAtom =
      Atom(name: '_EmployeeStore._phone', context: context);

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

  late final _$_positionAtom =
      Atom(name: '_EmployeeStore._position', context: context);

  @override
  String get _position {
    _$_positionAtom.reportRead();
    return super._position;
  }

  @override
  set _position(String value) {
    _$_positionAtom.reportWrite(value, super._position, () {
      super._position = value;
    });
  }

  late final _$_levelAtom =
      Atom(name: '_EmployeeStore._level', context: context);

  @override
  int get _level {
    _$_levelAtom.reportRead();
    return super._level;
  }

  @override
  set _level(int value) {
    _$_levelAtom.reportWrite(value, super._level, () {
      super._level = value;
    });
  }

  late final _$registrationUserAsyncAction =
      AsyncAction('_EmployeeStore.registrationUser', context: context);

  @override
  Future<void> registrationUser() {
    return _$registrationUserAsyncAction.run(() => super.registrationUser());
  }

  late final _$addDetailsUsersAsyncAction =
      AsyncAction('_EmployeeStore.addDetailsUsers', context: context);

  @override
  Future<dynamic> addDetailsUsers(Map<String, dynamic> userInfoMap, String id) {
    return _$addDetailsUsersAsyncAction
        .run(() => super.addDetailsUsers(userInfoMap, id));
  }

  late final _$duplicateEntryCheckAsyncAction =
      AsyncAction('_EmployeeStore.duplicateEntryCheck', context: context);

  @override
  Future<dynamic> duplicateEntryCheck() {
    return _$duplicateEntryCheckAsyncAction
        .run(() => super.duplicateEntryCheck());
  }

  late final _$_EmployeeStoreActionController =
      ActionController(name: '_EmployeeStore', context: context);

  @override
  String userUID() {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.userUID');
    try {
      return super.userUID();
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getLevel() {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.getLevel');
    try {
      return super.getLevel();
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String name) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setName');
    try {
      return super.setName(name);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String password) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String phone) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setPhone');
    try {
      return super.setPhone(phone);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPosition(String position) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setPosition');
    try {
      return super.setPosition(position);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLevel(int level) {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.setLevel');
    try {
      return super.setLevel(level);
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void visible() {
    final _$actionInfo = _$_EmployeeStoreActionController.startAction(
        name: '_EmployeeStore.visible');
    try {
      return super.visible();
    } finally {
      _$_EmployeeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isVisible: ${isVisible}
    ''';
  }
}
