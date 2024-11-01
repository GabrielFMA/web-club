// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/screen/register/partner/register_exam.dart';
import 'package:web_simclub/components/auth/textfield_string.dart';
import 'package:web_simclub/store/register/partner/partner.store.dart';

final _nameController = TextEditingController();
final _emailController = TextEditingController();
final _cpnjController = TextEditingController();
//form2
final _cepController = TextEditingController();
final _phoneController = TextEditingController();
final _streetController = TextEditingController();
final _numberController = TextEditingController();
final _complementController = TextEditingController();
final _districtController = TextEditingController();
final _cityController = TextEditingController();
final _stateController = TextEditingController();

int? _valueExam;

List<int> _listExam = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

class RegisterPartner extends StatefulWidget {
  const RegisterPartner({super.key});

  @override
  State<RegisterPartner> createState() => _RegisterPartnerState();
}

class _RegisterPartnerState extends State<RegisterPartner> {
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PartnerStore>(context);

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
                                "Registrar Parceiro",
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
                                        //Name field
                                        TextFieldString(
                                          icon: Icon(MdiIcons
                                              .accountSupervisorCircleOutline),
                                          hintText: "Nome do parceiro",
                                          text: _nameController.text,
                                          shouldValidate: true,
                                          validator: (text) {
                                            if (text!.isEmpty) {
                                              return "Digite um nome";
                                            }
                                            store.setName(text);
                                            return null;
                                          },
                                        ),

                                        //CPF field
                                        TextFieldString(
                                          icon: Icon(
                                              MdiIcons.officeBuildingOutline),
                                          hintText: "CNPJ",
                                          text: _cpnjController.text,
                                          shouldValidate: true,
                                          validator: (text) {
                                            if (text!.isEmpty) {
                                              return "CNPJ";
                                            }
                                            if (!RegExp(r'^[0-9]+$')
                                                .hasMatch(text)) {
                                              return "Digite apenas números";
                                            }
                                            if (text.length != 14) {
                                              return 'Digite um CNPJ válido';
                                            }
                                            store.setCnpj(text);
                                            return null;
                                          },
                                        ),

                                        //Email field
                                        TextFieldString(
                                          icon: Icon(MdiIcons.emailOutline),
                                          hintText: "Email",
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

                                        //Space
                                        const SizedBox(height: 5),

                                        //Exams container
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 8),
                                          decoration: BoxDecoration(
                                            color: Colors.green[500]
                                                ?.withOpacity(.3),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                MdiIcons.textBoxMultipleOutline,
                                                color: Colors.black,
                                              ),
                                              const SizedBox(width: 15),
                                              Expanded(
                                                child: DropdownButtonFormField<
                                                    String>(
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        "Selecione a quantidade de consultas",
                                                    hintStyle: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return "Selecione a quantidade de consultas";
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _valueExam =
                                                          int.tryParse(value!);
                                                      store.setExam(_valueExam);
                                                    });
                                                  },
                                                  items:
                                                      _listExam.map((valueItem) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value:
                                                          valueItem.toString(),
                                                      child: Text(
                                                        valueItem > 1
                                                            ? '$valueItem Consultas'
                                                            : (valueItem == 1
                                                                ? '$valueItem Consulta'
                                                                : ''),
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
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

                            const SizedBox(height: 12),

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
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterExam(),
                                    ),
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

  Widget buttonDefault(BuildContext context, VoidCallback? onClick) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 50,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.green[500]),
      child: TextButton(
        onPressed: onClick,
        child: const Text(
          "PROSSEGUIR",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
