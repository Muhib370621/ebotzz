// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_unnecessary_containers, body_might_complete_normally_nullable, deprecated_member_use

import 'package:ebotzz/core/routes/routeNames.dart';
import 'package:ebotzz/core/utils/appColors.dart';
import 'package:ebotzz/screens/authentication/screens/newSignUpScreen.dart';
import 'package:ebotzz/services/customerServices.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/imports.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Set the duration of the fade animation
    );

    // Create a Tween that will control the opacity of the widget
    _animation = Tween<double>(
      begin: 0.0, // Start with 0% opacity (fully transparent)
      end: 1.0, // End with 100% opacity (fully visible)
    ).animate(_controller!);

    // Start the animation when the screen is initialized
    _controller!.forward();
  }

  @override
  void dispose() {
    // Don't forget to dispose the animation controller to prevent memory leaks
    _controller!.dispose();
    super.dispose();
  }

  TextEditingController emailController = TextEditingController();
  bool s3 = false;

  TextEditingController passwordController = TextEditingController();

  bool loading = false;

  var formKey = GlobalKey<FormState>();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: Get.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, AppColors.mainColor],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   "assets/images/blackLogo.svg",
                  //   height: 95.h,
                  // ),
                  Text(
                    "swapster",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              // assetImage(
              //   'assets/images/logo1.png',
              //   height: 150,
              //   width: 150,
              // ),
              // Container(
              //     height: 80,
              //     width: 200,
              //     margin: EdgeInsets.symmetric(vertical: 10.0),
              //     // color: Colors.blue,
              //     child: Column(
              //       children: const [
              //         Text("Log In Now",
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 22,
              //                 // color: Colors.black,
              //                 // fontFamily: "Montserrat-VariableFont_wght.ttf",
              //                 fontWeight: FontWeight.bold)),
              //         SizedBox(
              //           height: 10,
              //         ),
              //         Text("Please login to continue",
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 // fontFamily: "Montserrat-VariableFont_wght.ttf",
              //                 fontSize: 12,
              //                 color: Colors.white)),
              //       ],
              //     )),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Buyer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  15.horizontalSpace,
                  Switch(
                    // activeColor: AppColors.mainColor,
                    activeTrackColor: AppColors.mainColor,
                    inactiveTrackColor: AppColors.mainColor,
                    value: s3,
                    onChanged: (bool value) {
                      setState(() {
                        s3 = value; //update value when sitch changed
                      });
                    },
                  ),
                  15.horizontalSpace,

                  Text("Seller",style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
              20.verticalSpace,

              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email is Required";
                              } else if (!RegExp(r'\S+@\S+\.\S+')
                                  .hasMatch(value)) {
                                return "Please enter a valid email address";
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(16),
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: textFieldStyle,
                              focusedBorder: textFieldStyle,
                              focusedErrorBorder: textFieldStyle,
                              errorBorder: errorTextFieldStyle,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password is Required";
                              } else if (value.length <= 3) {
                                return "Password should be greater than 3 latter";
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: isVisible,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(16),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.white),
                              suffixIcon: isVisible == false
                                  ? GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.visibility_off,
                                        color: Colors.white,
                                      ))
                                  : GestureDetector(
                                      onTap: () {
                                        // setState(() {
                                        //   isVisible = false;
                                        // });
                                      },
                                      child: Icon(
                                        Icons.visibility,
                                        color: Colors.white,
                                      )),
                              enabledBorder: textFieldStyle,
                              focusedBorder: textFieldStyle,
                              focusedErrorBorder: textFieldStyle,
                              errorBorder: errorTextFieldStyle,
                            ),
                          )),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomActionButton(
                        buttonText: "Login",
                        onTap: () {
                          Get.snackbar("Successfully", "Login Successfully!",
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                              icon: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ));
                          Get.toNamed(
                            RouteNames.bottomNav,
                          );
                        },
                        isIcon: false,
                        isLoading: false,
                      )
                    ],
                  )),
              190.verticalSpace,
              SizedBox(
                  height: 40,
                  width: 230,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(()=> NewSignUp(),transition: Transition.fade,
                              duration: Duration(seconds: 3),);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          ))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
