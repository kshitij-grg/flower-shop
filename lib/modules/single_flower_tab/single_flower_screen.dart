import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/constants.dart';
import 'package:nomadic_florist/widgets/loading.dart';
import 'package:readmore/readmore.dart';

import 'single_flower_controller.dart';

class SingleFlowerScreen extends StatelessWidget {
  const SingleFlowerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // this controller is to use the value sent from previous screen using Get.to()
    final putController = Get.put(SingleFlowerController());

// this controller is to use the value created in the controller class
    final getController = Get.find<SingleFlowerController>();
    return Scaffold(
      backgroundColor: sixthColor,
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CachedNetworkImage(
                  imageUrl: putController.flower.image,
                  height: 400,
                  placeholder: (context, url) => Loading(
                    size: 200,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Icon(
                    Icons.cancel_sharp,
                    color: secondColor,
                    size: 32,
                  ),
                ),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2 * 0.95,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      offset: Offset(1, 3),
                      blurRadius: 1,
                      spreadRadius: 3)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  putController.flower.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: firstColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Flower Composition:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: secondColor)),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  putController.flower.composition,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Price: Rs. ${putController.flower.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: firstColor,
                            fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: firstColor,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: getController.decrement,
                                child: Icon(
                                  Icons.remove,
                                  size: 22,
                                  color: firstColor,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  "${getController.count.value}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: firstColor,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: getController.increment,
                                child: const Icon(
                                  Icons.add,
                                  size: 22,
                                  color: firstColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  putController.flower.description,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {
                    getController.addToCart();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: firstColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text('Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
