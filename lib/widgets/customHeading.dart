// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:ebotzz/utils/imports.dart';

class customHeading extends StatelessWidget {
  customHeading({required this.heading});
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Text(
        heading,
        style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Monsterrat'),
      ),
    );
  }
}
