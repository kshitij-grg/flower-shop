import 'package:flutter/material.dart';

import '../constants.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const PasswordField(this.label, {required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:
          widget.controller, //to access the value from above stateful widget
      obscureText: isPassword,
      cursorColor: firstColor,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              isPassword = !isPassword;
            });
          },
          child: isPassword
              ? const Icon(Icons.visibility_off, color: Colors.grey)
              : const Icon(Icons.visibility, color: firstColor),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        border: const OutlineInputBorder(),
        focusedBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: firstColor)),
        floatingLabelStyle: const TextStyle(color: firstColor),
        labelText: widget.label,
      ),
    );
  }
}
