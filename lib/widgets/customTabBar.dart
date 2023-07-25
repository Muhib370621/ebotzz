import 'package:ebotzz/screens/onBoarding/simpleSignupView.dart';
import 'package:ebotzz/screens/vendorScreens/vendorSignupView.dart';

import '../utils/imports.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                  text: "Signup",
                ),
                Tab(
                  text: "Vendor Signup",
                ),
              ],
            ),
          ),
        ),
        body:  const TabBarView(
          children: [
            SimpleSignupView(),
            VendorSignupView(),
            // Icon(Icons.directions_car, size: 350,color: Colors.black,),
          ],
        ),
      ),
    );
    ;
  }
}
