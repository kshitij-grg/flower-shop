import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/constants.dart';
import 'package:nomadic_florist/modules/auth_tab/register/register_screen.dart';
import 'package:nomadic_florist/widgets/custom_button.dart';
import 'package:nomadic_florist/widgets/password_field.dart';
import 'package:nomadic_florist/widgets/progress_bar.dart';
import 'package:nomadic_florist/widgets/text_field.dart';

import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [fifthColor, firstColor])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo-extended.png',
                    width: 230,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login!',
                          style: TextStyle(fontSize: 22),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Welcome back!',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InputTextField(
                            label: "Your Email",
                            textEditingController: controller.emailController,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress),
                        const SizedBox(
                          height: 30,
                        ),
                        PasswordField("Your Password",
                            controller: controller.passwordController),
                        const SizedBox(
                          height: 30,
                        ),
                        Obx(() => controller.isLoading.isTrue
                            ? const ProgressBar(
                                size: 100,
                              )
                            : CustomButton(
                                label: "Login", onPress: controller.login)),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Dont't have an account?"),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Get.off(() => const RegisterScreen());
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(color: firstColor),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
