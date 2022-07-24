import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/models/auth/login_response.dart';
import 'modules/auth_tab/login/login_screen.dart';

class AppController extends GetxController {
  final SharedPreferences sharedPreferences;
  final isLoggedIn = false.obs;
  final isNoInternet = false.obs;

  AppController(this.sharedPreferences) {
    String? apiKey = sharedPreferences.getString('apiKey');

    if (apiKey == "" || apiKey == null) {
      isLoggedIn(false);
    } else {
      isLoggedIn(true);
    }
  }

  void login(LoginResponse loginResponse) {
    isLoggedIn(true);
  }

  String getToken() {
    return sharedPreferences.getString('apiKey') ?? '';
  }

  String getName() {
    return sharedPreferences.getString('name') ?? '';
  }

  String getEmail() {
    return sharedPreferences.getString('email') ?? '';
  }

  String getAge() {
    return sharedPreferences.getString('age') ?? '';
  }

  String getPhnNum() {
    return sharedPreferences.getString('contact') ?? '';
  }

  String getPassword() {
    return sharedPreferences.getString('password') ?? '';
  }

  void logout() {
    sharedPreferences.setString('apiKey', '');
    sharedPreferences.setString('name', '');
    sharedPreferences.setString('email', '');
    sharedPreferences.setString('contact', '');
    sharedPreferences.setString('password', '');
    isLoggedIn(false);
    Get.offAll(() => LoginScreen());
  }
}
