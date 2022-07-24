import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/password_field.dart';
import 'change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChangePasswordController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              PasswordField("Current Password",
                  controller: controller.passwordController),
              const SizedBox(
                height: 30,
              ),
              PasswordField("New Password",
                  controller: controller.newPasswordController),
              const SizedBox(
                height: 30,
              ),
              PasswordField("Confirm New Password",
                  controller: controller.confirmNewPasswordController),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                label: "Change Password",
                onPress: controller.changePassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
