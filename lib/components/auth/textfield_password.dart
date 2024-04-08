// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:web_simclub/store/auth.store.dart';

class TextFieldPassword extends StatelessWidget {
  final String password;
  final bool shouldValidate;
  final String? Function(String?)? validator;
  const TextFieldPassword(
      {super.key,
      required this.password,
      required this.shouldValidate,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

    TextEditingController _passwordController =
        TextEditingController(text: password);

    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green[500]?.withOpacity(.3),
      ),
      child: Observer(
        builder: (_) => TextFormField(
          controller: _passwordController,
          validator: shouldValidate ? validator : null,
          obscureText: !store.isVisible,
          decoration: InputDecoration(
            icon: const Icon(Icons.lock),
            border: InputBorder.none,
            hintText: "Senha",
            suffixIcon: IconButton(
              onPressed: () {
                store.visible();
              },
              icon: Icon(
                store.isVisible ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldConfirmPassword extends StatelessWidget {
  final String confirmPassword;

  const TextFieldConfirmPassword({super.key, required this.confirmPassword});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

    TextEditingController confirmPasswordController =
        TextEditingController(text: confirmPassword);

    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green[500]?.withOpacity(.3),
      ),
      child: Observer(
        builder: (_) => TextFormField(
          controller: confirmPasswordController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Digite uma senha";
            }
            return null;
          },
          obscureText: !store.isVisible,
          decoration: InputDecoration(
            icon: const Icon(Icons.lock),
            border: InputBorder.none,
            hintText: "Confirmar Senha",
            suffixIcon: IconButton(
              onPressed: () {
                store.visible();
              },
              icon: Icon(
                  store.isVisible ? Icons.visibility : Icons.visibility_off),
            ),
          ),
        ),
      ),
    );
  }
}
