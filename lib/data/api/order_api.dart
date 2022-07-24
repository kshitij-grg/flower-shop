import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nomadic_florist/data/models/order/order_response.dart';
import 'dart:convert';
import '../../app_controller.dart';
import '../../constants.dart';
import '../models/auth/login_response.dart';

class OrderApi {
  static Future<LoginResponse> checkout(
      {required String apiKey,
      required String orderTime,
      required String orderDate,
      required String orderStatus,
      required String paymentType,
      required int addressId}) async {
    final url = baseUrl + "order";
    Uri uri = Uri.parse(url);

    Map<String, String> requestBody = <String, String>{
      "order_time": orderTime,
      "order_date": orderDate,
      "order_status": orderStatus,
      "payment_type": paymentType,
      "address_id": addressId.toString(),
    };

    final response = await http.post(uri, body: requestBody, headers: {
      "api_key": apiKey,
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      throw Exception(response.statusCode);
    }
  }

  static Future<List<OrderHistory>> getOrderHistory() async {
    String apiKey = Get.find<AppController>().getToken();
    final url = baseUrl + "order";
    Uri uri = Uri.parse(url);

    final response = await http.get(uri, headers: {"api_key": apiKey});

    if (response.statusCode == 200) {
      return OrderResponse.fromJson(json.decode(response.body)).orderHistory;
    } else if (response.statusCode == 400) {
      return OrderResponse.fromJson(json.decode(response.body)).orderHistory;
    } else {
      throw Exception("Failed to load Order History");
    }
  }
}
