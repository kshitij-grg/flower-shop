import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_controller.dart';
import '../../constants.dart';
import '../../data/api/auth_api.dart';

class ProfileController extends GetxController {
  final isLoading = false.obs;
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phnController = TextEditingController();
  final controller = Get.find<AppController>();
  String apiKey = Get.find<AppController>().getToken();

  @override
  void onInit() {
    super.onInit();
    emailController.text = controller.getEmail();
    nameController.text = controller.getName();
    phnController.text = controller.getPhnNum();
    ageController.text = controller.getAge();
  }

  Future<void> getProfileDetails() async {
    await AuthApi.getUserDetails();
  }

  Future<void> updateProfile() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String phnNum = phnController.text.trim();
    String age = ageController.text.trim();

    if (name.isEmpty || email.isEmpty || age.isEmpty || phnNum.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }

    isLoading(true);

    try {
      var response = await AuthApi.updateProfile(
          name: name, email: email, age: age, contact: phnNum, apiKey: apiKey);
      isLoading(false);
      if (response.error != null && response.error == false) {
        controller.isLoggedIn(true);
        nameController.clear();
        emailController.clear();
        ageController.clear();
        phnController.clear();
        await AuthApi.getUserDetails();
        Get.back();
        Get.rawSnackbar(
            backgroundColor: firstColor,
            message: 'Profile updated successfully');
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
    phnController.dispose();
    ageController.dispose();
    super.onClose();
  }
}
