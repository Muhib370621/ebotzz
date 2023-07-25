// ignore_for_file: camel_case_types

import 'package:ebotzz/utils/imports.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    SplashScreenController.find.startAnimation();

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Obx(
              () => AnimatedOpacity(
                opacity: splashController.animate.value ? 1 : 0,
                duration: const Duration(milliseconds: 5000),
                child: assetImage("assets/images/logo animation_x264 (1).gif"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
