import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/modules/auth_tab/login/login_screen.dart';
import 'package:nomadic_florist/modules/auth_tab/register/register_controller.dart';
import 'package:nomadic_florist/widgets/custom_button.dart';
import 'package:nomadic_florist/widgets/password_field.dart';
import 'package:nomadic_florist/widgets/progress_bar.dart';
import 'package:nomadic_florist/widgets/text_field.dart';
import '../../../constants.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

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
                          'Sign up!',
                          style: TextStyle(fontSize: 22),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Create an account to \ncontinue!',
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
                        InputTextField(
                            label: "Your Name",
                            textEditingController: controller.nameController,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.name),
                        const SizedBox(
                          height: 30,
                        ),
                        InputTextField(
                            label: "Your Age",
                            textEditingController: controller.ageController,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.phone),
                        const SizedBox(
                          height: 30,
                        ),
                        InputTextField(
                            label: "Your Phone Number",
                            textEditingController: controller.contactController,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.phone),
                        const SizedBox(
                          height: 30,
                        ),
                        PasswordField("Your Password",
                            controller: controller.passwordController),
                        const SizedBox(
                          height: 30,
                        ),
                        PasswordField("Confirm Password",
                            controller: controller.confirmPasswordController),
                        const SizedBox(
                          height: 30,
                        ),
                        Obx(
                          () => controller.isLoading.isTrue
                              ? const ProgressBar(
                                  size: 100,
                                )
                              : CustomButton(
                                  label: "Create Account",
                                  onPress: controller.register,
                                ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Get.off(() => const LoginScreen());
                              },
                              child: const Text(
                                "Sign In",
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
