import 'package:flutter/material.dart';
import 'package:nomadic_florist/constants.dart';
import 'package:nomadic_florist/data/models/order/order_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../widgets/loading.dart';

class OrderedFlowers extends StatelessWidget {
  const OrderedFlowers({
    required this.flower,
    required this.orderDetails,
    Key? key,
  }) : super(key: key);

  final Flower flower;
  final OrderDetails orderDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: flower.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Loading(
                    size: 50,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ],
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
            "Quantity: ${orderDetails.totalQuantity}",
            style: TextStyle(
              color: secondColor,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Total Cost: Rs. ${orderDetails.totalAmount}",
            style: TextStyle(
              color: secondColor,
            ),
          )
        ],
      ),
    );
  }
}
