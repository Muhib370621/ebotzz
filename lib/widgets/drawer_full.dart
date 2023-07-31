// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:ebotzz/screens/AllProductScreen.dart';
import 'package:ebotzz/utils/imports.dart';

import '../screens/vendorScreens/vendorDashBoard.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      child: ListView(
        children: [
          DrawercustomHeader(
            icon: Icon(
              Icons.person,
              color: Colors.black,
              size: 50,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.local_laundry_service,
              color: Colors.black,
            ),
            title: Text(
              'Consumer Electronics',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => AllProductScreen());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.diamond,
              color: Colors.black,

            ),
            title: Text(
              'Fashion',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => AllProductScreen());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.black,

            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => AllProductScreen());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.emoji_events,
              color: Colors.black,

            ),
            title: Text(
              'Sports',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => AllProductScreen());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.factory,
              color: Colors.black,

            ),
            title: Text(
              'Industrial Equipment',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => AllProductScreen());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.sell,
              color: Colors.black,

            ),
            title: Text(
              'sell on ebotzz',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => VendorDashBoard());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.black,

            ),
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
