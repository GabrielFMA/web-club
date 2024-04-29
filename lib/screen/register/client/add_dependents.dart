// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks, avoid_print

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:web_simclub/components/auth/textfield_password.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/store/register/client/client.store.dart';
import 'package:web_simclub/components/auth/textfield_string.dart';
  //form1
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _rgController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _name = '';
  String _password = ' ';
  //form2
  final _cepController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _complementController = TextEditingController();
  final _districtController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();

class AddDependents extends StatefulWidget {
  const AddDependents({super.key});

  @override
  State<AddDependents> createState() => _AddDependentsState();
}

class _AddDependentsState extends State<AddDependents> {

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ClientStore>(context);
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
                                "Registrar Cliente",
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
                                  child: Form(
                                    key: formKey1,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              //Name field
                                              child: TextFieldString(
                                                icon: Icon(
                                                    MdiIcons.accountOutline),
                                                hintText: "Nome",
                                                text: _nomeController.text,
                                                shouldValidate: true,
                                                validator: (text) {
                                                  if (text!.isEmpty) {
                                                    return "Digite um nome";
                                                  }
                                                  _name += "$text ";
                                                  return null;
                                                },
                                              ),
                                            ),

                                            //Space
                                            const SizedBox(width: 10),

                                            Expanded(
                                              //Sobrenome field
                                              child: TextFieldString(
                                                icon: Icon(
                                                    MdiIcons.accountOutline),
                                                hintText: "Sobrenome",
                                                text: _nomeController.text,
                                                shouldValidate: true,
                                                validator: (text) {
                                                  if (text!.isEmpty) {
                                                    return "Digite um Sobrenome";
                                                  }
                                                  if (_name.trim().isNotEmpty) {
                                                    _name += text;
                                                    store.setName(_name);
                                                    return null;
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Expanded(
                                              //CPF field
                                              child: TextFieldString(
                                                icon: Icon(MdiIcons
                                                    .cardAccountDetailsOutline),
                                                hintText: "CPF",
                                                text: _cpfController.text,
                                                shouldValidate: true,
                                                validator: (text) {
                                                  if (text!.isEmpty) {
                                                    return "Digite o CPF";
                                                  }
                                                  if (!RegExp(r'^[0-9.\\-]+$')
                                                      .hasMatch(text)) {
                                                    return "Digite apenas números";
                                                  }
                                                  if (text.length == 11 ||
                                                      text.length == 14) {
                                                    text = text.replaceAll(
                                                        RegExp(r'[^0-9]'), '');
                                                    print(text);
                                                    store.setCPF(text);
                                                    return null;
                                                  } else {
                                                    return 'Digite um CPF válido';
                                                  }
                                                },
                                              ),
                                            ),

                                            //Space
                                            const SizedBox(width: 10),

                                            Expanded(
                                              //RG field
                                              child: TextFieldString(
                                                icon: Icon(MdiIcons
                                                    .cardAccountMailOutline),
                                                hintText: "RG",
                                                text: _rgController.text,
                                                shouldValidate: true,
                                                validator: (text) {
                                                  if (text!.isEmpty) {
                                                    return "Digite o RG";
                                                  }
                                                  if (text.length > 8 &&
                                                      text.length < 14) {
                                                    text = text.replaceAll(
                                                        RegExp(r'[-.]'), '');
                                                    text = text.toLowerCase();
                                                    print(text);
                                                    store.setRG(text);
                                                    return null;
                                                  } else {
                                                    return 'Digite um RG válido';
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
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

                                        //Phone field
                                        TextFieldString(
                                          icon: Icon(MdiIcons.phoneOutline),
                                          hintText: "Telefone",
                                          text: _phoneController.text,
                                          shouldValidate: true,
                                          validator: (text) {
                                            if (text!.isEmpty ||
                                                text.length < 9) {
                                              return "Digite seu Telefone";
                                            }

                                            text = text.replaceAll(
                                                RegExp(r'\D'), '');

                                            if (text.length > 11) {
                                              if (!RegExp(
                                                      r'^\s*55?\s*\d{10,11}')
                                                  .hasMatch(text)) {
                                                return "Digite um telefone válido";
                                              }

                                              if (text.startsWith('55')) {
                                                text = text.substring(2);
                                              }
                                            }

                                            if (int.tryParse(
                                                        text.substring(0, 2))! <
                                                    11 ||
                                                int.tryParse(
                                                        text.substring(0, 2))! >
                                                    99) {
                                              return "Digite um DDD válido";
                                            }

                                            if (!RegExp(r'^\d{10,11}$')
                                                .hasMatch(text)) {
                                              return "Digite um telefone válido";
                                            }
                                            store.setPhone(text);
                                            return null;
                                          },
                                        ),

                                        //Contract field
                                        Row(
                                          children: [
                                            Expanded(
                                              //Password field
                                              child: TextFieldPassword(
                                                password:
                                                    _passwordController.text,
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
                                            ),

                                            //Space
                                            const SizedBox(width: 10),

                                            Expanded(
                                              //Password confirm field
                                              child: TextFieldConfirmPassword(
                                                confirmPassword:
                                                    _confirmPasswordController
                                                        .text,
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
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                //Space
                                const SizedBox(width: 20),

                                Expanded(
                                  child: Form(
                                    key: formKey2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        //CEP field
                                        TextFieldString(
                                          icon: Icon(MdiIcons.mapMarkerOutline),
                                          hintText: "CEP",
                                          text: _cepController.text,
                                          shouldValidate: true,
                                          onChanged: (text) async {
                                            if (text.length == 8) {
                                              await store.searchCep(text);
                                            } else {
                                              store.restoreData();
                                            }
                                            setState(() {});
                                          },
                                          validator: (text) {
                                            if (text!.isEmpty) {
                                              return "Digite seu CEP";
                                            }
                                            if (!RegExp(r'^[0-9]+$')
                                                .hasMatch(text)) {
                                              return "Digite apenas números";
                                            }
                                            if (text.length != 8) {
                                              return "Digite um CEP válido";
                                            }
                                            store.setCEP(text);
                                            return null;
                                          },
                                        ),

                                        //Street field
                                        TextFieldString(
                                          icon: Icon(
                                            store.trueCEP
                                                ? MdiIcons.lockOutline
                                                : MdiIcons.lockOpenOutline,
                                            color: store.trueCEP
                                                ? Colors.black54
                                                : null,
                                          ),
                                          hintText: store.getTrueCEP()
                                              ? store.getStreet()
                                              : "Rua",
                                          enabled: !store.trueCEP,
                                          text: _streetController.text,
                                          shouldValidate: true,
                                          validator: (_) {
                                            if (store.getStreet().isEmpty) {
                                              return "Digite sua Rua";
                                            }
                                            return null;
                                          },
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              //Number field
                                              child: TextFieldString(
                                                icon: Icon(
                                                    MdiIcons.pencilOutline),
                                                hintText: "Número",
                                                text: _numberController.text,
                                                shouldValidate: true,
                                                validator: (text) {
                                                  if (text!.isEmpty) {
                                                    return "Digite o número";
                                                  }
                                                  if (!RegExp(r'^[0-9]+$')
                                                      .hasMatch(text)) {
                                                    return "Digite apenas números";
                                                  }
                                                  store.setNumber(text);
                                                  return null;
                                                },
                                              ),
                                            ),

                                            //Space
                                            const SizedBox(width: 10),

                                            Expanded(
                                              //Complement field
                                              child: TextFieldString(
                                                icon: Icon(
                                                    MdiIcons.pencilOutline),
                                                hintText: "Complemento",
                                                text:
                                                    _complementController.text,
                                                shouldValidate: true,
                                                validator: (text) {
                                                  store.setComplement(text);
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),

                                        //District field
                                        TextFieldString(
                                          icon: Icon(
                                            store.trueCEP
                                                ? MdiIcons.lockOutline
                                                : MdiIcons.lockOpenOutline,
                                            color: store.trueCEP
                                                ? Colors.black54
                                                : null,
                                          ),
                                          hintText: store.getTrueCEP()
                                              ? store.getDistrict()
                                              : "Bairro",
                                          enabled: !store.trueCEP,
                                          text: _districtController.text,
                                          shouldValidate: true,
                                          validator: (_) {
                                            if (store.getDistrict().isEmpty) {
                                              return "Digite seu Bairro";
                                            }
                                            return null;
                                          },
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              //City field
                                              child: TextFieldString(
                                                icon: Icon(
                                                  store.trueCEP
                                                      ? MdiIcons.lockOutline
                                                      : MdiIcons
                                                          .lockOpenOutline,
                                                  color: store.trueCEP
                                                      ? Colors.black54
                                                      : null,
                                                ),
                                                hintText: store.getTrueCEP()
                                                    ? store.getCity()
                                                    : "Cidade",
                                                enabled: !store.trueCEP,
                                                text: _cityController.text,
                                                shouldValidate: true,
                                                validator: (_) {
                                                  if (store.getCity().isEmpty) {
                                                    return "Digite sua Cidade";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),

                                            //Space
                                            const SizedBox(width: 10),

                                            Expanded(
                                              //State field
                                              child: TextFieldString(
                                                icon: Icon(
                                                  store.trueCEP
                                                      ? MdiIcons.lockOutline
                                                      : MdiIcons
                                                          .lockOpenOutline,
                                                  color: store.trueCEP
                                                      ? Colors.black54
                                                      : null,
                                                ),
                                                hintText: store.getTrueCEP()
                                                    ? store.getState()
                                                    : "Estado",
                                                enabled: !store.trueCEP,
                                                text: _stateController.text,
                                                shouldValidate: true,
                                                validator: (_) {
                                                  if (store
                                                      .getState()
                                                      .isEmpty) {
                                                    return "Digite seu Estado";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //Space
                            const SizedBox(height: 20),

                            //Register button
                            buttonDefault(
                              context,
                              () async {
                                final isForm1Valid =
                                    formKey1.currentState!.validate();
                                final isForm2Valid =
                                    formKey2.currentState!.validate();

                                await store.duplicateEntryCheck();

                                if (isForm1Valid &&
                                    isForm2Valid &&
                                    !store.getIsError()) {
                                  //Confirmation screen
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Registrar Cliente'),
                                        content: const Text(
                                            'Tem certeza que deseja registrar este cliente?'),
                                        actions: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              buttonDialog(
                                                text: 'SIM',
                                                onClick: () async {
                                                  await store
                                                      .signUpWithEmailPassword();
                                                  if (!store.getIsError()) {
                                                    store.restoreData();
                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const AddDependents(),
                                                      ),
                                                      (route) => false,
                                                    );
                                                  } else {
                                                    Navigator.pop(context);
                                                  }
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

                            //Register error
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
