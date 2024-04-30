// ignore_for_file: avoid_print, equal_keys_in_map, unnecessary_string_interpolations, library_private_types_in_public_api
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'dependents.store.g.dart';

class DependentsStore = _DependentsStore with _$DependentsStore;

abstract class _DependentsStore with Store {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late http.Response rsp;

  //Errors
  @observable
  bool _isError = false;

  @observable
  String _textError = '';

  //Dependents
  @observable
  String _dependentId = '';

  @observable
  String _dependentName = '';

  @observable
  String _dependentCPF = '';

  @observable
  String _dependentRG = '';

  @observable
  String _dependentEmail = '';

  @observable
  bool _trueDependent = false;

  //Client
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

  // Get functions
  // Errors
  bool getIsError() => _isError;

  String getTextError() => _textError;

  // Info Sell
  @action
  String getDependentName() => _dependentName;

  @action
  String getDependentCPF() => _dependentCPF;

  @action
  String getDependentRG() => _dependentRG;

  @action
  String getDependentEmail() => _dependentEmail;

  @action
  bool trueDependent() => _trueDependent;

  //Client
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

  // Set functions

  @action
  String setDependentName(name) => _dependentName = name;

  @action
  String setDependentCPF(cpf) => _dependentCPF = cpf;

  @action
  String setDependentRG(rg) => _dependentRG = rg;

  @action
  String setDependentEmail(email) => _dependentEmail = email;

  //NAO CRIADO --------------------------------------------------

  @action
  Future<void> registrationSell() async {
    try {
      Map<String, dynamic> sellInfoMap = {};

      await addDetailsSell(sellInfoMap, _clientId);
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

  //NAO CRIADO --------------------------------------------------

  Future<void> dependentDataCheck(dependent) async {
    try {
      _dependentId = "";
      await dependentIdSearch("CPF", dependent);
      await dependentIdSearch("RG", dependent);
      await dependentIdSearch("Email", dependent);
      if (_dependentId.isEmpty) {
        _textError = "Não foi possivel encontrar um cliente com esses dados.";
        _trueClient = false;
        _isError = true;
        restoreData();
      } else {
        _textError = "";
        _isError = false;
        _trueDependent = true;
      }
    } catch (e) {
      print("Ocorreu um erro: $e");
    }
  }

  Future<void> dependentIdSearch(value, dependent) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Usuarios")
        .where(value, isEqualTo: dependent.toLowerCase())
        .get();
    if (snapshot.docs.isNotEmpty) {
      var doc = snapshot.docs[0];
      _dependentId = doc.id;
      _dependentName = doc['Nome'];
      _dependentCPF = doc['CPF'];
      _dependentRG = doc['RG'];
      _dependentEmail = doc['Email'];
      print(
          "$value válido. Id: $_dependentId, Nome: $_dependentName, CPF:  $_dependentCPF, RG:  $_dependentRG, Email:  $_dependentEmail");
    } else {
      print("Nenhum $value foi encontrado.");
    }
  }

  Future<void> clientDataCheck(client) async {
    try {
      _clientId = "";
      await clientIdSearch("CPF", client);
      await clientIdSearch("RG", client);
      await clientIdSearch("Email", client);
      if (_clientId.isEmpty) {
        _textError = "Não foi possivel encontrar um cliente com esses dados.";
        _trueClient = false;
        _isError = true;
        restoreData();
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
    } else {
      print("Nenhum $value foi encontrado.");
    }
  }

  restoreData() {
    //Dependent
    _dependentId = '';
    _dependentName = '';
    _dependentCPF = '';
    _dependentRG = '';
    _dependentEmail = '';
    _trueDependent = false;
    //Client
    _clientId = '';
    _clientName = '';
    _clientCPF = '';
    _clientRG = '';
    _clientEmail = '';
    _trueClient = false;
    //Error
    _textError = '';
    _isError = false;
  }
}
