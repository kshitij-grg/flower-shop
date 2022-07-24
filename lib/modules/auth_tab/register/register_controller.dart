import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/constants.dart';
import 'package:nomadic_florist/data/api/auth_api.dart';
import 'package:nomadic_florist/modules/auth_tab/login/login_screen.dart';
import '../../../app_controller.dart';

class RegisterController extends GetxController {
  final isLoading = false.obs;
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final contactController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final controller = Get.find<AppController>();
  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

//       r'^
//   (?=.*[A-Z])       // should contain at least one upper case
//   (?=.*[a-z])       // should contain at least one lower case
//   (?=.*?[0-9])      // should contain at least one digit
//   .{8,}             // Must be at least 8 characters in length
// $

  Future<void> register() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String age = ageController.text.trim();
    String contact = contactController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || contact.isEmpty || password.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }
    if (!emailRegex.hasMatch(email)) {
      Get.rawSnackbar(
          message: "Invalid email pattern", backgroundColor: firstColor);
      return;
    }

    if (!regex.hasMatch(password)) {
      Get.rawSnackbar(
          backgroundColor: firstColor,
          message:
              "Enter Valid password!!\nPassword must contain atleast 8 characters with one Small and Capital Letter.");
      return;
    }
    if (confirmPassword != password) {
      Get.rawSnackbar(
          backgroundColor: firstColor, message: "Passwords didnot match");
      return;
    }

    isLoading(true);

    try {
      var response = await AuthApi.register(
          name: name,
          email: email,
          password: password,
          contact: contact,
          age: age);
      isLoading(false);
      if (response.error != null && response.error == false) {
        controller.isLoggedIn(true);
        Get.rawSnackbar(
            backgroundColor: firstColor, message: 'Register successful');
        Get.off(() => const LoginScreen());
      } else {
        Get.rawSnackbar(backgroundColor: firstColor, message: response.message);
      }
    } catch (e) {
      isLoading(false);
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = e.toString();
      }
      Get.rawSnackbar(message: errorMessage);
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    ageController.dispose();
    contactController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
