import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/data/models/order/order_response.dart';

import '../../../constants.dart';
import '../single_order_screen.dart';

class OrderHistoryTile extends StatelessWidget {
  OrderHistoryTile(
      {required this.orderHistory, required this.counter, Key? key})
      : super(key: key);

  OrderHistory orderHistory;
  int counter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => SingleOrderScreen(), arguments: orderHistory);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: sixthColor,
                  offset: Offset(1, 1),
                  blurRadius: 3,
                  spreadRadius: 2)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Checkout No: ",
                  style: TextStyle(color: firstColor),
                ),
                Text(
                  "${counter + 1}",
                  style: TextStyle(
                    color: firstColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Date: ${orderHistory.orderDate}",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
            Text(
              "Order Time: ${orderHistory.orderTime}",
              style: TextStyle(color: Colors.black54),
            ),
            orderHistory.paymentType == "cod"
                ? Text(
                    "Payment Type: Cash On Delivery",
                    style: TextStyle(color: Colors.black54),
                  )
                : Text(
                    "Payment Type: khalti",
                    style: TextStyle(color: Colors.black54),
                  ),
          ],
        ),
      ),
    );
  }
}
