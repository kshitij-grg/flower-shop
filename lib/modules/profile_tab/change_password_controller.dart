import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../app_controller.dart';
import '../../constants.dart';
import '../../data/api/auth_api.dart';

class ChangePasswordController extends GetxController {
  final isLoading = false.obs;
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  final controller = Get.find<AppController>();
  String apiKey = Get.find<AppController>().getToken();

  Future<void> changePassword() async {
    String password = passwordController.text.trim();
    String newPassword = newPasswordController.text.trim();
    String confirmNewPassword = confirmNewPasswordController.text.trim();

    if (password.isEmpty || newPassword.isEmpty || confirmNewPassword.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }

    if (password != controller.getPassword()) {
      Fluttertoast.showToast(
          msg: "Current password is not correct",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: firstColor,
          textColor: Colors.black,
          fontSize: 16.0);
      return;
    }

    if (newPassword == password) {
      Fluttertoast.showToast(
          msg: "Nothing to change",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: firstColor,
          textColor: Colors.black,
          fontSize: 16.0);
      return;
    }

    if (confirmNewPassword != newPassword) {
      Fluttertoast.showToast(
          msg: "Passwords didnot match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: firstColor,
          textColor: Colors.black,
          fontSize: 16.0);
      return;
    }

    isLoading(true);

    try {
      var response =
          await AuthApi.changePassword(password: newPassword, apiKey: apiKey);

      isLoading(false);
      if (response.error != null && response.error == false) {
        Fluttertoast.showToast(
            msg: "Your Password has been changed! Please Login again..",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: firstColor,
            textColor: Colors.black,
            fontSize: 16.0);
        passwordController.clear();
        newPasswordController.clear();
        confirmNewPasswordController.clear();
        controller.logout();
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
    passwordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.onClose();
  }
}
