import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_controller.dart';
import 'modules/auth_tab/login/login_screen.dart';
import 'modules/main_tab/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.find<AppController>();
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 4), () {
      navigateUser();
    });
  }

  void navigateUser() {
    var status = controller.isLoggedIn.value;
    if (status == true) {
      Get.off(() => const MainScreen());
    } else {
      Get.off(() => const LoginScreen());
    }
  }
}
