import 'package:ebotzz/screens/vendorScreens/vendorAnalytics.dart';
import 'package:ebotzz/screens/vendorScreens/vendorOrders.dart';
import 'package:ebotzz/screens/vendorScreens/vendorProducts.dart';

import 'package:ebotzz/screens/vendorScreens/vendorSetting.dart';
import 'package:ebotzz/screens/vendorScreens/vendorStaff.dart';

import 'package:ebotzz/screens/vendorScreens/vendorWithdraw.dart';
import 'package:ebotzz/screens/vendorScreens/vendorTradeScreen.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../screens/vendorScreens/vendorDashBoard.dart';



class VendorScreenDrawer extends StatelessWidget {
  const VendorScreenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Icons.data_exploration_outlined,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'DashBoard',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => VendorDashBoard());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.card_membership_rounded,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Products',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => VendorProducts());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Orders',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => VendorOrders());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.arrow_circle_up,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Withdraw',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(VendorWithdraw());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Setting',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(VendorSetting());
            },
          ),
        ],
      ),
    );
  }
}
