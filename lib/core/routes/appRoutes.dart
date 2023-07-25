
import 'package:ebotzz/core/routes/routeNames.dart';
import 'package:ebotzz/screens/authentication/screens/signup_screen.dart';
// import 'package:ebotzz/screens/signupTabView.dart';
// import 'package:ebotzz/screens/onBoarding/signup.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../screens/bottom_nav_bar.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteNames.bottomNav,
      page: () =>  BottomNavBar(),
    ),
    GetPage(
      name: RouteNames.signup,
      page: () =>  SignUPScreen(),
    ),
  ];
}