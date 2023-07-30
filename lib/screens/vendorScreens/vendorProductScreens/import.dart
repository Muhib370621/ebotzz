import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/vendorWidgets/pagerRow.dart';
import 'package:flutter/material.dart';

class ImportScreen extends StatelessWidget {
  const ImportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          SizedBox(height: 20.h,),
          Text(
            "Import Products",
            style: TextStyle(fontSize: 24.sp, color: Colors.black),
          ),
          SizedBox(height: 30.h,),
          Center(
            child: Container(
              width: 370,
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Import products from CSV file",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp,color: Colors.grey.shade600),),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "This tool allows you to import (or merge) product data to your store from a CSV pr TXT file",
                          style: TextStyle(color: Colors.grey, fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Click here to download sample file",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 350.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black
                        )
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                            children: [
                                SizedBox(height: 10.h,),
                                Text(
                                  "Choose a CSV file from you Device",
                                  style: TextStyle(fontSize: 18.sp),
                                )
                            ],
                          ),
                              )),
                          VerticalDivider(
                            color: Colors.grey,
                          ),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.h,),
                             Row(
                               children: [
                                 SizedBox(height: 10.h,),
                                 Container(
                                   width: 71.w,
                                   height: 30.h,
                                   color: Colors.grey.shade400,
                                   child: Center(child: Text("choose file")),
                                 ),
                                 SizedBox(width: 5.h,),
                                 Text("no chosen file"),
                               ],
                             ),
                              SizedBox(height: 20.h,),
                              Text("Maximum size 128 MB")
                            ],
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          CustomActionButton(buttonText: "Next",isIcon: false, isLoading: false,),
          SizedBox(height: 30.h,),
          PagerRow(fillIndex: 1)
        ],
      ),
    );
  }
}
