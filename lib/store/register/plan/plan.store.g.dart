// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlanStore on _PlanStore, Store {
  late final _$_isErrorAtom =
      Atom(name: '_PlanStore._isError', context: context);

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
      Atom(name: '_PlanStore._textError', context: context);

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

  late final _$_idPlanAtom = Atom(name: '_PlanStore._idPlan', context: context);

  @override
  String get _idPlan {
    _$_idPlanAtom.reportRead();
    return super._idPlan;
  }

  @override
  set _idPlan(String value) {
    _$_idPlanAtom.reportWrite(value, super._idPlan, () {
      super._idPlan = value;
    });
  }

  late final _$_nameAtom = Atom(name: '_PlanStore._name', context: context);

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

  late final _$_priceAtom = Atom(name: '_PlanStore._price', context: context);

  @override
  String get _price {
    _$_priceAtom.reportRead();
    return super._price;
  }

  @override
  set _price(String value) {
    _$_priceAtom.reportWrite(value, super._price, () {
      super._price = value;
    });
  }

  late final _$_depPriceAtom =
      Atom(name: '_PlanStore._depPrice', context: context);

  @override
  String get _depPrice {
    _$_depPriceAtom.reportRead();
    return super._depPrice;
  }

  @override
  set _depPrice(String value) {
    _$_depPriceAtom.reportWrite(value, super._depPrice, () {
      super._depPrice = value;
    });
  }

  late final _$_descriptionAtom =
      Atom(name: '_PlanStore._description', context: context);

  @override
  String get _description {
    _$_descriptionAtom.reportRead();
    return super._description;
  }

  @override
  set _description(String value) {
    _$_descriptionAtom.reportWrite(value, super._description, () {
      super._description = value;
    });
  }

  late final _$_planNumberAtom =
      Atom(name: '_PlanStore._planNumber', context: context);

  @override
  int get _planNumber {
    _$_planNumberAtom.reportRead();
    return super._planNumber;
  }

  @override
  set _planNumber(int value) {
    _$_planNumberAtom.reportWrite(value, super._planNumber, () {
      super._planNumber = value;
    });
  }

  late final _$registrationPlanAsyncAction =
      AsyncAction('_PlanStore.registrationPlan', context: context);

  @override
  Future<void> registrationPlan() {
    return _$registrationPlanAsyncAction.run(() => super.registrationPlan());
  }

  late final _$addDetailsPlanAsyncAction =
      AsyncAction('_PlanStore.addDetailsPlan', context: context);

  @override
  Future<dynamic> addDetailsPlan(Map<String, dynamic> planMap, String id) {
    return _$addDetailsPlanAsyncAction
        .run(() => super.addDetailsPlan(planMap, id));
  }

  late final _$duplicateEntryCheckAsyncAction =
      AsyncAction('_PlanStore.duplicateEntryCheck', context: context);

  @override
  Future<void> duplicateEntryCheck() {
    return _$duplicateEntryCheckAsyncAction
        .run(() => super.duplicateEntryCheck());
  }

  late final _$_PlanStoreActionController =
      ActionController(name: '_PlanStore', context: context);

  @override
  String getidPlan() {
    final _$actionInfo =
        _$_PlanStoreActionController.startAction(name: '_PlanStore.getidPlan');
    try {
      return super.getidPlan();
    } finally {
      _$_PlanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getName() {
    final _$actionInfo =
        _$_PlanStoreActionController.startAction(name: '_PlanStore.getName');
    try {
      return super.getName();
    } finally {
      _$_PlanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getPrice() {
    final _$actionInfo =
        _$_PlanStoreActionController.startAction(name: '_PlanStore.getPrice');
    try {
      return super.getPrice();
    } finally {
      _$_PlanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getDepPrice() {
    final _$actionInfo = _$_PlanStoreActionController.startAction(
        name: '_PlanStore.getDepPrice');
    try {
      return super.getDepPrice();
    } finally {
      _$_PlanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getDescription() {
    final _$actionInfo = _$_PlanStoreActionController.startAction(
        name: '_PlanStore.getDescription');
    try {
      return super.getDescription();
    } finally {
      _$_PlanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getPlanNumber() {
    final _$actionInfo = _$_PlanStoreActionController.startAction(
        name: '_PlanStore.getPlanNumber');
    try {
      return super.getPlanNumber();
    } finally {
      _$_PlanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdPlan(String idPlan) {
    final _$actionInfo =
        _$_PlanStoreActionController.startAction(name: '_PlanStore.setIdPlan');
    try {
      return super.setIdPlan(idPlan);
    } finally {
      _$_PlanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String name) {
    final _$actionInfo =
        _$_PlanStoreActionController.startAction(name: '_PlanStore.setName');
    try {
      return super.setName(name);
    } finally {
      _$_PlanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String price) {
    final _$actionInfo =
        _$_PlanStoreActionController.startAction(name: '_PlanStore.setPrice');
    try {
      return super.setPrice(price);
    } finally {
      _$_PlanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepPrice(String depPrice) {
    final _$actionInfo = _$_PlanStoreActionController.startAction(
        name: '_PlanStore.setDepPrice');
    try {
      return super.setDepPrice(depPrice);
    } finally {
      _$_PlanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String description) {
    final _$actionInfo = _$_PlanStoreActionController.startAction(
        name: '_PlanStore.setDescription');
    try {
      return super.setDescription(description);
    } finally {
      _$_PlanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlanNumber(int planNumber) {
    final _$actionInfo = _$_PlanStoreActionController.startAction(
        name: '_PlanStore.setPlanNumber');
    try {
      return super.setPlanNumber(planNumber);
    } finally {
      _$_PlanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
