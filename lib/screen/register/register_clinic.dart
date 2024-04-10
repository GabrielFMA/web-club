import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/screen/register/register_exam.dart';
import 'package:web_simclub/components/auth/textfield_string.dart';
import 'package:web_simclub/store/clinic.store.dart';

class RegisterClinic extends StatefulWidget {
  const RegisterClinic({Key? key}) : super(key: key);

  @override
  State<RegisterClinic> createState() => _RegisterClinicState();
}

class _RegisterClinicState extends State<RegisterClinic> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _phoneController = TextEditingController();
  final _contractController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<int> listExam = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int valueExam = 1;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ClinicStore>(context);

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
                                  "Registrar Clinica",
                                  style: TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              //Nome field
                              TextFieldString(
                                icon: const Icon(Icons.house),
                                hintText: "Digite o nome",
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

                              //CNPJ field
                              TextFieldString(
                                icon: const Icon(Icons.document_scanner),
                                hintText: "CNPJ",
                                text: _cpfController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite o CNPJ";
                                  }
                                  if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
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
                                icon: const Icon(Icons.email),
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

                              //Telefone field
                              TextFieldString(
                                icon: const Icon(Icons.phone),
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

                              //Endereço field
                              TextFieldString(
                                icon:
                                    const Icon(Icons.insert_drive_file_rounded),
                                hintText: "Endereço",
                                text: _contractController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite seu Endereço";
                                  }
                                  store.setAddress(text);
                                  return null;
                                },
                              ),
  
                              const SizedBox(height: 10),
                              //Space

                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green, width: 2),
                                    borderRadius: BorderRadius.circular(8)),
                                child: DropdownButton<int>(
                                  underline: const SizedBox(),
                                  isExpanded: true,
                                  value: valueExam,
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      valueExam = newValue!;
                                      store.setExam(valueExam);
                                    });
                                  },
                                  items: listExam.map((int valueItem) {
                                    return DropdownMenuItem<int>(
                                      value: valueItem,
                                      child: Text(valueItem.toString()),
                                    );
                                  }).toList(),
                                ),
                              ),

                              const SizedBox(height: 10),

                              //Button
                              buttonDefault(
                                context,
                                () async {
                                  if (formKey.currentState!.validate()) {
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
