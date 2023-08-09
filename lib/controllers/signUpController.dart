import 'dart:io';

import 'package:ebotzz/models/signUpModel.dart';
import 'package:ebotzz/services/authServices.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  // Rx<TextEditingController> confPasswordController = TextEditingController().obs;

  // Rx<SignUpModel> completeData = SignUpModel().obs;
  var object = SignUpModel().obs;


  Future<SignUpModel?> signUp(
      String name,
      String email,
      String password,
      // String confirmPass,
      ) async {
    try {
      isLoading.value = true;
      var result = await AuthenticationServices().signUp(
        name: name,
        email: email,
        password: password,
        // confirmPass: confirmPass,
      );
      if (kDebugMode) {
        print("Result: " + result.toString());
      }
      // completeData.value = result;
      object.value = result;
      isLoading.value = false;
      return result;
    } on SocketException {
      isLoading.value = false;
      // Prompts.showDialog(
      //     middleText: "Internet connection failure!", title: 'Oops');
    } on Exception {
      isLoading.value = false;
      // Prompts.showDialog(middleText: "No data found!", title: 'Oops');
    } catch (e) {
      isLoading.value = false;
      // Prompts.showDialog(middleText: "No data found!", title: 'Oops');
    }
  }


  // Future<SignUpModel?> signUpVendor(
  //     String name,
  //     String email,
  //     String password,
  //     String firstName,
  //     String lastName,
  //     String shopName,
  //     String shopURL,
  //     String phoneNumber
  //     // String confirmPass,
  //     ) async {
  //   try {
  //     isLoading.value = true;
  //     var result = await AuthenticationServices().signUpVendor(
  //       name: name,
  //       email: email,
  //       password: password,
  //
  //       // confirmPass: confirmPass,
  //     );
  //     if (kDebugMode) {
  //       print("Result: " + result.toString());
  //     }
  //     // completeData.value = result;
  //     object.value = result;
  //     isLoading.value = false;
  //     return result;
  //   } on SocketException {
  //     isLoading.value = false;
  //     // Prompts.showDialog(
  //     //     middleText: "Internet connection failure!", title: 'Oops');
  //   } on Exception {
  //     isLoading.value = false;
  //     // Prompts.showDialog(middleText: "No data found!", title: 'Oops');
  //   } catch (e) {
  //     isLoading.value = false;
  //     // Prompts.showDialog(middleText: "No data found!", title: 'Oops');
  //   }
  // }
}
