// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:ebotzz/utils/imports.dart';

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
              color: Color(0xffE41E5C),
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
              color: Color(0xffE41E5C),
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
              color: Color(0xffE41E5C),
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
              color: Color(0xffE41E5C),
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
              color: Color(0xffE41E5C),
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
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'sell on ebotzz',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => AllProductScreen());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Color(0xffE41E5C),
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
