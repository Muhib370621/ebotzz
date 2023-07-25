// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:ebotzz/utils/imports.dart';

class StatusCard extends StatelessWidget {
  StatusCard({required this.statuscode});
  int statuscode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      decoration: BoxDecoration(
        color: statuscode == 1
            ? Color(0xff20C997)
            : statuscode == 2
                ? Color(0xffF86C6B)
                : Color(0xffFFC107),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        child: Center(
          child: Text(
            statuscode == 1
                ? 'Approved'
                : statuscode == 2
                    ? 'Declined'
                    : 'Pending',
            style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
