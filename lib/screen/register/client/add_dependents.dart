// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/components/auth/textfield_string.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/store/register/client/dependents.store.dart';

final _budgetController = TextEditingController();
final _nameController = TextEditingController();
final _cpfController = TextEditingController();
final _rgController = TextEditingController();
final _emailController = TextEditingController();
//Formkey2
final _clientController = TextEditingController();
final _nameClientController = TextEditingController();
final _cpfClientController = TextEditingController();
final _rgClientController = TextEditingController();
final _emailClientController = TextEditingController();

class AddDependents extends StatefulWidget {
  const AddDependents({super.key});

  @override
  State<AddDependents> createState() => _AddDependentsState();
}

class _AddDependentsState extends State<AddDependents> {
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<DependentsStore>(context);

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
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          children: [
                            const ListTile(
                              title: Text(
                                "Adicionar Dependentes",
                                style: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Form(
                                        key: formKey1,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFieldString(
                                              icon: Icon(MdiIcons
                                                  .clipboardTextSearchOutline),
                                              hintText:
                                                  "Pesquise o Depedente (Email, CPF ou RG)",
                                              text: _budgetController.text,
                                              shouldValidate: true,
                                              onChanged: (text) async {
                                                if (text.trim().isNotEmpty) {
                                                  await store
                                                      .dependentDataCheck(text);
                                                } else {
                                                  store.restoreData();
                                                }
                                                setState(() {
                                                  if (store.trueDependent()) {
                                                    formKey2.currentState
                                                        ?.reset();
                                                  }
                                                });
                                              },
                                              validator: (text) {
                                                print(store.getDependentName());
                                                if (text!.trim().isEmpty &&
                                                    store
                                                        .getDependentName()
                                                        .isEmpty &&
                                                    store
                                                        .getDependentCPF()
                                                        .isEmpty &&
                                                    store
                                                        .getDependentRG()
                                                        .isEmpty &&
                                                    store
                                                        .getDependentEmail()
                                                        .isEmpty) {
                                                  return "Digite as informações ou pesquise por um dependente!";
                                                }
                                                if (RegExp(
                                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                                    .hasMatch(text)) {
                                                  return null;
                                                } else if (RegExp(
                                                        r'^[0-9.\\-]+$')
                                                    .hasMatch(text)) {
                                                  return null;
                                                } else if (text.length > 8 &&
                                                    text.length < 14) {
                                                  text = text.replaceAll(
                                                      RegExp(r'[-.]'), '');
                                                  text = text.toLowerCase();
                                                  return null;
                                                }
                                                if (store
                                                        .getDependentName()
                                                        .isNotEmpty &&
                                                    store
                                                        .getDependentCPF()
                                                        .isNotEmpty &&
                                                    store
                                                        .getDependentRG()
                                                        .isNotEmpty &&
                                                    store
                                                        .getDependentEmail()
                                                        .isNotEmpty) {
                                                  return null;
                                                }
                                                return "Digite as informações ou pesquise por um dependente!";
                                              },
                                            ),
                                            const Divider(
                                                height: 20, thickness: 1),
                                          ],
                                        ),
                                      ),
                                      Form(
                                        key: formKey2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            //Name field
                                            TextFieldString(
                                              icon:
                                                  Icon(MdiIcons.accountOutline),
                                              hintText: store.trueDependent()
                                                  ? store.getDependentName()
                                                  : "Nome",
                                              text: _nameController.text,
                                              shouldValidate: true,
                                              validator: (text) {
                                                if (text!.isEmpty &&
                                                    !store.trueDependent()) {
                                                  return "Digite um nome";
                                                }
                                                store.setDependentName(text);
                                                return null;
                                              },
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  //CPF field
                                                  child: TextFieldString(
                                                    icon: Icon(MdiIcons
                                                        .cardAccountDetailsOutline),
                                                    hintText: store
                                                            .trueDependent()
                                                        ? store
                                                            .getDependentCPF()
                                                        : "CPF",
                                                    text: _cpfClientController
                                                        .text,
                                                    shouldValidate: true,
                                                    validator: (text) {
                                                      if (text!.isEmpty &&
                                                          !store
                                                              .trueDependent()) {
                                                        return "Digite um CPF";
                                                      }
                                                      store.setDependentCPF(
                                                          text);
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  //RG field
                                                  child: TextFieldString(
                                                    icon: Icon(MdiIcons
                                                        .cardAccountMailOutline),
                                                    hintText: store
                                                            .trueDependent()
                                                        ? store.getDependentRG()
                                                        : "RG",
                                                    text: _rgController.text,
                                                    shouldValidate: true,
                                                    validator: (text) {
                                                      if (text!.isEmpty &&
                                                          !store
                                                              .trueDependent()) {
                                                        return "Digite um RG";
                                                      }
                                                      store
                                                          .setDependentRG(text);
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            //Employee field
                                            TextFieldString(
                                              icon: Icon(MdiIcons.emailOutline),
                                              hintText: store.trueDependent()
                                                  ? store.getDependentEmail()
                                                  : "Email",
                                              enabled: !store.trueDependent(),
                                              text: _emailController.text,
                                              shouldValidate: true,
                                              validator: (text) {
                                                if (text!.isEmpty &&
                                                    !store.trueDependent()) {
                                                  return "Digite um email";
                                                }
                                                store.setDependentEmail(text);
                                                return null;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //Space
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Form(
                                    key: formKey3,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFieldString(
                                          icon: Icon(
                                            MdiIcons.accountSearchOutline,
                                          ),
                                          hintText:
                                              "Pesquise o Cliente (Email, CPF ou RG)",
                                          text: _clientController.text,
                                          shouldValidate: true,
                                          onChanged: (text) async {
                                            if (text.trim().isNotEmpty) {
                                              await store.clientDataCheck(text);
                                            } else {
                                              store.restoreData();
                                            }
                                            setState(() {});
                                          },
                                          validator: (text) {
                                            if (text!.trim().isEmpty) {
                                              return "Digite um Email, CPF ou RG!";
                                            }
                                            if (RegExp(
                                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                                .hasMatch(text)) {
                                              return null;
                                            } else if (RegExp(r'^[0-9.\\-]+$')
                                                .hasMatch(text)) {
                                              return null;
                                            } else if (text.length > 8 &&
                                                text.length < 14) {
                                              text = text.replaceAll(
                                                  RegExp(r'[-.]'), '');
                                              text = text.toLowerCase();
                                              return null;
                                            }
                                            return "Digite um Email, CPF ou RG!";
                                          },
                                        ),
                                        const Divider(height: 20, thickness: 1),
                                        TextFieldString(
                                          icon: Icon(MdiIcons.accountOutline),
                                          hintText: store.trueClient()
                                              ? store.getClientName()
                                              : "Nome",
                                          enabled: false,
                                          text: _nameClientController.text,
                                          shouldValidate: true,
                                          validator: (text) {
                                            return null;
                                          },
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              //CPF field
                                              child: TextFieldString(
                                                icon: Icon(MdiIcons
                                                    .cardAccountDetailsOutline),
                                                hintText: store.trueClient()
                                                    ? store.getClientCPF()
                                                    : "CPF",
                                                enabled: false,
                                                text: _cpfClientController.text,
                                                shouldValidate: true,
                                                validator: (_) {
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              //RG field
                                              child: TextFieldString(
                                                icon: Icon(MdiIcons
                                                    .cardAccountMailOutline),
                                                hintText: store.trueClient()
                                                    ? store.getClientRG()
                                                    : "RG",
                                                enabled: false,
                                                text: _rgClientController.text,
                                                shouldValidate: true,
                                                validator: (_) {
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextFieldString(
                                          icon: Icon(MdiIcons.emailOutline),
                                          hintText: store.trueClient()
                                              ? store.getClientEmail()
                                              : "Email",
                                          enabled: false,
                                          text: _emailClientController.text,
                                          shouldValidate: true,
                                          validator: (_) {
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            // Button
                            buttonDefault(
                              context,
                              () async {
                                final isForm2Valid =
                                    formKey2.currentState!.validate();
                                final isForm1Valid =
                                    formKey1.currentState!.validate();
                                final isForm3Valid =
                                    formKey3.currentState!.validate();
                                //Confirmation screen
                                if (!store.getIsError() &&
                                    isForm1Valid &&
                                    isForm2Valid &&
                                    isForm3Valid) {
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              buttonDialog(
                                                text: 'SIM',
                                                onClick: () async {
                                                  store.registrationSell();
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AddDependents(),
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

                            //Partner erros
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
