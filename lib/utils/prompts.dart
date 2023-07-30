import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class Prompts {

  static showError(String title, String middleText) {
    return Get.snackbar(
      title,
      '',
      duration: const Duration(seconds: 4),
      snackPosition: SnackPosition.BOTTOM,
      // margin: const EdgeInsets.all(25),
      backgroundColor: Colors.redAccent.withOpacity(
        0.3,
      ),
      colorText: Colors.black,
      titleText: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      messageText: Text(
        middleText,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ), // set the font size of the message
      ),
      // icon: Lottie.asset(AppAssets.errorIcon),
    );
  }
}
