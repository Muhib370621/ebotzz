// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:ebotzz/controllers/bottom_navigation_controller.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:flutter/services.dart';

import 'home_screen/HomeScreen2.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  final BottomNavigationController _bottomNavigationController =
      Get.put(BottomNavigationController());

  final screens = [
    HomeScreen2(),
    // HomeScreen(),
    CartScreen(),
    WishlistScreen(),
    TradingOfferScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Obx(
        () => IndexedStack(
          index: _bottomNavigationController.currentIndex.value,
          children: screens,
        ),
      ),
      drawer: Drawer(child: DrawerScreen()),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 5,
          type: BottomNavigationBarType.shifting,
          backgroundColor: whiteColor,
          selectedItemColor: Colors.black,
          showSelectedLabels: true,

          unselectedItemColor: Colors.grey,
          selectedFontSize: 14,

          unselectedFontSize: 12,
          currentIndex: _bottomNavigationController.currentIndex.value,
          onTap: (index) {
            HapticFeedback.mediumImpact();
            _bottomNavigationController.changeIndex(index);
          },

          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.currency_exchange),
              label: 'Trade offers',
            ),
          ],
        ),
      ),
    );
  }
}
