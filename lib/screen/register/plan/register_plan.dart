// ignore_for_file: avoid_print, non_constant_identifier_names, use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/components/auth/textfield_string.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/store/register/plan/plan.store.dart';

class RegisterPlan extends StatefulWidget {
  const RegisterPlan({super.key});

  @override
  State<RegisterPlan> createState() => _RegisterPlanState();
}

class _RegisterPlanState extends State<RegisterPlan> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? selectedPlan;

  List<String> listPlan = ['Básico', 'Intermediário', 'Premium'];

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PlanStore>(context);

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
                                  "Registrar Plano",
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
                                hintText: "Nome do Plano",
                                text: _nameController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite o Plano";
                                  }
                                  store.setName(text);
                                  return null;
                                },
                              ),

                              //Space
                              const SizedBox(height: 5),

                              // Widget do DropdownButton
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
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              "Selecione o nível do Plano",
                                          hintStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Selecione um nível de plano';
                                          }
                                          return null;
                                        },
                                        isExpanded: true,
                                        value: selectedPlan,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedPlan = value!;
                                            switch (selectedPlan) {
                                              case 'Premium':
                                                store.setPlanNumber(3);
                                                break;
                                              case 'Intermediário':
                                                store.setPlanNumber(2);
                                                break;
                                              case 'Básico':
                                                store.setPlanNumber(1);
                                                break;
                                              default:
                                                store.setPlanNumber(0);
                                                break;
                                            }
                                          });
                                        },
                                        items: listPlan.map((plan) {
                                          return DropdownMenuItem<String>(
                                            value: plan,
                                            child: Text(
                                              plan,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //Space
                              const SizedBox(height: 5),

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
                                  if (!RegExp(r'^\d+([,.]\d{1,2})?$')
                                      .hasMatch(text)) {
                                    return "Digite um número válido";
                                  }
                                  store.setPrice(text.replaceAll(',', '.'));
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
                                  if (isFormKey &&
                                      store.getPlanNumber() != 0 &&
                                      !store.getIsError()) {
                                    //Confirmation screen
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Registrar Plano'),
                                          content: const Text(
                                              'Tem certeza que deseja registrar este Plano?'),
                                          actions: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                buttonDialog(
                                                  text: 'SIM',
                                                  onClick: () async {
                                                    store.registrationPlan();
                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const RegisterPlan(),
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
