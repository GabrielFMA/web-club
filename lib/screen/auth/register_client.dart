import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/store/client.store.dart';
import 'package:web_simclub/components/auth/textfield_password.dart';
import 'package:web_simclub/components/auth/textfield_string.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _phoneController = TextEditingController();
  final _contractController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
                                  "Registrar",
                                  style: TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              //Nome field
                              TextFieldString(
                                icon: const Icon(Icons.person),
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
                                icon: const Icon(Icons.document_scanner),
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

                              //Contract field
                              TextFieldString(
                                icon:
                                    const Icon(Icons.insert_drive_file_rounded),
                                hintText: "Contrato",
                                text: _contractController.text,
                                shouldValidate: true,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "Digite seu Contrato";
                                  }
                                  // Verifica se contém apenas números
                                  if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
                                    return "Digite apenas números";
                                  }
                                  store.setNumContract(text);
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
                                  store.setPassword(text);
                                  return null;
                                },
                              ),

                              //Confirm Password field
                              TextFieldConfirmPassword(
                                confirmPassword:
                                    _confirmPasswordController.text,
                              ),

                              //Space
                              const SizedBox(height: 15),

                              //Button
                              buttonDefault(
                                context,
                                () async {
                                  if (formKey.currentState!.validate()) {
                                    await store
                                        .signUpWithEmailPassword(context);
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
          "REGISTRAR",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
