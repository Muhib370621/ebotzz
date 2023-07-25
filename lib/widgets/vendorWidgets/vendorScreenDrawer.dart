import 'package:ebotzz/screens/vendorScreens/vendorAnalytics.dart';
import 'package:ebotzz/screens/vendorScreens/vendorAnnouncement.dart';
import 'package:ebotzz/screens/vendorScreens/vendorBadge.dart';
import 'package:ebotzz/screens/vendorScreens/vendorCupons.dart';
import 'package:ebotzz/screens/vendorScreens/vendorDeliveryTime.dart';
import 'package:ebotzz/screens/vendorScreens/vendorFollowers.dart';
import 'package:ebotzz/screens/vendorScreens/vendorOrders.dart';
import 'package:ebotzz/screens/vendorScreens/vendorProducts.dart';
import 'package:ebotzz/screens/vendorScreens/vendorReports.dart';
import 'package:ebotzz/screens/vendorScreens/vendorRequestQuotes.dart';
import 'package:ebotzz/screens/vendorScreens/vendorReturnRequest.dart';
import 'package:ebotzz/screens/vendorScreens/vendorReviews.dart';
import 'package:ebotzz/screens/vendorScreens/vendorSetting.dart';
import 'package:ebotzz/screens/vendorScreens/vendorStaff.dart';
import 'package:ebotzz/screens/vendorScreens/vendorSupport.dart';
import 'package:ebotzz/screens/vendorScreens/vendorTools.dart';
import 'package:ebotzz/screens/vendorScreens/vendorWithdraw.dart';
import 'package:ebotzz/screens/vendorTradeScreen.dart';
import 'package:ebotzz/screens/vendorWithdrawScreen.dart';
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
              Icons.read_more_outlined,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Request Quotes',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => VendorRequestQoutes());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.card_giftcard,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Cupons',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => VendorCupons());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.auto_graph_outlined,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Reports',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => VendorReports());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.timelapse,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Delivery Time',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(VendorDeliveryTime());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.rate_review_rounded,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Reviews',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(VendorReviews());
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
              Icons.bookmark_add_outlined,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Bagde',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(VendorBadge());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.loop,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Return Request',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(VendorReturnRequest());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.group_rounded,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Staff',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(VendorStaff());

            },
          ),
          ListTile(
            leading: Icon(
              Icons.grade_outlined,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Followers',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(VendorFollowers());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.analytics_outlined,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Analytics',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(VendorAnalytics());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.add_alert_rounded,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Announcement',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(VendorAnnouncement());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.pan_tool,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Tools',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(VendorTools());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.handyman,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Auction',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(VendorTradeScreen());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.support,
              color: Color(0xffE41E5C),
            ),
            title: Text(
              'Support',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(VendorSupport());
            }
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
