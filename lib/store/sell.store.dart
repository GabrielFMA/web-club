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
  String _contract = '';

  @observable
  String _budget = '';

  @observable
  bool _trueBudget = false;

  //Plan
  @observable
  String _plan = '';

  @observable
  int _planLevel = 0;

  Map<String, dynamic> planMap = {};

  //Employee
  @observable
  String _employee = '';

  //Client
  @observable
  String _client = '';

  @observable
  String _clientId = '';

  @observable
  String _clientName = '';

  @observable
  String _clientCPF = '';

  @observable
  String _clientRG = '';

  @observable
  String _clientEmail = '';

  @observable
  bool _trueClient = false;

  Map<String, dynamic> clientMap = {};

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
  String getContract() => _contract;

  @action
  bool trueBudget() => _trueBudget;

  //Plan
  @action
  String getPlan() => _plan;

  //Client
  @action
  String getClient() => _client;

  @action
  String getClientName() => _clientName;

  @action
  String getClientCPF() => _clientCPF;

  @action
  String getClientRG() => _clientRG;

  @action
  String getClientEmail() => _clientEmail;

  @action
  bool trueClient() => _trueClient;

  //Plans
  @action
  List<String> getPlanNames() => planNames;

  // Set functions

  // Info Sell
  @action
  void setIdSell(String idSell) => _idSell = idSell;

  @action
  void setContract(String contract) => _contract = contract;

  @action
  void setTrueBudget(bool trueBudget) => _trueBudget = trueBudget;

  //Plan
  @action
  void setPlan(String plan) => _plan = plan;

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
      await planDataCheck();

      Map<String, dynamic> sellInfoMap = {
        "ID": _idSell,
        "Vendedor": _employee,
        "Cliente": clientMap,
        "Plano": planMap,
        "Contrato": _contract,
      };

      print(clientMap);
      print(planMap);

      await addDetailsSell(sellInfoMap, _idSell);
      await updateClientInfo("Plano", _plan);
      await updateClientInfo("Nivel do plano", _planLevel);
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
  
  Future<void> updateClientInfo(value1, value) async {
    await FirebaseFirestore.instance
        .collection("Usuarios")
        .doc(_clientId)
        .update({value1: value});
    print("$value1: $value");
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

  Future<void> budgetCheck(value) async {
    try {
      _isError = false;
      _trueBudget = false;
      _client = "";
      await budgetSearch(value);
      if (_client.isEmpty) {
        _textError = "Não foi possível encontrar o orçamento.";
        _isError = true;
        _trueBudget = false;
      } else {
        _textError = "";
        _isError = false;
        _trueBudget = true;
        await clientDataCheck(_client);
      }
    } catch (e) {
      _textError = "Ocorreu um erro ao buscar o orçamento: $e";
      _isError = true;
      print("Ocorreu um erro: $e");
    }
  }

  Future<void> budgetSearch(value) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("Orçamentos")
        .doc(value)
        .get();
    if (snapshot.exists) {
      _client = snapshot.get('CPF');
      print("$value válido. CPF do cliente: $_client");
    } else {
      print("Nenhum $value foi encontrado.");
    }
    DocumentSnapshot snapshot2 = await FirebaseFirestore.instance
        .collection("Orçamentos")
        .doc(value)
        .get();
    if (snapshot2.exists) {
      _plan = snapshot2.get('Plano');
      print("$value válido. Plan do cliente: $_plan");
    } else {
      print("Nenhum $value foi encontrado.");
    }
  }

  Future<void> clientDataCheck(client) async {
    try {
      _trueClient = false;
      _clientId = "";
      await clientIdSearch("CPF", client);
      await clientIdSearch("RG", client);
      await clientIdSearch("Email", client);
      if (_clientId.isEmpty) {
        _textError = "Não foi possivel encontrar um cliente com esses dados.";
        _isError = true;
      } else {
        _textError = "";
        _isError = false;
        _trueClient = true;
      }
    } catch (e) {
      print("Ocorreu um erro: $e");
    }
  }

  Future<void> clientIdSearch(value, client) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Usuarios")
        .where(value, isEqualTo: client.toLowerCase())
        .get();
    if (snapshot.docs.isNotEmpty) {
      var doc = snapshot.docs[0];
      _clientId = doc.id;
      _clientName = doc['Nome'];
      _clientCPF = doc['CPF'];
      _clientRG = doc['RG'];
      _clientEmail = doc['Email'];
      print(
          "$value válido. Id: $_clientId, Nome: $_clientName, CPF:  $_clientCPF, RG:  $_clientRG, Email:  $_clientEmail");

      clientMap = {
        "ID": _clientId,
        "Nome": _clientName,
        "CPF": _clientCPF,
        "RG": _clientRG,
        "Email": _clientEmail,
      };
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
    } catch (e) {
      print('Erro ao buscar os dados dos Planos: $e');
    }
  }

  Future<void> planDataCheck() async {
    try {
      await planIdSearch("Nome");
    } catch (e) {
      print("Ocorreu um erro: $e");
    }
  }

  Future<void> planIdSearch(value) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Planos")
        .where(value, isEqualTo: _plan)
        .get();

    if (snapshot.docs.isNotEmpty) {
      var doc = snapshot.docs[0];
      _planLevel = doc['Nivel do plano'];
      String planDescription = doc['Descrição'];
      String planId = doc['ID'];
      String planPrice = doc['Preço'];
      print(
          "$_plan válido. Nível do plano: $_planLevel, Descrição do plano: $planDescription, Id do plano: $planId e o Preço do plano: $planPrice");
      planMap = {
        "ID": planId,
        "Nome": _plan,
        "Level do Plano": _planLevel,
        "Preço": planPrice,
        "Descrição": planDescription,
      };
    } else {
      // Se nenhum documento corresponder à consulta
      print("Nenhum $_plan foi encontrado.");
    }
  }

  restoreData() {
    setIdSell('');
    setEmployee('');
    setClient('');
    setPlan('');
    setContract('');
    setTrueBudget(false);
    _trueClient = false;
    _client= '';
    _clientId= '';
    _clientName = '';
    _clientCPF = '';
    _clientRG = '';
    _clientEmail = '';
    _budget = '';
    _textError = '';
  }
}
