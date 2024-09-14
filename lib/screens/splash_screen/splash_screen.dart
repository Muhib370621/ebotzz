// ignore_for_file: camel_case_types

import 'package:ebotzz/utils/imports.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  // final splashController = Get.put(SplashScreenController());

  Future<bool> dummyTimer() async {
    await Future.delayed(const Duration(milliseconds: 2000),(){

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
          if (snapshot.hasData) {
            if ((snapshot.data?[0] ?? true) == false) {
              // Get.to(
              //       () => NewOnboarding(),
              //   transition: Transition.fade,
              //   duration: Duration(seconds: 2, ),
              // );
              return  LoginScreen();
            } else {
              // Get.to(
              //       () => NewOnboarding(),
              //   transition: Transition.fade,
              //   duration: Duration(seconds: 2, ),
              // );
              return  LoginScreen();
            }
          }
          return Scaffold(
            backgroundColor: Colors.black,
            body: Container(

              child: assetImage(
                'assets/images/1.png',
                // height: 150,
                // width: 150,
                // color: Colors.black
              ),
            ),
          );
        }
        // }
        );
  }
}
