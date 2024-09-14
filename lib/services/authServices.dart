import 'dart:convert';

import 'package:ebotzz/models/errorModel.dart';
import 'package:ebotzz/models/signUpModel.dart';
import 'package:ebotzz/services/urlSchemes.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/utils/prompts.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthenticationServices {

  ///sign Up for customer
  Future<SignUpModel> signUp({
    required String name,
    required String email,
    required String password,
    // required String confirmPass,
  }) async {
    /// Url
    String url = UrlSchemes.baseUrl("customers");
    var data = jsonEncode(<String, String>{
      "username": name,
      "email": email,
      "password":password,
      // "passwordConf": confirmPass,
      // "role": "Manager",
    });

    /// Request
    var response = await http.post(
      headers: {'Content-Type': 'application/json'},
      Uri.parse(url),
      body: data,
    );

    /// this is called when we are debugging and this is not called when we
    /// make the release.
    if (kDebugMode) {
      print("Called API: $url");
      // print("PHONE: $phone");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Prompts.showSuccess("Congrats!", "Successfully Signed Up.");
      // Get.offAllNamed(RouteNames.loginScreen);
      Get.defaultDialog(
          title: "Successfully registered",
          titleStyle: const TextStyle(color: Colors.green,fontSize: 16),
          content:Container(
            width: 300,height: 300,child: Lottie.asset("assets/json/successIcon.json"),
          )
      );
      Future.delayed(const Duration(seconds: 2),(){
        Get.to(()=> BottomNavBar());
      });
      return signUpModelFromJson(response.body);
    }
    if (response.statusCode == 400) {
      Prompts.showError("Oops",errorModelFromJson(response.body).message!);
      // return errorModelFromJson(response.body);
    }
    if (response.statusCode == 401) {
      throw Exception('Failed to send!');
    }
    if (response.statusCode == 500) {
      throw Exception('Internal Server Error!');
    } else {
      throw Exception('Something went wrong');
    }
  }



  Future<SignUpModel> signUpVendor({
    required String name,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String shopName,
    required String shopURL,
    required String phoneNumber
    // required String confirmPass,
  }) async {
    /// Url
    String url = UrlSchemes.baseUrl("customers");
    var data = jsonEncode(<String, String>{
      "username": name,
      "email": email,
      "password":password,
      "first_name": firstName,
      "last_name":lastName,
      "shop_name":shopName,
      "shop_url":shopURL,
      "phone_number":phoneNumber

      // "passwordConf": confirmPass,
      // "role": "Manager",
    });

    /// Request
    var response = await http.post(
      headers: {'Content-Type': 'application/json'},
      Uri.parse(url),
      body: data,
    );

    /// this is called when we are debugging and this is not called when we
    /// make the release.
    if (kDebugMode) {
      print("Called API: $url");
      // print("PHONE: $phone");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Prompts.showSuccess("Congrats!", "Successfully Signed Up.");
      // Get.offAllNamed(RouteNames.loginScreen);
      Get.defaultDialog(
          title: "Successfully registered",
          titleStyle: const TextStyle(color: Colors.green,fontSize: 16),
          content:Container(
            width: 300,height: 300,child: Lottie.asset("assets/json/successIcon.json"),
          )
      );
      Future.delayed(const Duration(seconds: 2),(){
        Get.to(()=> BottomNavBar());
      });
      return signUpModelFromJson(response.body);
    }
    if (response.statusCode == 400) {
      Prompts.showError("Oops",errorModelFromJson(response.body).message!);
      // return errorModelFromJson(response.body);
    }
    if (response.statusCode == 401) {
      throw Exception('Failed to send!');
    }
    if (response.statusCode == 500) {
      throw Exception('Internal Server Error!');
    } else {
      throw Exception('Something went wrong');
    }
  }


}
