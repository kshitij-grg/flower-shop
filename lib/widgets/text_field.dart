import 'package:flutter/material.dart';

import '../constants.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    this.label,
    required this.textEditingController,
    required this.textInputAction,
    required this.textInputType,
    Key? key,
  }) : super(key: key);

  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String? label;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        border: const OutlineInputBorder(),
        focusedBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: firstColor)),
        labelText: label,
        floatingLabelStyle: const TextStyle(color: firstColor),
      ),
      cursorColor: firstColor,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      controller: textEditingController,
    );
  }
}
