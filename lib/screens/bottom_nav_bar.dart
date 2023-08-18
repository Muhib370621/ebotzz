// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:ebotzz/controllers/bottom_navigation_controller.dart';
import 'package:ebotzz/core/routes/routeNames.dart';
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
        () => Container(
          decoration: BoxDecoration(
            // color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  18,
                ),
                topRight: Radius.circular(18)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: Colors.black,
              ),
              child: BottomNavigationBar(
                elevation: 10,
                type: BottomNavigationBarType.shifting,
                backgroundColor: Colors.black,
                selectedItemColor: Colors.blueAccent.withOpacity(0.9),
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
          ),
        ),
      ),
    );
  }
}
