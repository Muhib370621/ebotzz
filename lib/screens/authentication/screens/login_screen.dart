// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_unnecessary_containers, body_might_complete_normally_nullable, deprecated_member_use

import 'package:ebotzz/services/customerServices.dart';
import 'package:ebotzz/widgets/customActionButton.dart';

import '../../../utils/imports.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              assetImage(
                'assets/images/logo1.png',
                height: 150,
                width: 150,
              ),
              Container(
                  height: 70,
                  width: 200,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  // color: Colors.blue,
                  child: Column(
                    children: const [
                      Text("Log In Now",
                          textAlign: TextAlign.center, style: h1Style),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Please login to continue",
                          textAlign: TextAlign.center, style: h3Style),
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
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
                              labelStyle: TextStyle(color: Colors.black45),
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
                              labelStyle: TextStyle(color: Colors.black45),
                              suffixIcon: isVisible == false
                                  ? GestureDetector(
                                      onTap: () {
                                        // setState(() {
                                        //   isVisible = true;
                                        // });
                                      },
                                      child: Icon(Icons.visibility_off))
                                  : GestureDetector(
                                      onTap: () {
                                        // setState(() {
                                        //   isVisible = false;
                                        // });
                                      },
                                      child: Icon(Icons.visibility)),
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
                          // CustomerServices().getAllProducts();
                          // CustomerServices().getCategory();
                          // print("check "+controller.totalCategoryData.toString());

                          // getOrderStatus();
                          Get.snackbar("Successfully", "Login Successfully!",
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                              icon: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ));
                          Get.to(BottomNavBar());
                        },
                        isIcon: false, isLoading: false,
                      )
                    ],
                  )),
              SizedBox(
                  height: 40,
                  width: 230,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(SignUPScreen());
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: redColor),
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
