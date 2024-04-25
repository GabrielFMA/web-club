// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/components/auth/textfield_string.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/store/sell.store.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class RegisterSell extends StatefulWidget {
  const RegisterSell({super.key});

  @override
  State<RegisterSell> createState() => _RegisterSellState();
}

class _RegisterSellState extends State<RegisterSell> {
  late Future<void> _loadDataFuture;

  String? namePlan;

  @override
  void initState() {
    super.initState();
    _loadDataFuture = _loadData();
  }

  Future<void> _loadData() async {
    final store = Provider.of<SellStore>(context, listen: false);
    await store.planNameSearch();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else {
          return _buildContent();
        }
      },
    );
  }

  Widget _buildContent() {
    final store = Provider.of<SellStore>(context);
    final planName = store.getPlanNames().toSet().toList();
    final _clientController = TextEditingController();
    final _contractController = TextEditingController();
    final _validityController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    print(planName);

    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Row(
        children: [
          const MenuWidget(),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Observer(
                  builder: (_) => Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const ListTile(
                                title: Text(
                                  "Venda",
                                  style: TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              // Space
                              const SizedBox(height: 15),

                              //Cliente field
                              TextFieldString(
                                icon: Icon(MdiIcons.noteMultiple),
                                hintText: "Cliente",
                                text: _clientController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.trim().isEmpty) {
                                    return "Digite o cliente";
                                  }
                                  if (RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(text)) {
                                    store.setClient(text);
                                    return null;
                                  } else if (RegExp(r'^[0-9.\\-]+$')
                                      .hasMatch(text)) {
                                    store.setClient(text);
                                    return null;
                                  } else if (text.length > 8 &&
                                      text.length < 14) {
                                    text = text.replaceAll(RegExp(r'[-.]'), '');
                                    text = text.toLowerCase();
                                    store.setClient(text);
                                    return null;
                                  }
                                  return "Caracteres são inválidas";
                                },
                              ),

                              //Drawer field
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.green[500]?.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(MdiIcons.textBoxMultipleOutline),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: namePlan != null
                                              ? namePlan!
                                              : "Selecione um plano",
                                          hintStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            namePlan = value;
                                          });
                                        },
                                        items: planName.map((valueItem) {
                                          return DropdownMenuItem<String>(
                                            value: valueItem,
                                            child: Text(valueItem),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //Contract field
                              TextFieldString(
                                icon: Icon(MdiIcons.noteMultiple),
                                hintText: "Contrato",
                                text: _contractController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite o Contrato";
                                  }
                                  store.setContract(text);
                                  return null;
                                },
                              ),

                              //Validade field
                              TextFieldString(
                                icon: Icon(MdiIcons.noteMultiple),
                                hintText: "Data da venda",
                                text: _validityController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite a Validade";
                                  }
                                  store.setValidity(text);
                                  return null;
                                },
                              ),

                              const SizedBox(height: 12),

                              // Button
                              buttonDefault(
                                context,
                                () async {
                                  if (formKey.currentState!.validate()) {
                                    store.clientCheck();
                                    //Confirmation screen
                                  }
                                  if (!store.getIsError()) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Adicionar Venda'),
                                          content: const Text(
                                              'Tem certeza que deseja adicionar esta Venda?'),
                                          actions: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                buttonDialog(
                                                  text: 'SIM',
                                                  onClick: () async {
                                                    store.registrationSell();
                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const RegisterSell(),
                                                      ),
                                                      (route) => false,
                                                    );
                                                  },
                                                ),
                                                buttonDialog(
                                                  text: 'NÃO',
                                                  onClick: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                              ),

                              //Space
                              const SizedBox(height: 15),

                              //exams erros
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  store.getTextError(),
                                  style: const TextStyle(
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Button screen
  Widget buttonDialog({required String text, VoidCallback? onClick}) {
    return Container(
      height: 40,
      width: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green[500],
      ),
      child: TextButton(
        onPressed: onClick,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buttonDefault(BuildContext context, VoidCallback? onClick) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green[500],
      ),
      child: TextButton(
        onPressed: onClick,
        child: const Text(
          "REGISTRAR",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
