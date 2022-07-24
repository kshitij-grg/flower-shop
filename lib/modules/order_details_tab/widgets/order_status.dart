import 'package:flutter/material.dart';

import 'order_status_tile.dart';

class OrderStatus extends StatelessWidget {
  final List<String> status = [
    "All",
    "Pending",
    "Paid",
  ];

  final int selectedIndex;
  final Function onPressed;

  OrderStatus({required this.selectedIndex, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: status.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                onPressed(index);
              },
              child: OrderStatusTile(
                orderStat: status[index],
                isSelected: selectedIndex == index,
              ),
            );
          }),
    );
  }
}
