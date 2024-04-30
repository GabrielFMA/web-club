// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/components/auth/textfield_string.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/store/auth/auth.store.dart';
import 'package:web_simclub/store/sell/sell.store.dart';

String? _namePlan;
final _budgetController = TextEditingController();
final _contractController = TextEditingController();
final _employeeController = TextEditingController();
//Formkey2
final _clientController = TextEditingController();
final _nameController = TextEditingController();
final _cpfController = TextEditingController();
final _rgController = TextEditingController();
final _emailController = TextEditingController();

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

class GerenateSales extends StatefulWidget {
  const GerenateSales({super.key});

  @override
  State<GerenateSales> createState() => _GerenateSalesState();
}

class _GerenateSalesState extends State<GerenateSales> {
  late Future<void> _loadDataFuture;

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

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
          return _buildContent ();
        }
      },
    );
  }


  Widget _buildContent() {
    final store = Provider.of<SellStore>(context);
    final auth = Provider.of<AuthStore>(context);

    final planName = store.getPlanNames().toSet().toList();

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
                                "Venda",
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
                                        //budget field
                                        TextFieldString(
                                          icon: Icon(store.trueClient()
                                              ? MdiIcons.clipboardOffOutline
                                              : MdiIcons
                                                  .clipboardTextSearchOutline),
                                          hintText: store.trueClient()
                                              ? "Bloqueado"
                                              : "Número de orçamento",
                                          text: _budgetController.text,
                                          shouldValidate: true,
                                          enabled: !store.trueClient(),
                                          onChanged: (text) async {
                                            if (text.trim().isNotEmpty) {
                                              await store.budgetCheck(text);
                                            } else {
                                              store.restoreData();
                                            }
                                            setState(() {
                                              if (store.trueBudget()) {
                                                formKey2.currentState?.reset();
                                              }
                                            });
                                          },
                                          validator: (text) {
                                            if (text!.trim().isEmpty) {
                                              if (store
                                                  .getClient()
                                                  .trim()
                                                  .isEmpty) {
                                                return "Pesquise um cliente ou digite um numero de orçamento";
                                              }
                                            }
                                            return null;
                                          },
                                        ),

                                        const Divider(height: 20, thickness: 1),
                                        const SizedBox(height: 5),

                                        //Drawer field
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
                                                  MdiIcons.noteMultipleOutline),
                                              const SizedBox(width: 15),
                                              Expanded(
                                                child: DropdownButtonFormField<
                                                    String>(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: store.trueBudget()
                                                        ? store.getPlan()
                                                        : "Selecione um plano",
                                                    hintStyle: const TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  validator: store.trueBudget()
                                                      ? (_) {
                                                          store.planDataCheck();
                                                          return null;
                                                        }
                                                      : (value) {
                                                          if (_namePlan ==
                                                                  null ||
                                                              _namePlan!
                                                                  .isEmpty) {
                                                            return "Selecione um plano";
                                                          }
                                                          return null;
                                                        },
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _namePlan = value;
                                                      store.setPlan(value!);
                                                    });
                                                  },
                                                  items:
                                                      planName.map((valueItem) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: valueItem,
                                                      child: Text(valueItem),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        const SizedBox(height: 5),

                                        //Contract field
                                        TextFieldString(
                                          icon: Icon(MdiIcons.textBoxOutline),
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

                                        //Employee field
                                        TextFieldString(
                                          icon:
                                              Icon(MdiIcons.accountTieOutline),
                                          hintText: auth.getName(),
                                          enabled: false,
                                          text: _employeeController.text,
                                          shouldValidate: true,
                                          validator: (_) {
                                            store.setEmployee(auth.getName());
                                            return null;
                                          },
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
                                        TextFieldString(
                                          icon: Icon(
                                            store.trueBudget()
                                                ? MdiIcons.lockCheckOutline
                                                : MdiIcons.accountSearchOutline,
                                          ),
                                          hintText: store.trueBudget()
                                              ? "Cliente encontrado"
                                              : "Pesquise o Cliente (Email, CPF ou RG)",
                                          enabled: !store.trueBudget(),
                                          text: _clientController.text,
                                          shouldValidate: true,
                                          onChanged: (text) async {
                                            if (text.trim().isNotEmpty) {
                                              await store.clientDataCheck(text);
                                            } else if (!store.trueBudget()) {
                                              store.restoreData();
                                            }
                                            setState(() {});
                                          },
                                          validator: (text) {
                                            if (text!.trim().isEmpty &&
                                                !store.trueBudget()) {
                                              return "Digite um Email, CPF ou RG!";
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
                                              text = text.replaceAll(
                                                  RegExp(r'[-.]'), '');
                                              text = text.toLowerCase();
                                              store.setClient(text);
                                              return null;
                                            } else if (store.trueBudget()) {
                                              return null;
                                            }
                                            return "Digite um Email, CPF ou RG!";
                                          },
                                        ),
                                        const Divider(height: 20, thickness: 1),
                                        TextFieldString(
                                          icon: Icon(MdiIcons.accountOutline),
                                          hintText: (store.trueBudget() ||
                                                  store.trueClient())
                                              ? store.getClientName()
                                              : "Nome",
                                          enabled: false,
                                          text: _nameController.text,
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
                                                hintText: (store.trueBudget() ||
                                                        store.trueClient())
                                                    ? store.getClientCPF()
                                                    : "CPF",
                                                enabled: false,
                                                text: _cpfController.text,
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
                                                hintText: (store.trueBudget() ||
                                                        store.trueClient())
                                                    ? store.getClientRG()
                                                    : "RG",
                                                enabled: false,
                                                text: _rgController.text,
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
                                          hintText: (store.trueBudget() ||
                                                  store.trueClient())
                                              ? store.getClientEmail()
                                              : "Email",
                                          enabled: false,
                                          text: _emailController.text,
                                          shouldValidate: true,
                                          validator: (text) {
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
                                //Confirmation screen
                                if (!store.getIsError() &&
                                    isForm1Valid &&
                                    isForm2Valid) {
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
                                                          const GerenateSales(),
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
