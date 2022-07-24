import 'package:get/get.dart';
import 'package:nomadic_florist/constants.dart';
import 'package:nomadic_florist/data/api/order_api.dart';
import 'package:nomadic_florist/modules/cart_tab/cart_controller.dart';

import '../../app_controller.dart';
import 'order_success_screen.dart';

class OrderController extends GetxController {
  String apiKey = Get.find<AppController>().getToken();
  final isLoading = false.obs;

  Future<void> checkout(
      {required String orderDate,
      required String orderTime,
      required String paymentType,
      required String orderStatus,
      required int addressId}) async {
    isLoading(true);
    try {
      var response = await OrderApi.checkout(
          apiKey: apiKey,
          orderDate: orderDate,
          orderTime: orderTime,
          paymentType: paymentType,
          orderStatus: orderStatus,
          addressId: addressId);
      isLoading(false);

      if (response.error == false) {
        Get.off(() => OrderSuccessScreen());
        Get.find<CartController>().clearCart();
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
}
