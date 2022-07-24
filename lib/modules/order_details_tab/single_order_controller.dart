import 'package:get/get.dart';
import 'package:nomadic_florist/data/models/order/order_response.dart';

class SingleOrderController extends GetxController {
  OrderHistory? orderHistory;

  @override
  void onInit() {
    super.onInit();
    orderHistory = Get.arguments;
  }
}
