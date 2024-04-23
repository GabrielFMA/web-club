// ignore_for_file: avoid_print, equal_keys_in_map

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'sell.store.g.dart';

class SellStore = _SellStore with _$SellStore;

abstract class _SellStore with Store {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late http.Response rsp;

  //Errors
  @observable
  bool _isError = false;

  @observable
  String _textError = '';

  //Sell
  @observable
  String _idSell = '';

  @observable
  String _name = '';

  @observable
  String _price = '';

  @observable
  String _description = '';

  // Get functions

  // Errors
  bool getIsError() => _isError;

  String getTextError() => _textError;

  // Info Sell
  @action
  String getidSell() => _idSell;

  @action
  String getName() => _name;

  @action
  String getPrice() => _price;

  @action
  String getDescription() => _description;

  // Set functions

  // Info Sell
  @action
  void setIdSell(String idSell) => _idSell = idSell;

  @action
  void setName(String name) => _name = name;

  @action
  void setPrice(String price) => _price = price;

  @action
  void setDescription(String description) => _description = description;

  @action
  Future<void> registrationSell() async {
    try {
      _idSell = generateRandomId();

      Map<String, dynamic> paternInfoMap = {
        "ID": _idSell,
        "Nome": _name,
        "Preço": _price,
        "Descrição": _description,
      };

      await addDetailsSell(paternInfoMap, _idSell);
    } catch (e) {
      print('Erro ao fazer registro: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
    restoreData();
  }

  @action
  Future addDetailsSell(Map<String, dynamic> sellMap, String id) async {
    await db.collection("Vendas").doc(id).set(sellMap);
  }

  // Função para gerar um ID aleatório
  String generateRandomId() {
    Random random = Random();
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZ0123456789';
    String randomId = '';
    for (var i = 0; i < 28; i++) {
      randomId += chars[random.nextInt(chars.length)];
    }
    return randomId;
  }

  @action
  Future<void> duplicateEntryCheck() async {
    try {
      final name = await FirebaseFirestore.instance
          .collection("Vendas")
          .where("Nome", isEqualTo: _name.toLowerCase())
          .get();

      if (name.docs.isNotEmpty) {
        _textError = 'Esse Venda já foi cadastrada';
        _isError = true;
      } else {
        _textError = '';
        _isError = false;
      }
    } catch (e) {
      print('Erro ao verificar duplicidades: $e');
      rethrow;
    }
  }

  restoreData() {
    setIdSell('');
    setName('');
    setPrice('');
    setDescription('');
  }
}
