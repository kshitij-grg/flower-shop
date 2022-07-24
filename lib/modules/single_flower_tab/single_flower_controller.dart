import 'package:get/get.dart';
import 'package:nomadic_florist/data/models/flower/flower_response.dart';
import '../../modules/cart_tab/cart_controller.dart';

class SingleFlowerController extends GetxController {
  final count = 1.obs;
  late final Flowers flower;

  @override
  void onInit() {
    super.onInit();
    flower = Get.arguments;
  }

// to decreaset the quantity value in each food screen
  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

// to decreaset the quantity value in each food screen
  void increment() {
    count.value++;
  }

  Future<void> addToCart() async {
    Get.find<CartController>().addToCart(flower.id, quantity: count.value);
  }
}
