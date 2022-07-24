import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nomadic_florist/constants.dart';
import 'package:nomadic_florist/data/models/flower/occasion_response.dart';
import 'package:nomadic_florist/widgets/loading.dart';

class OccasionTile extends StatelessWidget {
  const OccasionTile(
      {required this.occasion, required this.isSelected, Key? key})
      : super(key: key);

  final Occasions occasion;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: isSelected ? fifthColor : sixthColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: occasion.icon,
            width: 18,
            height: 18,
            placeholder: (context, url) => Loading(
              size: 50,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            occasion.name,
            style: TextStyle(color: isSelected ? Colors.white : Colors.grey),
          )
        ],
      ),
    );
  }
}
