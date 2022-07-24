import 'dart:convert';
import 'package:nomadic_florist/data/models/auth/login_response.dart';
import 'package:nomadic_florist/data/models/cart/cart_response.dart';
import '../../../constants.dart';
import 'package:http/http.dart' as http;

class CartApi {
  static String key = "cart";

  static Future<List<Flowers>> get(apiKey) async {
    const url = baseUrl + "cart";
    final response = await http.get(Uri.parse(url), headers: {
      "api_key": "$apiKey",
    });

    if (response.statusCode == 200) {
      print(response.body);
      return CartResponse.fromJson(json.decode(response.body)).flowers;
    } else {
      throw Exception('Failed to Load Cart Items');
    }
  }

  static Future<LoginResponse> set({
    required String apiKey,
    required int id,
    required String cartQuantity,
  }) async {
    const url = baseUrl + "cart";

    Map<String, String> requestBody = <String, String>{
      'flower_id': id.toString(),
      'quantity': cartQuantity,
    };

    final request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields.addAll(requestBody)
      ..headers
          .addAll({"api_key": apiKey, 'Content-Type': 'multipart/form-data'});

    var response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final data = json.decode(respStr);
      // print(data);
      LoginResponse response = LoginResponse.fromJson(data);
      // CartFood cartFood = CartFood.fromJson(data);
      return response;
    } else if (response.statusCode == 401) {
      throw Exception('Some of the fields are missing');
    } else {
      throw Exception(respStr);
    }
  }

  static Future<LoginResponse> remove({
    required String apiKey,
    required int cartId,
  }) async {
    const url = baseUrl + "cart";

    Map<String, String> qParams = <String, String>{
      'cart_id': cartId.toString(),
    };

    Uri uri = Uri.parse(url);
    final finalUri = uri.replace(queryParameters: qParams); //USE THIS

    final response = await http.delete(finalUri, headers: {
      "api_key": apiKey,
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      throw Exception('Failed to Delete Cart Items');
    }
  }

  static Future<LoginResponse> updateCart(
      {required String apiKey,
      required int cartId,
      required String quantity}) async {
    const url = baseUrl + "cart";
    Uri uri = Uri.parse(url);

    Map<String, String> requestBody = <String, String>{
      "cart_id": cartId.toString(),
      "cart_quantity": quantity,
    };

    final response = await http.put(uri, body: requestBody, headers: {
      "api_key": apiKey,
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      throw Exception('Failes to update Cart Item');
    }
  }
}
