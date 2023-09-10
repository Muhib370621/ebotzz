import 'dart:ui';

import 'package:ebotzz/core/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UploadPicPopup extends StatelessWidget {
  const UploadPicPopup({
    Key? key,
    this.onCameraTap,
    this.onGalleryTap,
  }) : super(key: key);

  final void Function()? onCameraTap;
  final void Function()? onGalleryTap;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(18.0), // set the border radius to 10.0
        ),
        child: Container(
          height: 222.h,
          width: 285.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(
                25.sp,
              ),
            ),
          ),
          padding: EdgeInsets.all(
            15.sp,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.red.shade600,
                    weight: 25.sp,
                    // fill: 25.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 41.h,
              ),
              SizedBox(
                width: 255.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: onCameraTap,
                      child: Column(
                        children: [
                          Container(
                            height: 80.h,
                            width: 92.w,
                            decoration: BoxDecoration(
                              color:  AppColors.mainColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  20.sp,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset:
                                  Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                              "assets/images/cameraIcon.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: onGalleryTap,
                      child: Column(
                        children: [
                          Container(
                            height: 80.h,
                            width: 92.w,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  20.sp,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                              "assets/images/galleryIcon.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}