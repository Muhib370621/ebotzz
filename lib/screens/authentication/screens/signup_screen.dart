// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors, body_might_complete_normally_nullable, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter_svg/svg.dart';

import '../../../utils/imports.dart';
import '../../../widgets/customTabBar.dart';

class SignUPScreen extends StatelessWidget {
  SignUPScreen({Key? key}) : super(key: key);
  TextEditingController emailControllerr = TextEditingController();
  TextEditingController passwordControllerr = TextEditingController();
  TextEditingController nameController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isVisible = true;
  bool isView = true;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              width: 500,
              height: 400,
              color: Colors.pink,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 50,),
                      Align(
                        alignment:Alignment.center,
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(LoginScreen());
                        },
                        child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.login_rounded,color: Colors.white,),
                                SizedBox(width: 5,),
                                Text("Login",style: TextStyle(fontSize: 18,color: Colors.white),),
                              ],
                            )),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "We make shopping and trading easy",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SvgPicture.asset("assets/images/loginBackground.svg"),
                ],
              ),

            ),
          ),
          Expanded(child: CustomTabBar())
        ],
      ),
    );
  }
}

// Form(
// key: formKey,
// child: Column(
// children: [
// Padding(
// padding: EdgeInsets.symmetric(
// horizontal: 20, vertical: 10),
// child: TextFormField(
// controller: nameController,
// validator: (value) {
// if (value!.isEmpty) {
// return "Name is Required";
// }
// },
// autovalidateMode:
// AutovalidateMode.onUserInteraction,
// decoration: InputDecoration(
// contentPadding: EdgeInsets.all(16),
// labelText: "Name",
// labelStyle: TextStyle(color: Colors.black45),
// enabledBorder: textFieldStyle,
// focusedBorder: textFieldStyle,
// focusedErrorBorder: textFieldStyle,
// errorBorder: errorTextFieldStyle,
// ),
// )),
// Padding(
// padding: EdgeInsets.symmetric(
// horizontal: 20, vertical: 10),
// child: TextFormField(
// controller: emailControllerr,
// validator: (value) {
// if (value!.isEmpty) {
// return "Email is Required";
// }
// },
// autovalidateMode:
// AutovalidateMode.onUserInteraction,
// decoration: InputDecoration(
// contentPadding: EdgeInsets.all(16),
// labelText: "Email",
// labelStyle: TextStyle(color: Colors.black45),
// enabledBorder: textFieldStyle,
// focusedBorder: textFieldStyle,
// focusedErrorBorder: textFieldStyle,
// errorBorder: errorTextFieldStyle,
// ))),
// Padding(
// padding: EdgeInsets.symmetric(
// horizontal: 20, vertical: 10),
// child: TextFormField(
// controller: passwordControllerr,
// validator: (value) {
// if (value!.isEmpty) {
// return "Password is Required";
// } else if (value.length <= 5) {
// return "Password should be greater than 5 latter";
// }
// },
// autovalidateMode:
// AutovalidateMode.onUserInteraction,
// obscureText: isVisible,
// decoration: InputDecoration(
// labelText: "Password",
// contentPadding: EdgeInsets.all(16),
// labelStyle: TextStyle(color: Colors.black45),
// suffixIcon: isVisible == false
// ? GestureDetector(
// onTap: () {
// // setState(() {
// //   isVisible = true;
// // });
// },
// child: Icon(Icons.visibility_off))
//     : GestureDetector(
// onTap: () {
// // setState(() {
// //   isVisible = false;
// // });
// },
// child: Icon(Icons.visibility)),
// enabledBorder: textFieldStyle,
// focusedBorder: textFieldStyle,
// focusedErrorBorder: textFieldStyle,
// errorBorder: errorTextFieldStyle,
// ),
// )),
// SizedBox(
// height: 20,
// ),
// Container(
// width: 200,
// child: ElevatedButton(
// style: ElevatedButton.styleFrom(
// primary: redColor,
// shape: RoundedRectangleBorder(
// borderRadius:
// BorderRadius.all(Radius.circular(20)))),
// onPressed: () {
// // if (formKey.currentState!.validate()) {
// //   Signup(nameController.text, emailControllerr.text, phoneController.text,
// //       passwordControllerr.text,
// //       confirmPassword.text, roleController.text );
// // Navigator.push(
// //     context,
// //     MaterialPageRoute(
// //         builder: (context) => Login()));
// //  };
//
// Get.defaultDialog(
// title: "Successfully registered",
// titleStyle: TextStyle(color: Colors.green,fontSize: 16),
// content:Container(
// width: 300,height: 300,child: Lottie.asset("assets/json/successIcon.json"),
// )
// );
// },
// child: Text("Sign Up"),
// )),
// ],
// )),
// Container(
// height: 40,
// width: 230,
// //  color: Colors.blue,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "Already have an account?",
// ),
// TextButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => LoginScreen()));
// },
// child: Text(
// "LogIn",
// style: TextStyle(color: redColor),
// ))
// ],
// )),
