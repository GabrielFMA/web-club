import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/components/auth/textfield_password.dart';
import 'package:web_simclub/components/auth/textfield_string.dart';
import 'package:web_simclub/store/auth.store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(10), // Define a borda arredondada
            ),
            width: MediaQuery.of(context).size.width * 0.3,
            margin: const EdgeInsets.only(left: 20, right: 10),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ListTile(
                      title: Text(
                        "Entrar na sua conta",
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFieldString(
                      icon: const Icon(Icons.email),
                      hintText: "Digite seu email",
                      text: _emailController.text,
                      shouldValidate: true,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return "Digite um e-mail";
                        }
                        store.setEmail(text);
                        return null;
                      },
                    ),
                    TextFieldPassword(password: _passwordController.text),
                    const SizedBox(height: 20),
                    buttonDefault(
                      context,
                      () {
                        if (formKey.currentState!.validate()) {
                          store.signInWithEmailPassword(context);
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
            "LOGIN",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
