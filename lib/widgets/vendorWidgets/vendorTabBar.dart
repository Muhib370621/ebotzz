import 'package:ebotzz/screens/onBoarding/simpleSignupView.dart';
import 'package:ebotzz/screens/vendorScreens/vendorBuyScreen.dart';
import 'package:ebotzz/screens/vendorScreens/vendorProductScreens/addproduct.dart';
import 'package:ebotzz/screens/vendorScreens/vendorProductScreens/export.dart';
import 'package:ebotzz/screens/vendorScreens/vendorProductScreens/import.dart';
import 'package:ebotzz/screens/vendorScreens/vendorWithdraw.dart';
import 'package:ebotzz/screens/vendorScreens/vendorSignupView.dart';
import 'package:ebotzz/screens/vendorScreens/vendorTradeScreen.dart';

import '../../screens/vendorScreens/vendorDashBoard.dart';
import '../../utils/imports.dart';


class VendorTabBar extends StatelessWidget {
  const VendorTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            leading: Container(),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  20,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            flexibleSpace: TabBar(
              physics: const BouncingScrollPhysics(),
              indicatorColor: Colors.pink,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.pink,
              unselectedLabelColor: Colors.black,
              indicatorWeight: 0.5.h,
              tabs: const [
                Tab(
                  text: "Add New",
                ),
                Tab(
                  text: "Import",
                ),
                Tab(
                  text: "Export",
                ),
              ],
            ),
          ),
        ),
        body:   const TabBarView(
          children: [
            AddProduct(),
            ImportScreen(),
            ExportScreen(),
            // VendorWithdraw()
            // Icon(Icons.directions_car, size: 350,color: Colors.black,),
          ],
        ),
      ),
    );
    ;
  }
}

