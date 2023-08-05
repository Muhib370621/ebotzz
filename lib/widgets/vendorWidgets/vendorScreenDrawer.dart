import 'package:ebotzz/screens/vendorScreens/auctionScreen.dart';
import 'package:ebotzz/screens/vendorScreens/vendorAnalytics.dart';
import 'package:ebotzz/screens/vendorScreens/vendorOrders.dart';
import 'package:ebotzz/screens/vendorScreens/vendorProducts.dart';
import 'package:ebotzz/screens/vendorScreens/vendorSetting.dart';
import 'package:ebotzz/screens/vendorScreens/vendorWithdraw.dart';
import 'package:ebotzz/utils/imports.dart';

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
            leading: const Icon(
              Icons.data_exploration_outlined,
              color: Color(0xffE41E5C),
            ),
            title: const Text(
              'DashBoard',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => VendorDashBoard());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.card_membership_rounded,
              color: Color(0xffE41E5C),
            ),
            title: const Text(
              'Products',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => const VendorProducts());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xffE41E5C),
            ),
            title: const Text(
              'Orders',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => const VendorOrders());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.shop_2_outlined,
              color: Color(0xffE41E5C),
            ),
            title: const Text(
              'Auction',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(() => const AuctionScreen());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.arrow_circle_up,
              color: Color(0xffE41E5C),
            ),
            title: const Text(
              'Withdraw',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(const VendorWithdraw());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Color(0xffE41E5C),
            ),
            title: const Text(
              'Setting',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(const VendorSetting());
            },
          ),
        ],
      ),
    );
  }
}
