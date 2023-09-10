// ignore_for_file: camel_case_types

import 'package:ebotzz/core/utils/appColors.dart';
import 'package:ebotzz/screens/splash_screen/newOnborading.dart';
import 'package:ebotzz/utils/imports.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  // final splashController = Get.put(SplashScreenController());

  Future<bool> dummyTimer() async {
    await Future.delayed(const Duration(milliseconds: 1500),(){
      Get.to(
            () => NewOnboarding(),
        transition: Transition.fade,
        duration: Duration(seconds: 2),
      );
    });
    // Get.toNamed('/loginScreen');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // SplashScreenController.find.startAnimation();

    return FutureBuilder(
        future: Future.wait([
          dummyTimer(),
        ]),
        builder: (BuildContext context, AsyncSnapshot<List<bool>> snapshot) {
          // if (snapshot.hasData) {
          //   if ((snapshot.data?[0] ?? true) == false) {
          //     return  NewOnboarding();
          //   } else {
          //     return  NewOnboarding();
          //   }
          // }
          return Scaffold(
            // backgroundColor: ,
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black, AppColors.mainColor],
              )),
              child: Center(
                child: assetImage(
                  'assets/images/splashIcon.png',
                  height: 150,
                  width: 150,
                  // color: Colors.black
                ),
              ),
            ),
          );
        }
        // }
        );
  }
}
