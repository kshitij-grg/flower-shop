import 'package:flutter/material.dart';
import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.label,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      color: firstColor,
      minWidth: MediaQuery.of(context).size.width,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
