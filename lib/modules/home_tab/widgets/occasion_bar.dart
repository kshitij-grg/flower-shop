import 'package:flutter/material.dart';
import 'package:nomadic_florist/data/models/flower/flower_response.dart';
import 'package:nomadic_florist/data/models/flower/occasion_response.dart';
import 'package:nomadic_florist/modules/home_tab/widgets/flower_tile.dart';

import 'occasion_tile.dart';

class OccasionBar extends StatefulWidget {
  const OccasionBar(
      {required this.occasions, required this.flowersList, Key? key})
      : super(key: key);

  // final List<flower> flowers;
  final List<Occasions> occasions;
  final List<Flowers> flowersList;

  @override
  State<OccasionBar> createState() => _OccasionBarState();
}

class _OccasionBarState extends State<OccasionBar> {
  int selectedCategoryIndex = 2;

  Widget getflowers() {
    List<Flowers> categoryItem = [];

    if (selectedCategoryIndex == 2) {
      categoryItem = widget.flowersList;
    } else {
      for (Flowers flower in widget.flowersList) {
        if (selectedCategoryIndex == flower.occasionId) {
          categoryItem.add(flower);
        }
      }
    }

    return GridView.builder(
      itemCount: categoryItem.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15, mainAxisSpacing: 15, crossAxisCount: 2),
      itemBuilder: (context, index) => FlowerTile(
        flower: categoryItem[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.occasions.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  selectedCategoryIndex = widget.occasions[index].id;
                });
              },
              child: Container(
                margin: index == widget.occasions.length - 1
                    ? const EdgeInsets.only(right: 0)
                    : const EdgeInsets.only(right: 20),
                child: OccasionTile(
                  occasion: widget.occasions[index],
                  isSelected:
                      selectedCategoryIndex == widget.occasions[index].id,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: getflowers(),
        )
      ],
    );
  }
}
