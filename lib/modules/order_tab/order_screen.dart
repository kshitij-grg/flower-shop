import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:nomadic_florist/constants.dart';
import 'package:nomadic_florist/modules/address_tab/address_controller.dart';
import 'package:nomadic_florist/modules/address_tab/address_screen.dart';
import 'package:nomadic_florist/modules/cart_tab/cart_controller.dart';
import 'package:nomadic_florist/widgets/custom_button.dart';

import '../../app_controller.dart';
import 'order_controller.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String _payType = "";
  String orderDate = DateFormat('y-M-d').format(DateTime.now());
  String orderTime = DateFormat('hh:mm a').format(DateTime.now());
  String orderStatus = "";

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressController());
    final orderController = Get.put(OrderController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Order'),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        Get.find<AppController>().getName(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "Total: Rs. ${Get.find<CartController>().total.value}",
                        style: TextStyle(
                            color: firstColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Obx(
                            () => addressController.addressId.value == 0
                                ? ListTile(
                                    minVerticalPadding: 10,
                                    horizontalTitleGap: 0,
                                    onTap: () {
                                      Get.to(() => AddressScreen());
                                    },
                                    leading: Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.black54,
                                      size: 22,
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Address',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          'Select your Address',
                                          style: TextStyle(
                                              color: firstColor, fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    trailing: Icon(
                                      Icons.chevron_right_outlined,
                                      color: Colors.black54,
                                      size: 22,
                                    ),
                                  )
                                : ListTile(
                                    minVerticalPadding: 10,
                                    horizontalTitleGap: 0,
                                    onTap: () {
                                      Get.to(() => AddressScreen());
                                    },
                                    leading: Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.black54,
                                      size: 22,
                                    ),
                                    title: Text(
                                      "House No. ${addressController.houseNo.value} , ${addressController.streetName.value}",
                                      style: TextStyle(
                                          color: firstColor, fontSize: 14),
                                    ),
                                  ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Time",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(DateFormat('hh:mm a').format(DateTime.now())),
                            Text(DateFormat('y-M-d').format(DateTime.now())),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: RadioListTile(
                            activeColor: firstColor,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            title: Text("Cash on Delivery"),
                            secondary: Image.asset(
                              "assets/images/cod.png",
                              width: 40,
                              height: 40,
                            ),
                            value: "cod",
                            groupValue: _payType,
                            onChanged: (value) => setState(() {
                                  _payType = value.toString();
                                  orderStatus = "Pending";
                                })),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: RadioListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            activeColor: firstColor,
                            title: Text("Pay By khalti"),
                            secondary: Image.asset(
                              "assets/images/khalti.png",
                              width: 40,
                              height: 40,
                            ),
                            value: "khalti",
                            groupValue: _payType,
                            onChanged: (value) => setState(() {
                                  _payType = value.toString();
                                  orderStatus = "Paid";
                                })),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: CustomButton(
                  label: "Order Now",
                  onPress: () {
                    if (addressController.addressId.value == 0) {
                      Fluttertoast.showToast(
                          msg: "Please Select your Address",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: firstColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (_payType == "") {
                      Fluttertoast.showToast(
                          msg: "Please Select Payment Type",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: firstColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      if (_payType == "cod") {
                        orderController.checkout(
                            orderDate: orderDate,
                            orderTime: orderTime,
                            paymentType: _payType,
                            orderStatus: orderStatus,
                            addressId: addressController.addressId.value);
                      } else {
                        KhaltiScope.of(context).pay(
                          config: PaymentConfig(
                            amount: Get.find<CartController>()
                                .total
                                .value
                                .toInt(), // Amount will be in paisa so our actual amount will not be shown in khalti UI because khalti lets us only pay upto 200
                            productIdentity: 'CTE01',
                            productName: 'Click to Eat',
                          ),
                          preferences: [PaymentPreference.khalti],
                          onSuccess: (s) {
                            orderController.checkout(
                                orderDate: orderDate,
                                orderTime: orderTime,
                                paymentType: _payType,
                                orderStatus: orderStatus,
                                addressId: addressController.addressId.value);
                          },
                          onFailure: (s) {
                            print(s);
                          },
                          onCancel: () {
                            Fluttertoast.showToast(
                                msg: "Order Cancelled",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: firstColor,
                                textColor: firstColor,
                                fontSize: 16.0);
                          },
                        );
                      }
                    }
                  }),
            ),
          ],
        ));
  }
}
