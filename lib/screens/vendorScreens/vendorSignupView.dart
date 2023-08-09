import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';

import '../../controllers/signUpController.dart';
import '../../utils/imports.dart';

class VendorSignupView extends StatelessWidget {
  const VendorSignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    TextEditingController controller4 = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: 400.h,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              CustomInputField(controller: controller1,label: "Username",),
              // SizedBox(height: 5,),
              CustomInputField(controller: controller2,label: "business email",),
              // SizedBox(height: 5,),
              CustomInputField(controller: controller3,label: "password",),
              // SizedBox(height: 5,),

              CustomInputField(controller: controller4,label:"First Name"),
              CustomInputField(controller: controller4,label:"Last Name"),
              CustomInputField(controller: controller4,label:"Shop Name"),
              CustomInputField(controller: controller4,label:"Shop URL"),
              CustomInputField(controller: controller4,label:"Phone Number"),
              SizedBox(height: 10,),

              CustomActionButton(buttonText: "Signup",isIcon: false,onTap: (){
                // signUpController.signUp(name, email, password)
              }, isLoading: false,),
              SizedBox(height: 10,)



            ],
          ),
        ),
      ),
    );
  }
}
