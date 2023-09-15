import 'package:ebotzz/utils/imports.dart';

class NewOnboarding extends StatefulWidget {
  const NewOnboarding({super.key});

  @override
  State<NewOnboarding> createState() => _NewOnboardingState();
}

class _NewOnboardingState extends State<NewOnboarding> {
  @override
  void initState() {
    // TODO: implement initState
    Get.to(()=> LoginScreen(),  transition: Transition.fade,
      duration: Duration(seconds: 2),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      GestureDetector(
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
