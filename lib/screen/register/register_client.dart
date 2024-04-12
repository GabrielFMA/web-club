// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/store/client.store.dart';
import 'package:web_simclub/components/auth/textfield_string.dart';

class RegisterClient extends StatefulWidget {
  const RegisterClient({super.key});

  @override
  State<RegisterClient> createState() => _RegisterClientState();
}

class _RegisterClientState extends State<RegisterClient> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _phoneController = TextEditingController();
  final _contractController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ClientStore>(context);

    store.textError = '';

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
                                  "Registrar Cliente",
                                  style: TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              //Name field
                              TextFieldString(
                                icon: Icon(
                                  MdiIcons.accountCircleOutline,
                                  color: store.textError.contains('Nome')
                                      ? Colors.red
                                      : null,
                                ),
                                hintText: "Digite seu Nome",
                                text: _nomeController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite um nome";
                                  }
                                  if (text.length < 6) {
                                    return 'Digite seu nome completo';
                                  }
                                  store.setName(text);
                                  return null;
                                },
                              ),

                              //CPF field
                              TextFieldString(
                                icon: Icon(
                                  MdiIcons.textBoxOutline,
                                  color: store.textError.contains('CPF')
                                      ? Colors.red
                                      : null,
                                ),
                                hintText: "CPF",
                                text: _cpfController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite seu CPF";
                                  }
                                  if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
                                    return "Digite apenas números";
                                  }
                                  if (text.length != 11) {
                                    return 'Digite um CPF válido';
                                  }
                                  store.setCPF(text);
                                  return null;
                                },
                              ),

                              //Email field
                              TextFieldString(
                                icon: Icon(
                                  MdiIcons.emailOutline,
                                  color: store.textError.contains('Email')
                                      ? Colors.red
                                      : null,
                                ),
                                hintText: "Digite seu email",
                                text: _emailController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite seu Email";
                                  }
                                  // Verificar se o email já termina com "@gmail.com"
                                  if (!text.endsWith("@gmail.com")) {
                                    // Adicionar "@gmail.com" ao final do email
                                    text += "@gmail.com";
                                  }
                                  store.setEmail(text);
                                  return null;
                                },
                              ),

                              //Address field
                              TextFieldString(
                                icon: Icon(MdiIcons.mapMarkerOutline),
                                hintText: "Cep",
                                text: _contractController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite seu Cep";
                                  }
                                  store.setCep(text);
                                  return null;
                                },
                              ),

                              //Phone field
                              TextFieldString(
                                icon: Icon(MdiIcons.phoneOutline),
                                hintText: "Telefone",
                                text: _phoneController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite seu Telefone";
                                  }
                                  // Verifica se contém apenas números
                                  if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
                                    return "Digite apenas números";
                                  }
                                  if (text.length != 11) {
                                    return "Digite um Telefone válido";
                                  }
                                  store.setPhone(text);
                                  return null;
                                },
                              ),

                              //Contract field
                              TextFieldString(
                                icon: Icon(
                                  MdiIcons.fileDocumentEditOutline,
                                  color: store.textError.contains('Contrato')
                                      ? Colors.red
                                      : null,
                                ),
                                hintText: "Contrato",
                                text: _contractController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite seu Contrato";
                                  }
                                  if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
                                    return "Digite apenas números";
                                  }
                                  if (text.length < 6) {
                                    return "O contrato deve ter pelo menos 6 dígitos";
                                  }
                                  store.setNumContract(text);
                                  store.setPassword(
                                      text.substring(text.length - 6));
                                  return null;
                                },
                              ),

                              //Space
                              const SizedBox(height: 15),

                              //Button
                              buttonDefault(
                                context,
                                () async {
                                  if (formKey.currentState!.validate()) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                              const Text('Registrar Cliente'),
                                          content: const Text(
                                              'Tem certeza que deseja registrar este cliente?'),
                                          actions: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                buttonDialogDefault(
                                                  text: 'SIM',
                                                  onClick: () async {
                                                    await store
                                                        .duplicateEntryCheck();

                                                    if (!store.getIsError()) {
                                                      await store.searchCep();

                                                      if (!store.getIsError()) {
                                                        await store
                                                            .signUpWithEmailPassword(
                                                                context);

                                                        if (!store
                                                            .getIsError()) {
                                                          Navigator
                                                              .pushAndRemoveUntil(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const RegisterClient(),
                                                            ),
                                                            (route) => false,
                                                          );
                                                        }
                                                      }
                                                    }

                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                buttonDialogDefault(
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

                              //Register erros
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  store.textError,
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

  Widget buttonDialogDefault({required String text, VoidCallback? onClick}) {
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
          borderRadius: BorderRadius.circular(8), color: Colors.green[500]),
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
