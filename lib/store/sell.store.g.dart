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

  late final _$_nameAtom = Atom(name: '_SellStore._name', context: context);

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

  late final _$_priceAtom = Atom(name: '_SellStore._price', context: context);

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

  late final _$_descriptionAtom =
      Atom(name: '_SellStore._description', context: context);

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

  late final _$duplicateEntryCheckAsyncAction =
      AsyncAction('_SellStore.duplicateEntryCheck', context: context);

  @override
  Future<void> duplicateEntryCheck() {
    return _$duplicateEntryCheckAsyncAction
        .run(() => super.duplicateEntryCheck());
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
  String getName() {
    final _$actionInfo =
        _$_SellStoreActionController.startAction(name: '_SellStore.getName');
    try {
      return super.getName();
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getPrice() {
    final _$actionInfo =
        _$_SellStoreActionController.startAction(name: '_SellStore.getPrice');
    try {
      return super.getPrice();
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getDescription() {
    final _$actionInfo = _$_SellStoreActionController.startAction(
        name: '_SellStore.getDescription');
    try {
      return super.getDescription();
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
  void setName(String name) {
    final _$actionInfo =
        _$_SellStoreActionController.startAction(name: '_SellStore.setName');
    try {
      return super.setName(name);
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String price) {
    final _$actionInfo =
        _$_SellStoreActionController.startAction(name: '_SellStore.setPrice');
    try {
      return super.setPrice(price);
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String description) {
    final _$actionInfo = _$_SellStoreActionController.startAction(
        name: '_SellStore.setDescription');
    try {
      return super.setDescription(description);
    } finally {
      _$_SellStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
