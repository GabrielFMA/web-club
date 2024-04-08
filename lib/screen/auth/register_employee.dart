import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/components/auth/textfield_password.dart';
import 'package:web_simclub/components/auth/textfield_string.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/store/employee.store.dart';

class RegisterEmployee extends StatefulWidget {
  const RegisterEmployee({super.key});

  @override
  State<RegisterEmployee> createState() => _RegisterEmployeeState();
}

class _RegisterEmployeeState extends State<RegisterEmployee> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String valueCargo = 'Clique aqui para selecionar um cargo';

  List<String> listCargo = [
    'Clique aqui para selecionar um cargo',
    'Administrador',
    'Gerente',
    'Funcionário',
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
                                  "Registrar",
                                  style: TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              //Cargo
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green, width: 2),
                                    borderRadius: BorderRadius.circular(8)),
                                child: DropdownButton<String>(
                                  underline: const SizedBox(),
                                  isExpanded: true,
                                  value: valueCargo,
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      valueCargo = newValue!;
                                      store.setCargo(valueCargo);
                                    });
                                  },
                                  items: listCargo.map((String valueItem) {
                                    return DropdownMenuItem<String>(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                ),
                              ),

                              //Space
                              const SizedBox(height: 5),

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

                              //Senha field
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

                              //Confirmar Senha field
                              TextFieldConfirmPassword(
                                confirmPassword:
                                    _confirmPasswordController.text,
                              ),

                              //Space
                              const SizedBox(height: 15),

                              buttonDefault(
                                context,
                                () async {
                                  if (formKey.currentState!.validate() &&
                                      valueCargo !=
                                          'Clique aqui para selecionar um cargo') {
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
