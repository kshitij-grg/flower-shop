import 'package:get/get.dart';
import 'package:nomadic_florist/data/api/order_api.dart';
import 'package:nomadic_florist/data/models/order/order_response.dart';

class OrderDetailsController extends GetxController {
  final isLoading = false.obs;
  List<OrderHistory> orderHistoryList = [];

  @override
  void onInit() {
    super.onInit();
    getOrderDetails();
  }

  Future<void> getOrderDetails() async {
    isLoading(true);
    try {
      orderHistoryList = await OrderApi.getOrderHistory();
      isLoading(false);
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
