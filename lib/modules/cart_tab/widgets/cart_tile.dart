import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/data/models/cart/cart_response.dart';
import 'package:nomadic_florist/widgets/loading.dart';

import '../../../constants.dart';
import '../cart_controller.dart';

class CartTile extends StatelessWidget {
  const CartTile(this.cartFlower, {Key? key}) : super(key: key);
  final Flowers cartFlower;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          // color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(5),
          // border: Border.all(color: lightGray),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(1, 1),
            )
          ]),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: cartFlower.image,
            width: 60,
            height: 60,
            placeholder: (context, url) => Loading(
              size: 50,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartFlower.name,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: firstColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (int.parse(cartFlower.cartQuantity) > 1) {
                          Get.find<CartController>().changeQuantity(
                              cartFlower.id,
                              cartFlower.cartId,
                              int.parse(cartFlower.cartQuantity) - 1);
                        }
                      },
                      child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Icon(
                            Icons.remove,
                            color: secondColor,
                          )),
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          cartFlower.cartQuantity,
                          style: TextStyle(color: secondColor),
                        )),
                    InkWell(
                      onTap: () {
                        Get.find<CartController>().changeQuantity(
                            cartFlower.id,
                            cartFlower.cartId,
                            int.parse(cartFlower.cartQuantity) + 1);
                      },
                      child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Icon(
                            Icons.add,
                            color: secondColor,
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Text(
                "Rs. ${cartFlower.price * int.parse(cartFlower.cartQuantity)}",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: firstColor),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Text(
                                'Are You sure you want to remove this Flower from Cart?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel',
                                    style: TextStyle(color: firstColor)),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.find<CartController>().removeFromCart(
                                        cartFlower.id, cartFlower.cartId);
                                    Navigator.pop(context);
                                  },
                                  child: Text('Remove')),
                            ],
                          ));
                },
                child: Icon(
                  Icons.delete_outline,
                  size: 24,
                  color: secondColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
