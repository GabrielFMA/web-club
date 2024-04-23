// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/components/auth/textfield_password.dart';
import 'package:web_simclub/components/auth/textfield_string.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/store/employee.store.dart';

class RegisterEmployee extends StatefulWidget {
  const RegisterEmployee({Key? key});

  @override
  State<RegisterEmployee> createState() => _RegisterEmployeeState();
}

class _RegisterEmployeeState extends State<RegisterEmployee> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _password = ' ';

  String? valuePosition;

  List<String> listCargo = [
    'Funcionario',
    'Gerente',
    'Administrador',
  ];

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<EmployeeStore>(context);

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
                                  "Registrar Funcionário",
                                  style: TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              //Space
                              const SizedBox(height: 5),

                              //Name field
                              TextFieldString(
                                icon: Icon(MdiIcons.accountTieOutline),
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

                              //Email field
                              TextFieldString(
                                icon: Icon(MdiIcons.emailOutline),
                                hintText: "Digite seu email",
                                text: _emailController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite seu Email";
                                  }
                                  if (!RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(text)) {
                                    return "Email inválido";
                                  }
                                  store.setEmail(text);
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
                                          hintText: "Selecione o cargo",
                                          hintStyle: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Selecione um cargo';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            valuePosition = value!;
                                            switch (valuePosition) {
                                              case 'Administrador':
                                                store.setLevel(0);
                                                break;
                                              case 'Gerente':
                                                store.setLevel(1);
                                                break;
                                              case 'Funcionario':
                                                store.setLevel(2);
                                                break;
                                              default:
                                                store.setLevel(3);
                                                break;
                                            }
                                          });
                                        },
                                        items: listCargo.map((cargo) {
                                          return DropdownMenuItem<String>(
                                            value: cargo,
                                            child: Text(
                                              cargo,
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

                              //Password field
                              TextFieldPassword(
                                password: _passwordController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite uma senha";
                                  } else if (text.length < 6) {
                                    return "Digite uma senha maior";
                                  }
                                  _password = text;
                                  store.setPassword(text);
                                  return null;
                                },
                              ),

                              //Confirmar password field
                              TextFieldConfirmPassword(
                                confirmPassword:
                                    _confirmPasswordController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Confirme sua senha";
                                  }
                                  if (text != _password) {
                                    return "As senhas não são iguais";
                                  }
                                  return null;
                                },
                              ),

                              //Space
                              const SizedBox(height: 15),

                              //Register button
                              buttonDefault(
                                context,
                                () async {
                                  final isFormValid =
                                      formKey.currentState!.validate();

                                  await store.duplicateEntryCheck();
                                  
                                  if (isFormValid &&
                                      store.getLevel() < 3 &&
                                      !store.getIsError()) {
                                    //Confirmation screen
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                              'Registrar Funcionário'),
                                          content: const Text(
                                              'Tem certeza que deseja registrar este funcionário?'),
                                          actions: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                buttonDialog(
                                                  text: 'SIM',
                                                  onClick: () async {
                                                    await store
                                                        .signUpWithEmailPassword(
                                                            context);

                                                    store.restoreData();
                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const RegisterEmployee(),
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

                              //Employee error
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

  //Button controller
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
