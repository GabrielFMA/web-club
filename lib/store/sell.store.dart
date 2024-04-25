// ignore_for_file: avoid_print, equal_keys_in_map, unnecessary_string_interpolations

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
  String _plan = '';

  @observable
  String _contract = '';

  @observable
  String _validity = '';

  //Employee
  @observable
  String _employee = '';

  //Client
  @observable
  String _client = '';

  @observable
  String _clientId = '';

  //Plans
  @observable
  List<String> planNames = [];

  // Get functions

  // Errors
  bool getIsError() => _isError;

  String getTextError() => _textError;

  // Info Sell
  @action
  String getidSell() => _idSell;

  @action
  String getPlan() => _plan;

  @action
  String getContract() => _contract;

  @action
  String getValidity() => _validity;

  //Client
  @action
  String getClient() => _client;

  //Plans
  @action
  List<String> getPlanNames() => planNames;

  // Set functions

  // Info Sell
  @action
  void setIdSell(String idSell) => _idSell = idSell;

  @action
  void setPlan(String plan) => _plan = plan;

  @action
  void setContract(String contract) => _contract = contract;

  @action
  void setValidity(String validity) => _validity = validity;

  //Employee
  @action
  void setEmployee(String employee) => _employee = employee;

  //Client
  @action
  void setClient(String client) => _client = client;

  @action
  Future<void> registrationSell() async {
    try {
      _idSell = generateRandomId();

      Map<String, dynamic> paternInfoMap = {
        "ID": _idSell,
        "Vendedor": _employee,
        "Cliente": _client,
        "Plano": _plan,
        "Contrato": _contract,
        "Validade": _validity,
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

  Future<void> clientCheck() async {
    try {
      _isError = false;
      await idCheck("CPF");
      await idCheck("RG");
      await idCheck("Email");

      await updateClientInfo("Plano", _plan);
      await updateClientInfo("Nível do Plano", "1");
    } catch (e) {
      _textError = "Não foi possivel encontrar um cliente com esses dados.";
      _isError = true;
      print("Ocorreu um erro: $e");
    }
  }

  Future<void> idCheck(String value) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Usuarios")
        .where(value, isEqualTo: _client.toLowerCase())
        .get();
    if (snapshot.docs.isNotEmpty) {
      _clientId = snapshot.docs[0].id;
      print("$value válido. ID do documento: $_clientId");
    } else {
      print("Nenhum $value foi encontrado.");
    }
  }

  Future<void> planNameSearch() async {
    try {
      final partnerCollection = db.collection("Planos");
      final snapshot = await partnerCollection.get();

      planNames.clear();

      var index = 0;
      while (index < snapshot.docs.length) {
        final doc = snapshot.docs[index];
        final data = doc.data();
        final name = data['Nome'];
        if (name != null) {
          planNames.add(name);
        }
        index++;
      }
      print("$planNames valor0");
    } catch (e) {
      print('Erro ao buscar os dados dos parceiros: $e');
    }
  }

  Future<void> updateClientInfo(String value1, String value) async {
    await FirebaseFirestore.instance
        .collection("Usuarios")
        .doc(_clientId)
        .update({value1: value});
    print("$value1: $value");
  }

  restoreData() {
    setIdSell('');
    setEmployee('');
    setClient('');
    setPlan('');
    setContract('');
    setValidity('');
  }
}
