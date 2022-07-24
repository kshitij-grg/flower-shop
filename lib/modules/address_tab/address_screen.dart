import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_button.dart';
import 'add_address_screen.dart';
import 'address_controller.dart';
import 'widgets/address_tile.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addressController = Get.find<AddressController>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Address'),
        ),
        body: RefreshIndicator(
          onRefresh: () => addressController.getAddress(),
          child: Stack(children: [
            ListView(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButton(
                      label: "Add Address",
                      onPress: () {
                        Get.to(() => AddAddressScreen());
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GetBuilder<AddressController>(
                      builder: (controller) => controller.addresses!.isEmpty
                          ? Center(
                              child: Text("No Addresses Yet"),
                            )
                          : ListView.builder(
                              itemCount: addressController.addresses!.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => AddressTile(
                                    addresses:
                                        addressController.addresses![index],
                                  )),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
