// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SellStore on _SellStore, Store {
  late final _$_isErrorAtom =
      Atom(name: '_SellStore._isError', context: context);

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
      Atom(name: '_SellStore._textError', context: context);

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

  late final _$_idSellAtom = Atom(name: '_SellStore._idSell', context: context);

  @override
  String get _idSell {
    _$_idSellAtom.reportRead();
    return super._idSell;
  }

  @override
  set _idSell(String value) {
    _$_idSellAtom.reportWrite(value, super._idSell, () {
      super._idSell = value;
    });
  }

  late final _$_planAtom = Atom(name: '_SellStore._plan', context: context);

  @override
  String get _plan {
    _$_planAtom.reportRead();
    return super._plan;
  }

  @override
  set _plan(String value) {
    _$_planAtom.reportWrite(value, super._plan, () {
      super._plan = value;
    });
  }

  late final _$_contractAtom =
      Atom(name: '_SellStore._contract', context: context);

  @override
  String get _contract {
    _$_contractAtom.reportRead();
    return super._contract;
  }

  @override
  set _contract(String value) {
    _$_contractAtom.reportWrite(value, super._contract, () {
      super._contract = value;
    });
  }

  late final _$_validityAtom =
      Atom(name: '_SellStore._validity', context: context);

  @override
  String get _validity {
    _$_validityAtom.reportRead();
    return super._validity;
  }

  @override
  set _validity(String value) {
    _$_validityAtom.reportWrite(value, super._validity, () {
      super._validity = value;
    });
  }

  late final _$_employeeAtom =
      Atom(name: '_SellStore._employee', context: context);

  @override
  String get _employee {
    _$_employeeAtom.reportRead();
    return super._employee;
  }

  @override
  set _employee(String value) {
    _$_employeeAtom.reportWrite(value, super._employee, () {
      super._employee = value;
    });
  }

  late final _$_clientAtom = Atom(name: '_SellStore._client', context: context);

  @override
  String get _client {
    _$_clientAtom.reportRead();
    return super._client;
  }

  @override
  set _client(String value) {
    _$_clientAtom.reportWrite(value, super._client, () {
      super._client = value;
    });
  }

  late final _$_clientIdAtom =
      Atom(name: '_SellStore._clientId', context: context);

  @override
  String get _clientId {
    _$_clientIdAtom.reportRead();
    return super._clientId;
  }

  @override
  set _clientId(String value) {
    _$_clientIdAtom.reportWrite(value, super._clientId, () {
      super._clientId = value;
    });
  }

  late final _$planNamesAtom =
      Atom(name: '_SellStore.planNames', context: context);

  @override
  List<String> get planNames {
    _$planNamesAtom.reportRead();
    return super.planNames;
  }

  @override
  set planNames(List<String> value) {
    _$planNamesAtom.reportWrite(value, super.planNames, () {
      super.planNames = value;
    });
  }

  late final _$registrationSellAsyncAction =
      AsyncAction('_SellStore.registrationSell', context: context);

  @override
  Future<void> registrationSell() {
    return _$registrationSellAsyncAction.run(() => super.registrationSell());
  }

  late final _$addDetailsSellAsyncAction =
      AsyncAction('_SellStore.addDetailsSell', context: context);

  @override
  Future<dynamic> addDetailsSell(Map<String, dynamic> sellMap, String id) {
    return _$addDetailsSellAsyncAction
        .run(() => super.addDetailsSell(sellMap, id));
  }

  late final _$_SellStoreActionController =
      ActionController(name: '_SellStore', context: context);

  @override
  String getidSell() {
    final _$actionInfo =
        _$_SellStoreActionController.startAction(name: '_SellStore.getidSell');
    try {
      return super.getidSell();
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getPlan() {
    final _$actionInfo =
        _$_SellStoreActionController.startAction(name: '_SellStore.getPlan');
    try {
      return super.getPlan();
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getContract() {
    final _$actionInfo = _$_SellStoreActionController.startAction(
        name: '_SellStore.getContract');
    try {
      return super.getContract();
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getValidity() {
    final _$actionInfo = _$_SellStoreActionController.startAction(
        name: '_SellStore.getValidity');
    try {
      return super.getValidity();
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getClient() {
    final _$actionInfo =
        _$_SellStoreActionController.startAction(name: '_SellStore.getClient');
    try {
      return super.getClient();
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<String> getPlanNames() {
    final _$actionInfo = _$_SellStoreActionController.startAction(
        name: '_SellStore.getPlanNames');
    try {
      return super.getPlanNames();
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdSell(String idSell) {
    final _$actionInfo =
        _$_SellStoreActionController.startAction(name: '_SellStore.setIdSell');
    try {
      return super.setIdSell(idSell);
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlan(String plan) {
    final _$actionInfo =
        _$_SellStoreActionController.startAction(name: '_SellStore.setPlan');
    try {
      return super.setPlan(plan);
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setContract(String contract) {
    final _$actionInfo = _$_SellStoreActionController.startAction(
        name: '_SellStore.setContract');
    try {
      return super.setContract(contract);
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValidity(String validity) {
    final _$actionInfo = _$_SellStoreActionController.startAction(
        name: '_SellStore.setValidity');
    try {
      return super.setValidity(validity);
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmployee(String employee) {
    final _$actionInfo = _$_SellStoreActionController.startAction(
        name: '_SellStore.setEmployee');
    try {
      return super.setEmployee(employee);
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClient(String client) {
    final _$actionInfo =
        _$_SellStoreActionController.startAction(name: '_SellStore.setClient');
    try {
      return super.setClient(client);
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
planNames: ${planNames}
    ''';
  }
}
