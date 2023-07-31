// ignore_for_file: prefer_const_constructors

import 'package:ebotzz/utils/imports.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.001),
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        // boxShadow: [
          // BoxShadow(
          //   color: Colors.transparent,
            // spreadRadius: 2.r,
            // blurRadius: 2.r,
            // offset: Offset(0, 3), // changes position of shadow
          // ),
        // ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 10.w,
          ),
          InkWell(
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30)
                  
                ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(Icons.menu_rounded,size: 28.sp,),
                  ))),
          SizedBox(width: 100.w),
          assetImage('assets/images/newTopLogo.jpg', width: 100.h, height: 50.w),
          SizedBox(width: 102 .w,),
          Icon(Icons.notifications_outlined,size: 28.sp,color: Colors.grey.shade800,),
          Spacer(),
          // InkWell(
          //   onTap: () {
          //     Get.to(() => SearchScreen());
          //   },
          //   child: Icon(
          //     Icons.search,
          //     color: Colors.black,
          //     size: 25.sp,
          //   ),
          // ),
          SizedBox(
            width: width * 0.05.w,
          ),
          // Icon(Icons)
        ],
      ),
    );
  }
}
