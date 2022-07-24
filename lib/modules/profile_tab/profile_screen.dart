import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/modules/order_details_tab/order_details_screen.dart';
import 'package:nomadic_florist/modules/profile_tab/change_password.dart';
import 'package:nomadic_florist/modules/profile_tab/update_profile_screen.dart';

import '../../app_controller.dart';
import '../../constants.dart';
import 'about_us_screen.dart';
import 'change_password_controller.dart';
import 'profile_controller.dart';
import 'widgets/profile_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.put(ProfileController());
  final controller = Get.find<AppController>();
  @override
  void onResume() {
    profileController.getProfileDetails();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordController());

    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(children: [
            SizedBox(height: 5, child: ListView()),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  backgroundColor: secondColor,
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  controller.getName(),
                  style: TextStyle(color: secondColor, fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  controller.getEmail(),
                  style: TextStyle(color: secondColor, fontSize: 14),
                ),
                SizedBox(
                  height: 30,
                ),
                ProfileTile(
                  label: 'Update Personal Data',
                  icon: Icons.person_outline,
                  onPress: () {
                    Get.to(() => UpdateProfileScreen());
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ProfileTile(
                  icon: Icons.lock_outline,
                  label: 'Change Password',
                  onPress: () {
                    Get.to(() => ChangePasswordScreen());
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ProfileTile(
                  icon: Icons.delivery_dining_outlined,
                  label: 'Order Status',
                  onPress: () {
                    Get.to(() => OrderDetailsScreen());
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ProfileTile(
                  icon: Icons.info_outline,
                  label: 'About Us',
                  onPress: () {
                    Get.to(() => AboutUsScreen());
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ProfileTile(
                  icon: Icons.logout_outlined,
                  label: 'Logout',
                  onPress: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: Text('You are about to Logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel',
                                      style: TextStyle(color: Colors.red)),
                                ),
                                TextButton(
                                    onPressed: () {
                                      controller.logout();
                                    },
                                    child: Text('Logout')),
                              ],
                            ));
                  },
                ),
              ],
            ),
          ]),
        ));
  }
}
