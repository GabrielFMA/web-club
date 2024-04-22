// ignore_for_file: avoid_print, equal_keys_in_map

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'plan.store.g.dart';

class PlanStore = _PlanStore with _$PlanStore;

abstract class _PlanStore with Store {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late http.Response rsp;

  //Errors
  @observable
  bool _isError = false;

  @observable
  String _textError = '';

  //Clinic
  @observable
  String _idPlan = '';

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

  // Info Clinic
  @action
  String getidPlan() => _idPlan;

  @action
  String getName() => _name;

  @action
  String getPrice() => _price;

  @action
  String getDescription() => _description;

  // Set functions

  // Info Clinic
  @action
  void setIdPlan(String idPlan) => _idPlan = idPlan;

  @action
  void setName(String name) => _name = name;

  @action
  void setPrice(String price) => _price = price;

  @action
  void setDescription(String description) => _description = description;

  @action
  Future<void> registrationPlan() async {
    try {
      _idPlan = generateRandomId();

      Map<String, dynamic> paternInfoMap = {
        "ID": _idPlan,
        "Nome": _name,
        "Preço": _price,
        "Descrição": _description,
      };

      await addDetailsPlan(paternInfoMap, _idPlan);
    } catch (e) {
      print('Erro ao fazer registro: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
    restoreData();
  }

  @action
  Future addDetailsPlan(Map<String, dynamic> clinicMap, String id) async {
    await db.collection("Planos").doc(id).set(clinicMap);
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
          .collection("Planos")
          .where("Nome", isEqualTo: _name.toLowerCase())
          .get();

      if (name.docs.isNotEmpty) {
        _textError = 'Esse Plano já foi cadastrado';
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
    setIdPlan('');
    setName('');
    setPrice('');
    setDescription('');
  }
}
