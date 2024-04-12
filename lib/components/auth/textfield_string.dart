// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class TextFieldString extends StatelessWidget {
  final String text;
  final String hintText;
  final Icon icon;
  final bool shouldValidate;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const TextFieldString({
    super.key,
    required this.icon,
    required this.hintText,
    required this.text,
    required this.shouldValidate,
    required this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController(text: text);

    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green[500]?.withOpacity(.3),
      ),
      child: TextFormField(
        initialValue: _textController.text,
        validator: shouldValidate ? validator : null,
        decoration: InputDecoration(
          icon: icon,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
