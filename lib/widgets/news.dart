// ignore_for_file: prefer_const_constructors

import 'package:ebotzz/utils/imports.dart';

newsCard({required String img, required String title, required String date}) {
  return Container(
    width: width,
    margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    child: Row(
      children: [
        Container(
          height: 80.h,
          width: 80.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.fill)),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.tr,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              date,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          ],
        )
      ],
    ),
  );
}
