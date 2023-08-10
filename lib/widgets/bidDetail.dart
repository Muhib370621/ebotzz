import 'package:ebotzz/utils/imports.dart';
import 'package:flutter/material.dart';

class BidDetail extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  const BidDetail({Key? key, required this.firstLabel, required this.secondLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(firstLabel,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.grey.shade700),),
        SizedBox(height: 7.h,),
        Text(secondLabel,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.grey.shade700),)
      ],
    );
  }
}
