import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/modules/home_tab/widgets/occasion_bar.dart';
import 'package:nomadic_florist/widgets/loading.dart';

import '../../constants.dart';
import 'flower_controller.dart';
import 'occasion_controller.dart';
import 'widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final occasionController = Get.put(OccasionController());
  final flowerController = Get.put(FlowerController());

  Future<void> getAll() async {
    occasionController.getOccasions();
    flowerController.getFlowers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.location_on_outlined,
              size: 18,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Pokhara, Nepal",
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => getAll(),
        child: Obx(
          () => occasionController.isLoading.isTrue &&
                  flowerController.isLoading.isTrue
              ? Loading(
                  size: 200,
                )
              : occasionController.isError.isTrue &&
                      flowerController.isError.isTrue
                  ? Loading(
                      size: 200,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'What is your pick today?',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: secondColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SearchBar(),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                              child: OccasionBar(
                            occasions: occasionController.occasions,
                            flowersList: flowerController.flowers,
                          )),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
