import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/constants.dart';
import 'package:nomadic_florist/data/models/flower/flower_response.dart';
import 'package:nomadic_florist/modules/single_flower_tab/single_flower_screen.dart';
import 'package:nomadic_florist/widgets/progress_bar.dart';
import '../../../widgets/loading.dart';

class FlowerTile extends StatelessWidget {
  const FlowerTile({
    required this.flower,
    Key? key,
  }) : super(key: key);

  final Flowers flower;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => SingleFlowerScreen(), arguments: flower);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 200,
        width: 180,
        decoration: BoxDecoration(
          color: fifthColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  imageUrl: flower.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Loading(
                    size: 50,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              flower.name,
              style: TextStyle(color: firstColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Rs. ${flower.price}',
              style: TextStyle(color: secondColor),
            ),
          ],
        ),
      ),
    );
  }
}
