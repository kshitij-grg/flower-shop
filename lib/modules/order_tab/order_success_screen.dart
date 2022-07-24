import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nomadic_florist/modules/order_details_tab/order_details_screen.dart';
import 'package:nomadic_florist/widgets/custom_button.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
                child: SizedBox(
              child: Center(
                child: Lottie.asset('assets/lottie/success.json',
                    repeat: false,
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: double.infinity),
              ),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: CustomButton(
                  label: "Check your Order",
                  onPress: () {
                    Get.off(() => OrderDetailsScreen());
                  }),
            )
          ],
        ),
      ),
    );
  }
}
