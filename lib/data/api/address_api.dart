import 'dart:convert';
import 'package:nomadic_florist/data/models/address/address_reponse.dart';
import 'package:nomadic_florist/data/models/address/address_resquest.dart';

import '../../constants.dart';
import 'package:http/http.dart' as http;

class AddressApi {
  static Future<AddressRequest> address({
    required String apiKey,
    required String street,
    required String houseNo,
    required String city,
  }) async {
    const url = baseUrl + "address";

    Map<String, String> requestBody = <String, String>{
      'street': street,
      'house_no': houseNo,
      'city': city,
    };

    Uri uri = Uri.parse(url);

    final response = await http.post(uri, body: requestBody, headers: {
      "api_key": apiKey,
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return AddressRequest.fromJson(data);
    } else {
      throw Exception('Error Occured while adding Address');
    }
  }

  static Future<List<Addresses>> getAddress({required String apiKey}) async {
    const url = baseUrl + "address";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri, headers: {"api_key": apiKey});

    if (response.statusCode == 200) {
      return AddressResponse.fromJson(json.decode(response.body)).addresses;
    } else if (response.statusCode == 400) {
      return AddressResponse.fromJson(json.decode(response.body)).addresses;
    } else {
      throw ("Failed to fetch Addresses");
    }
  }
}
