import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/data/api/cart_api.dart';
import 'package:nomadic_florist/data/models/cart/cart_response.dart';
import '../../app_controller.dart';
import '../../constants.dart';

class CartController extends GetxController {
  List<Flowers> cartFlowers = [];
  final total = 0.0.obs;
  final isLoading = false.obs;
  String apiKey = Get.find<AppController>().getToken();

  @override
  void onInit() {
    super.onInit();
    getCartFood();
  }

  Future<void> getCartFood() async {
    List<Flowers> tempCart = await CartApi.get(apiKey);
    cartFlowers.addAll(tempCart);
    calculateTotalCost();
    update();
  }

  void calculateTotalCost() {
    double newTotal = 0;
    for (var cartFlower in cartFlowers) {
      newTotal +=
          (double.parse(cartFlower.cartQuantity) * cartFlower.price.toDouble());
    }
    total(newTotal);
  }

  Future<void> updateCartFood() async {
    cartFlowers = await CartApi.get(apiKey);
    calculateTotalCost();
  }

  Future<void> addToCart(int flowerId, {int quantity = 1}) async {
    isLoading(true);

    try {
      if (cartFlowers.firstWhereOrNull((element) => element.id == flowerId) ==
          null) {
        isLoading(false);

        var response = await CartApi.set(
            apiKey: apiKey, id: flowerId, cartQuantity: quantity.toString());

        if (response.error == false) {
          Fluttertoast.showToast(
              msg: "Added to Cart",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: firstColor,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          Get.rawSnackbar(
              backgroundColor: firstColor,
              message: "An Error Occured while Adding Flower to Cart");
        }
      } else {
        Fluttertoast.showToast(
            msg: "Already on Cart",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: firstColor,
            textColor: Colors.white,
            fontSize: 16.0);
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
    calculateTotalCost();
    updateCartFood();
    update();
  }

  Future<void> removeFromCart(int foodId, int cartId) async {
    try {
      isLoading(false);

      var response = await CartApi.remove(apiKey: apiKey, cartId: cartId);

      if (response.error == false) {
        Get.rawSnackbar(
            backgroundColor: firstColor, message: "Deleted from Cart");
      } else {
        Get.rawSnackbar(
            backgroundColor: firstColor,
            message: "An Error Occured while Deleting Cart Item");
      }
    } catch (e) {
      isLoading(false);
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = e.toString();
      }
      Get.rawSnackbar(message: "Sorry! Cannot delete this Item");
    }
    cartFlowers.removeWhere((element) => element.id == foodId);
    calculateTotalCost();
    updateCartFood();
    update();
  }

  Future<void> changeQuantity(int foodId, int cartId, int quantity) async {
    try {
      await CartApi.updateCart(
          apiKey: apiKey, cartId: cartId, quantity: quantity.toString());
    } catch (e) {
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = e.toString();
      }
      Get.rawSnackbar(message: "Sorry! Cannot update Food Item");
      print(errorMessage);
    }
    int index = cartFlowers.indexWhere((element) => element.id == foodId);
    cartFlowers[index].cartQuantity = quantity.toString();
    calculateTotalCost();
    update();
  }

  void clearCart() {
    cartFlowers = [];
    updateCartFood();
    update();
  }
}
