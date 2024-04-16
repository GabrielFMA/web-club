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
  final _cepController = TextEditingController();
  final _phoneController = TextEditingController();
  final _contractController = TextEditingController();

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

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
                                        TextFieldString(
                                          icon: Icon(MdiIcons
                                              .accountSupervisorCircleOutline),
                                          hintText: "Digite o nome do parceiro",
                                          text: _nomeController.text,
                                          shouldValidate: true,
                                          validator: (text) {
                                            if (text!.isEmpty) {
                                              return "Digite um nome";
                                            }
                                            store.setName(text);
                                            return null;
                                          },
                                        ),
                                        TextFieldString(
                                          icon: Icon(
                                              MdiIcons.officeBuildingOutline),
                                          hintText: "CNPJ",
                                          text: _cpfController.text,
                                          shouldValidate: true,
                                          validator: (text) {
                                            if (text!.isEmpty) {
                                              return "Digite o CNPJ";
                                            }
                                            if (!RegExp(r'^[0-9]+$')
                                                .hasMatch(text)) {
                                              return "Digite apenas números";
                                            }
                                            if (text.length != 14) {
                                              return 'Digite um CNPJ válido';
                                            }
                                            store.setCPF(text);
                                            return null;
                                          },
                                        ),
                                        TextFieldString(
                                          icon: Icon(MdiIcons.emailOutline),
                                          hintText: "Digite seu email",
                                          text: _emailController.text,
                                          shouldValidate: true,
                                          validator: (text) {
                                            if (text!.isEmpty) {
                                              return "Digite seu Email";
                                            }
                                            store.setEmail(text);
                                            return null;
                                          },
                                        ),
                                        TextFieldString(
                                          icon: Icon(MdiIcons.phoneOutline),
                                          hintText: "Telefone",
                                          text: _phoneController.text,
                                          shouldValidate: true,
                                          validator: (text) {
                                            if (text!.isEmpty) {
                                              return "Digite seu Telefone";
                                            }
                                            if (!RegExp(r'^[0-9]+$')
                                                .hasMatch(text)) {
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
                                            color: store.textError
                                                    .contains('Contrato')
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
                                            if (!RegExp(r'^[0-9]+$')
                                                .hasMatch(text)) {
                                              return "Digite apenas números";
                                            }
                                            if (text.length < 6) {
                                              return "O contrato deve ter pelo menos 6 dígitos";
                                            }
                                            store.setNumContract(text);
                                            store.setPassword(text
                                                .substring(text.length - 6));
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Form(
                                    key: formKey2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
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
                                          text: _contractController.text,
                                          shouldValidate: true,
                                          validator: (_) {
                                            if (store.getStreet()!.isEmpty) {
                                              return "Digite sua Rua";
                                            }
                                            return null;
                                          },
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFieldString(
                                                icon: Icon(
                                                    MdiIcons.pencilOutline),
                                                hintText: "Número",
                                                text: _contractController.text,
                                                shouldValidate: true,
                                                validator: (text) {
                                                  if (text!.isEmpty) {
                                                    return "Digite o número";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: TextFieldString(
                                                icon: Icon(
                                                    MdiIcons.pencilOutline),
                                                hintText: "Complemento",
                                                text: _contractController.text,
                                                shouldValidate: true,
                                                validator: (text) {
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
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
                                          text: _contractController.text,
                                          shouldValidate: true,
                                          validator: (_) {
                                            if (store.getDistrict()!.isEmpty) {
                                              return "Digite seu Bairro";
                                            }
                                            return null;
                                          },
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
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
                                                text: _contractController.text,
                                                shouldValidate: true,
                                                validator: (_) {
                                                  if (store
                                                      .getCity()!
                                                      .isEmpty) {
                                                    return "Digite sua Cidade";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
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
                                                text: _contractController.text,
                                                shouldValidate: true,
                                                validator: (_) {
                                                  if (store
                                                      .getState()!
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
                            const SizedBox(height: 20),
                            
                            buttonDefault(
                              context,
                              () async {
                                final isForm1Valid =
                                    formKey1.currentState!.validate();
                                final isForm2Valid =
                                    formKey2.currentState!.validate();

                                if (isForm1Valid && isForm2Valid) {
                                  await store.duplicateEntryCheck();

                                  if (!store.getIsError()) {
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
                                                        .signUpWithEmailPassword(
                                                            context);

                                                    if (!store.getIsError()) {
                                                      Navigator
                                                          .pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const RegisterClient(),
                                                        ),
                                                        (route) => false,
                                                      );
                                                    } else {
                                                      Navigator.pop(context);
                                                    }
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
                                }
                              },
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
