import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/constants.dart';
import 'package:nomadic_florist/modules/order_tab/order_screen.dart';
import 'package:nomadic_florist/widgets/custom_button.dart';

import 'cart_controller.dart';
import 'widgets/cart_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: GetBuilder<CartController>(builder: (cartController) {
        return cartController.cartFlowers.isEmpty
            ? Center(child: Text('Your Cart is Empty'))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartController.cartFlowers.length,
                      itemBuilder: (context, index) =>
                          CartTile(cartController.cartFlowers[index]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: sixthColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total cost:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${cartController.total.value}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            label: 'Checkout',
                            onPress: () {
                              Get.to(() => OrderScreen());
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
      }),
    );
  }
}
