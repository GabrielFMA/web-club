// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientStore on _ClientStore, Store {
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

  late final _$_nomeAtom = Atom(name: '_ClientStore._nome', context: context);

  @override
  String get _nome {
    _$_nomeAtom.reportRead();
    return super._nome;
  }

  @override
  set _nome(String value) {
    _$_nomeAtom.reportWrite(value, super._nome, () {
      super._nome = value;
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

  late final _$_telefoneAtom =
      Atom(name: '_ClientStore._telefone', context: context);

  @override
  String get _telefone {
    _$_telefoneAtom.reportRead();
    return super._telefone;
  }

  @override
  set _telefone(String value) {
    _$_telefoneAtom.reportWrite(value, super._telefone, () {
      super._telefone = value;
    });
  }

  late final _$_numContratoAtom =
      Atom(name: '_ClientStore._numContrato', context: context);

  @override
  String get _numContrato {
    _$_numContratoAtom.reportRead();
    return super._numContrato;
  }

  @override
  set _numContrato(String value) {
    _$_numContratoAtom.reportWrite(value, super._numContrato, () {
      super._numContrato = value;
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

  late final _$cadastroUsuarioAsyncAction =
      AsyncAction('_ClientStore.cadastroUsuario', context: context);

  @override
  Future<void> cadastroUsuario() {
    return _$cadastroUsuarioAsyncAction.run(() => super.cadastroUsuario());
  }

  late final _$addDetalhesUsuariosAsyncAction =
      AsyncAction('_ClientStore.addDetalhesUsuarios', context: context);

  @override
  Future<dynamic> addDetalhesUsuarios(
      Map<String, dynamic> usuariosMap, String id) {
    return _$addDetalhesUsuariosAsyncAction
        .run(() => super.addDetalhesUsuarios(usuariosMap, id));
  }

  late final _$_ClientStoreActionController =
      ActionController(name: '_ClientStore', context: context);

  @override
  dynamic getEmail() {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.getEmail');
    try {
      return super.getEmail();
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getNome() {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.getNome');
    try {
      return super.getNome();
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCPF() {
    final _$actionInfo =
        _$_ClientStoreActionController.startAction(name: '_ClientStore.getCPF');
    try {
      return super.getCPF();
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getTelefone() {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.getTelefone');
    try {
      return super.getTelefone();
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPassword() {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.getPassword');
    try {
      return super.getPassword();
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic usuarioUID() {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.usuarioUID');
    try {
      return super.usuarioUID();
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
  void setNome(String nome) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setNome');
    try {
      return super.setNome(nome);
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
  void setTelefone(String telefone) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setTelefone');
    try {
      return super.setTelefone(telefone);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumContrato(String numContrato) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.setNumContrato');
    try {
      return super.setNumContrato(numContrato);
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
  void recuperacaoDados(String currentUser) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
        name: '_ClientStore.recuperacaoDados');
    try {
      return super.recuperacaoDados(currentUser);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isVisible: ${isVisible},
textError: ${textError},
isError: ${isError}
    ''';
  }
}
