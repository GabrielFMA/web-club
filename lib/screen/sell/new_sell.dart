// ignore_for_file: avoid_print, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/components/auth/textfield_string.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/store/sell.store.dart';

class RegisterSell extends StatefulWidget {
  const RegisterSell({super.key});

  @override
  State<RegisterSell> createState() => _RegisterSellState();
}

class _RegisterSellState extends State<RegisterSell> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SellStore>(context);

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

                              //Name field
                              TextFieldString(
                                icon: Icon(MdiIcons.noteMultiple),
                                hintText: "Funcionario",
                                text: _nameController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite a Venda";
                                  }
                                  store.setName(text);
                                  return null;
                                },
                              ),

                              //Name field
                              TextFieldString(
                                icon: Icon(MdiIcons.noteMultiple),
                                hintText: "Nome da Venda",
                                text: _nameController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite a Venda";
                                  }
                                  store.setName(text);
                                  return null;
                                },
                              ),

                              //Name field
                              TextFieldString(
                                icon: Icon(MdiIcons.noteMultiple),
                                hintText: "Nome da Venda",
                                text: _nameController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite a Venda";
                                  }
                                  store.setName(text);
                                  return null;
                                },
                              ),

                              //Price field
                              TextFieldString(
                                icon: Icon(MdiIcons.currencyUsd),
                                hintText: "Preço do Plano",
                                text: _priceController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite o Preço";
                                  }
                                  if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
                                    return "Digite apenas números";
                                  }
                                  store.setPrice(text);
                                  return null;
                                },
                              ),

                              //Description field
                              TextFieldString(
                                icon: Icon(MdiIcons.noteText),
                                hintText: "Descrição do Plano",
                                text: _descriptionController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite a Descrição";
                                  }
                                  store.setDescription(text);
                                  return null;
                                },
                              ),

                              const SizedBox(height: 12),

                              // Button
                              buttonDefault(
                                context,
                                () async {
                                  final isFormKey =
                                      formKey.currentState!.validate();
                                  store.duplicateEntryCheck();
                                  if (isFormKey && !store.getIsError()) {
                                    //Confirmation screen
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
