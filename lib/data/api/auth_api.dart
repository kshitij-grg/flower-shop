import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nomadic_florist/data/models/auth/login_response.dart';
import '../../app_controller.dart';
import '../../constants.dart';

class AuthApi {
  static Future<LoginResponse> register(
      {required String name,
      required String email,
      required String age,
      required String contact,
      required String password}) async {
    const url = baseUrl + "register";

    Map<String, String> requestBody = <String, String>{
      'name': name,
      'email': email,
      'age': age,
      'contact': contact,
      'password': password
    };

    final response =
        await http.post(Uri.parse(url), body: requestBody, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      await Get.find<AppController>()
          .sharedPreferences
          .setString("apiKey", loginResponse.apiKey ?? '');
      return loginResponse;
    } else if (response.statusCode == 401) {
      throw Exception('Some of the fields are missing');
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<LoginResponse> login(
      {required String email, required String password}) async {
    const url = baseUrl + "login";

    Map<String, String> requestBody = <String, String>{
      'email': email,
      'password': password
    };

    final response =
        await http.post(Uri.parse(url), body: requestBody, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      await Get.find<AppController>()
          .sharedPreferences
          .setString("apiKey", loginResponse.apiKey ?? '');
      await Get.find<AppController>()
          .sharedPreferences
          .setString("name", loginResponse.name ?? '');
      await Get.find<AppController>()
          .sharedPreferences
          .setString("email", loginResponse.email ?? '');
      await Get.find<AppController>()
          .sharedPreferences
          .setString("age", loginResponse.age ?? '');
      await Get.find<AppController>()
          .sharedPreferences
          .setString("contact", loginResponse.contact ?? '');
      await Get.find<AppController>()
          .sharedPreferences
          .setString("password", loginResponse.password ?? '');
      return loginResponse;
    } else if (response.statusCode == 401) {
      throw Exception('Some of the fields are missing');
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<LoginResponse> updateProfile(
      {required String name,
      required String email,
      required String age,
      required String contact,
      required String apiKey}) async {
    const url = baseUrl + "update-profile";
    final uri = Uri.parse(url);

    Map<String, String> requestBody = <String, String>{
      "name": name,
      "email": email,
      "age": age,
      "contact": contact
    };

    final response = await http.put(uri, body: requestBody, headers: {
      "api_key": apiKey,
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      throw Exception('Failes to update Profile');
    }
  }

  static Future<LoginResponse> changePassword(
      {required String password, required String apiKey}) async {
    const url = baseUrl + "change-password";
    final uri = Uri.parse(url);

    Map<String, String> requestBody = <String, String>{
      "password": password,
    };

    final response = await http.put(uri, body: requestBody, headers: {
      "api_key": apiKey,
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      throw Exception('Failed to change Password');
    }
  }

  static Future<LoginResponse> getUserDetails() async {
    String apiKey = Get.find<AppController>().getToken();
    var url = baseUrl + "get-customer-details";
    final uri = Uri.parse(url);

    final response = await http.get(uri, headers: {"api_key": apiKey});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      await Get.find<AppController>()
          .sharedPreferences
          .setString("name", loginResponse.name ?? '');
      await Get.find<AppController>()
          .sharedPreferences
          .setString("email", loginResponse.email ?? '');
      await Get.find<AppController>()
          .sharedPreferences
          .setString("age", loginResponse.age ?? '');
      await Get.find<AppController>()
          .sharedPreferences
          .setString("contact", loginResponse.contact ?? '');
      await Get.find<AppController>()
          .sharedPreferences
          .setString("password", loginResponse.password ?? '');
      return loginResponse;
    } else {
      throw Exception('Failed to load User Data');
    }
  }
}
