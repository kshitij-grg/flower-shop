import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomadic_florist/constants.dart';
import 'package:nomadic_florist/modules/cart_tab/cart_controller.dart';
import 'package:nomadic_florist/modules/cart_tab/cart_screen.dart';
import 'package:nomadic_florist/modules/home_tab/home_screen.dart';
import 'package:nomadic_florist/modules/profile_tab/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // to determine in which screen we are in
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());

    // making a list of screens so we can swap it while using bottom navbar
    final List<Widget> screens = [
      HomeScreen(),
      const CartScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
        body: SizedBox.expand(
          child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _selectedIndex = index);
              },
              children: screens),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
          }),
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.apps),
              title: const Text('Home'),
              activeColor: firstColor,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.shopping_basket_outlined),
              title: const Text('Cart'),
              activeColor: firstColor,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.person_outline),
              title: const Text('Profile'),
              activeColor: firstColor,
            ),
          ],
        ));
  }
}
