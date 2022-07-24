import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/data/models/order/order_response.dart';
import 'package:nomadic_florist/widgets/loading.dart';
import 'order_details_controller.dart';
import 'widgets/order_history_tile.dart';
import 'widgets/order_status.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetailsScreen> {
  final putController = Get.put(OrderDetailsController());

  final controller = Get.find<OrderDetailsController>();

  int selectedIndex = 0;
  final PageController _pageController = PageController();

  Widget getOrders(String selectedStatus) {
    List<OrderHistory> selectedOrders = [];

    if (selectedStatus == "All") {
      selectedOrders = controller.orderHistoryList;
    } else {
      for (OrderHistory order in controller.orderHistoryList) {
        if (selectedStatus == order.orderStatus) {
          selectedOrders.add(order);
        }
      }
    }

    return ListView.builder(
        itemCount: selectedOrders.length,
        itemBuilder: (context, index) {
          return OrderHistoryTile(
            orderHistory: selectedOrders[index],
            counter: index,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? Loading(
                size: 200,
              )
            : controller.orderHistoryList.isEmpty
                ? Center(
                    child: Text('You have not ordered anything yet'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        OrderStatus(
                            selectedIndex: selectedIndex,
                            onPressed: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                              _pageController.jumpToPage(index);
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: PageView(
                          onPageChanged: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          controller: _pageController,
                          children: [
                            getOrders("All"),
                            getOrders("Pending"),
                            getOrders("Paid"),
                          ],
                        ))
                      ],
                    ),
                  ),
      ),
    );
  }
}
