import 'package:ebotzz/utils/imports.dart';

import '../screens/signupTabView.dart';



class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));
    Get.offAll(() => SignUPScreen());
  }
}
