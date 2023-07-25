import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';
import 'package:flutter/material.dart';

import '../../widgets/customImage.dart';
import '../../widgets/textswidget.dart';
import '../utils/imports.dart';

class VendorSignupView extends StatelessWidget {
  const VendorSignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    TextEditingController controller4 = TextEditingController();
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              CustomInputField(controller: controller1,label: "shop name",),
              // SizedBox(height: 5,),
              CustomInputField(controller: controller2,label: "business email",),
              // SizedBox(height: 5,),
              CustomInputField(controller: controller3,label: "location",),
              // SizedBox(height: 5,),

              CustomInputField(controller: controller4,label:"password"),
              SizedBox(height: 10,),

              CustomActionButton(buttonText: "Signup",isIcon: false,onTap: (){

                Get.defaultDialog(
                    title: "Successfully registered",
                    titleStyle: TextStyle(color: Colors.green,fontSize: 16),
                    content:Container(
                      width: 300,height: 300,child: Lottie.asset("assets/json/successIcon.json"),
                    )
                );
              },),
              SizedBox(height: 10,)



            ],
          ),
        ),
      ),
    );
  }
}
