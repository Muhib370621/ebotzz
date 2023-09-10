import 'package:ebotzz/utils/imports.dart';

class NewOnboarding extends StatelessWidget {
  const NewOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      InkWell(
        onTap: (){
          Get.to(()=> LoginScreen(),  transition: Transition.fade,
            duration: Duration(seconds: 2),);
        },
        child: Container(
          height: Get.height,
            width: Get.width,
            child: Image.asset("assets/images/onboarding1.png",fit: BoxFit.fill,)),
      ),
    );
  }
}
