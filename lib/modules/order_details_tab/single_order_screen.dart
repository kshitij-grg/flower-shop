import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'single_order_controller.dart';
import 'widgets/ordered_flowers.dart';

class SingleOrderScreen extends StatelessWidget {
  const SingleOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SingleOrderController());
    final controller = Get.find<SingleOrderController>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Ordered Items'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: controller.orderHistory!.orderDetails.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => OrderedFlowers(
                            flower: controller
                                .orderHistory!.orderDetails[index].flower,
                            orderDetails:
                                controller.orderHistory!.orderDetails[index],
                          )),
                ),
              ],
            ),
          ),
        ));
  }
}
