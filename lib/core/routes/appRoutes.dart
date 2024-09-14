
import 'package:ebotzz/core/routes/routeNames.dart';
import 'package:ebotzz/screens/home_screen/HomeScreen2.dart';
import 'package:ebotzz/screens/splash_screen/splash_screen.dart';
import 'package:ebotzz/screens/vendorScreens/auctionScreen.dart';
import 'package:ebotzz/screens/vendorScreens/vendorDashBoard.dart';
import 'package:ebotzz/screens/vendorScreens/vendorOrders.dart';
import 'package:ebotzz/screens/vendorScreens/vendorProducts.dart';
import 'package:ebotzz/screens/vendorScreens/vendorSetting.dart';
import 'package:ebotzz/screens/vendorScreens/vendorWithdraw.dart';

import '../../screens/vendorScreens/addAuctionScreen.dart';
import '../../utils/imports.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteNames.bottomNav,
      page: () =>  BottomNavBar(),
      transition: Transition.fade,
      // duration: Duration(seconds: 2),
    ),
    GetPage(
      name: RouteNames.signup,
      page: () =>  SignUPScreen(),
    )
    ,GetPage(
      name: RouteNames.loginScreen,
      page: () =>  LoginScreen(),
    ),
    GetPage(
      name: RouteNames.splashScreen,
      page: () =>  SplashScreen(),
      transition: Transition.upToDown
    ),

    // bottom navigation screens
    GetPage(
      name: RouteNames.cartScreen,
      page: () =>  CartScreen(index: 0,),
    ),
    GetPage(
      name: RouteNames.homeScreen,
      page: () =>  HomeScreen2(),
    ),
    GetPage(
      name: RouteNames.wishlistScreen,
      page: () =>  WishlistScreen(),
    ),
    GetPage(
      name: RouteNames.tradingOfferScreen,
      page: () =>  TradingOfferScreen(),
    ),


    //vendors screen from now on

    GetPage(
      name: RouteNames.vendorDashBoard,
      page: () =>  VendorDashBoard(),
    ),
    GetPage(
      name: RouteNames.addAuctionScreen,
      page: () =>  AddAuctionScreen(),
    ),
    GetPage(
      name: RouteNames.vendorOrderScreen,
      page: () =>  VendorOrders(),
    ),
    GetPage(
      name: RouteNames.vendorProductScreen,
      page: () =>  VendorProducts(),
    ),
    GetPage(
      name: RouteNames.auctionScreen,
      page: () =>  AuctionScreen(),
    ),
    GetPage(
      name: RouteNames.vendorSettingScreen,
      page: () =>  VendorSetting(),
    ),
    GetPage(
      name: RouteNames.vendorWithdrawScreen,
      page: () =>  VendorWithdraw(),
    ),
  ];
}