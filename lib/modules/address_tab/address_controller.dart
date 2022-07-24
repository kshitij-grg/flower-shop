import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/data/api/address_api.dart';
import 'package:nomadic_florist/data/models/address/address_reponse.dart';

import '../../app_controller.dart';
import '../../constants.dart';

class AddressController extends GetxController {
  // for adding the addresses of a particular user to database
  final isLoading = false.obs;
  final isError = false.obs;
  final streetController = TextEditingController();
  final houseNoController = TextEditingController();
  final cityController = TextEditingController();
  String apiKey = Get.find<AppController>().getToken();
  String errorMessage = "";

  // while getting addresses from database
  List<Addresses>? addresses = [];
  final addressId = 0.obs;
  final streetName = "".obs;
  final houseNo = "".obs;
  final city = "".obs;

  @override
  void onInit() {
    super.onInit();
    getAddress();
  }

  Future<void> getAddress() async {
    addresses = await AddressApi.getAddress(apiKey: apiKey);
    update();
  }

  Future<void> addAddress() async {
    String streetName = streetController.text.trim();
    String houseNo = houseNoController.text.trim();
    String city = cityController.text.trim();

    if (streetName.isEmpty || houseNo.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }

    isLoading(true);

    try {
      var response = await AddressApi.address(
          apiKey: apiKey, street: streetName, houseNo: houseNo, city: city);
      isLoading(false);
      if (response.error == false) {
        Get.back();
        Get.rawSnackbar(backgroundColor: firstColor, message: 'Address added');
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
    update();
  }

  @override
  void onClose() {
    streetController.dispose();
    houseNoController.dispose();
    cityController.dispose();
    super.onClose();
  }
}
