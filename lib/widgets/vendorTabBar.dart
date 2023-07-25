import 'package:ebotzz/screens/onBoarding/simpleSignupView.dart';
import 'package:ebotzz/screens/vendorBuyScreen.dart';
import 'package:ebotzz/screens/vendorDashBoard.dart';
import 'package:ebotzz/screens/vendorSignupView.dart';
import 'package:ebotzz/screens/vendorTradeScreen.dart';
import 'package:ebotzz/screens/vendorWithdrawScreen.dart';

import '../utils/imports.dart';

class VendorTabBar extends StatelessWidget {
  const VendorTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(35),
          child: AppBar(
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
                  text: "Dashboard",
                ),
                Tab(
                  text: "Trade",
                ),
                Tab(
                  text: "Buy",
                ),
                Tab(
                  text: "Withdraw",
                ),
              ],
            ),
          ),
        ),
        body:  const TabBarView(
          children: [
            VendorDashBoard(),
            VendorTradeScreen(),
            VendorBuyScreen(),
            VendorWithDrawScreen()
            // Icon(Icons.directions_car, size: 350,color: Colors.black,),
          ],
        ),
      ),
    );
    ;
  }
}

