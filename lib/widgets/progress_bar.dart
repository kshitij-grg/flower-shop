import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({this.size = 50, Key? key}) : super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Lottie.asset(
          'assets/lottie/progress-bar.json',
          width: size,
        ),
      ),
    );
  }
}
