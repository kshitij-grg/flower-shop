import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({this.size = 50, Key? key}) : super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Lottie.asset(
          'assets/lottie/loading.json',
          width: double.infinity,
          height: size,
        ),
      ),
    );
  }
}
