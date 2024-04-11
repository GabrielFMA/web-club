import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/screen/register/register_exam.dart';
import 'package:web_simclub/components/auth/textfield_string.dart';
import 'package:web_simclub/store/partner.store.dart';

class RegisterPartner extends StatefulWidget {
  const RegisterPartner({Key? key}) : super(key: key);

  @override
  State<RegisterPartner> createState() => _RegisterPartnerState();
}

class _RegisterPartnerState extends State<RegisterPartner> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _phoneController = TextEditingController();
  final _contractController = TextEditingController();
  final _cepController = TextEditingController();

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  List<int> listExam = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int? valueExam = null;

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
                        child: Row(
                          children: [
                            Expanded(
                              child: Form(
                                key: formKey1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
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
                                      icon:
                                          Icon(MdiIcons.officeBuildingOutline),
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
                                        store.setCnpj(text);
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
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Selecione a quantidades de exames oferecidos',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8),
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.green[500]?.withOpacity(.3),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(MdiIcons.textBoxMultipleOutline),
                                          const SizedBox(width: 15),
                                          Expanded(
                                            child: DropdownButton<int>(
                                              underline: const SizedBox(),
                                              isExpanded: true,
                                              value: valueExam,
                                              hint: const Text(
                                                "Clique aqui para selecionar",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              onChanged: (int? newValue) {
                                                setState(() {
                                                  valueExam = newValue!;
                                                  store.setExam(valueExam);
                                                });
                                              },
                                              items:
                                                  listExam.map((int valueItem) {
                                                return DropdownMenuItem<int>(
                                                  value: valueItem,
                                                  child: Text(
                                                    valueItem.toString(),
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
                                    const SizedBox(height: 10),
                                    buttonDefault(
                                      context,
                                      () async {
                                        if (formKey1.currentState!.validate()) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const RegisterExam(),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 20), // Espaço central
                            Expanded(
                              child: Form(
                                key: formKey2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const ListTile(
                                      title: Text(
                                        "Endereço",
                                        style: TextStyle(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    TextFieldString(
                                      icon: Icon(MdiIcons.mapMarkerOutline),
                                      hintText: "CEP",
                                      text: _cepController.text,
                                      shouldValidate: true,
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
                                      icon: Icon(MdiIcons.lockOpenOutline),
                                      hintText: "Rua",
                                      text: _contractController.text,
                                      shouldValidate: true,
                                      validator: (text) {
                                        if (text!.isEmpty) {
                                          return "Digite sua Rua";
                                        }
                                        store.setStreet(text);
                                        return null;
                                      },
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFieldString(
                                            icon: Icon(MdiIcons.pencilOutline),
                                            hintText: "Número",
                                            text: _contractController.text,
                                            shouldValidate: true,
                                            validator: (text) {
                                              if (text!.isEmpty) {
                                                return "Digite o número";
                                              }
                                              //store.setNumber(text);
                                              return null;
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                            width:
                                                10), // Espaço entre os textfields
                                        Expanded(
                                          child: TextFieldString(
                                            icon: Icon(MdiIcons.pencilOutline),
                                            hintText: "Complemento",
                                            text: _contractController.text,
                                            shouldValidate: true,
                                            validator: (text) {
                                              if (text!.isEmpty) {
                                                return "Digite o complemento";
                                              }
                                              //store.setComplement(text);
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFieldString(
                                      icon: Icon(MdiIcons.lockOpenOutline),
                                      hintText: "Bairro",
                                      text: _contractController.text,
                                      shouldValidate: true,
                                      validator: (text) {
                                        if (text!.isEmpty) {
                                          return "Digite seu Bairro";
                                        }
                                        store.setDistrict(text);
                                        return null;
                                      },
                                    ),
                                    TextFieldString(
                                      icon: Icon(MdiIcons.lockOpenOutline),
                                      hintText: "Cidade",
                                      text: _contractController.text,
                                      shouldValidate: true,
                                      validator: (text) {
                                        if (text!.isEmpty) {
                                          return "Digite sua Cidade";
                                        }
                                        store.setCity(text);
                                        return null;
                                      },
                                    ),
                                    TextFieldString(
                                      icon: Icon(MdiIcons.lockOpenOutline),
                                      hintText: "Estado",
                                      text: _contractController.text,
                                      shouldValidate: true,
                                      validator: (text) {
                                        if (text!.isEmpty) {
                                          return "Digite seu Estado";
                                        }
                                        store.setState(text);
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
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
