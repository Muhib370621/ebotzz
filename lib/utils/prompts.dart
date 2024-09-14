import 'package:ebotzz/core/shared/uplaodPicPopup.dart';
import 'package:ebotzz/widgets/popups/makeAnOffer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


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


  static makeAnOffer() {
    Get.dialog(
       MakeAnOfferPopup(),
      barrierColor: Colors.white.withOpacity(
        0.8,
      ),
    );
  }

  static showSuccess(String title, String middleText) {
    return Get.snackbar(
      title,
      '',
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
      // margin: const EdgeInsets.all(25),
      backgroundColor: Colors.greenAccent.withOpacity(
        0.5,
      ),
      colorText: Colors.white,
      titleText: Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
          color: Colors.black,
        ),
      ),
      messageText: Text(
        middleText,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
        ), // set the font size of the message
      ),
      // icon: Lottie.asset(AppAssets.successIcon),
    );
  }

  static uploadPicPopup(void Function() onCamTap,void Function() onGallTap,) {
    Get.dialog(
      UploadPicPopup(onCameraTap: onCamTap,onGalleryTap: onGallTap,),
      barrierColor: Colors.redAccent.withOpacity(
        0.7,
      ),
    );
  }
}
