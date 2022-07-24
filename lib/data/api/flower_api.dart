import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nomadic_florist/data/models/flower/flower_response.dart';
import 'package:nomadic_florist/data/models/flower/occasion_response.dart';

import '../../constants.dart';

class FlowerApi {
  static Future<List<Occasions>> getOccasions() async {
    final url = baseUrl + "get-occasions";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return OccasionResponse.fromJson(json.decode(response.body)).occasions;
    } else {
      throw Exception('Failed to Load Occasions');
    }
  }

  static Future<List<Flowers>> getFlowers() async {
    final url = baseUrl + "get-all-flowers";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return FlowerResponse.fromJson(json.decode(response.body)).flowers;
    } else {
      throw Exception('Failed to Load Flowers');
    }
  }
}
