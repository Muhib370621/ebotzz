import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';
import 'package:flutter/material.dart';

import 'addAuctionScreen.dart';

class AuctionScreen extends StatelessWidget {
  const AuctionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    int items = 6;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("Auction Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            CustomInputField(
              controller: controller,
              label: "Search products here",
              suffixIcon: Icon(Icons.search),
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      "Fliter your search",
                      style: TextStyle(color: Colors.black, fontSize: 24.sp),
                    )),
                Row(
                  children: [
                    Expanded(
                        child: CustomInputField(
                      controller: controller2,
                      label: "Start(YY-MM-DD)",
                    )),
                    Expanded(
                        child: CustomInputField(
                      controller: controller3,
                      label: "End(YY-MM-DD)",
                    )),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomActionButton(
              buttonText: "Apply",
              isIcon: false, isLoading: false,
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(thickness: 3,color: Colors.black,),
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text("Auction Activity:",style: TextStyle(fontSize: 24.sp,),),
              ),
                  SizedBox(height: 10.h,),
                Center(
                  child: Column(
                    children: [
                      Text("ALL (0)",style: TextStyle(fontSize: 18.sp)),
                      SizedBox(height: 5.h,),
                      Text("Online (0)",style: TextStyle(fontSize: 18.sp)),
                      SizedBox(height: 5.h,),
                      Text("Pending review (0)",style: TextStyle(fontSize: 18.sp)),
                      SizedBox(height: 5.h,),
                      Text("Draft (0)",style: TextStyle(fontSize: 18.sp)),
                      SizedBox(height: 20.h,),
                      CustomActionButton(buttonText: "Add Auction",isIcon: false,onTap: (){
                        Get.to(AddAuctionScreen());
                      }, isLoading: false,)
                    ],
                  ),
                ),

            ],),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(thickness: 3,color: Colors.black,),
            ),
            Text(
              "All Auctions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),

            SizedBox(
              height: 10.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(5, (index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
                    child: InkWell(
                      child: Container(
                        width: 400.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white24)),
                          child: Center(
                              child: Text(
                            "Smart Earbuds",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.sp),
                          )),
                        ),
                      ),
                      onLongPress: () {
                        Get.defaultDialog(
                            title: "Select operation",
                            content: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        child: CustomActionButton(
                                      buttonText: 'Delete',
                                      isIcon: false, isLoading: false,
                                        ),
                                      )),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Expanded(
                                          child: Container(
                                        child: CustomActionButton(
                                          buttonText: 'Update',
                                          isIcon: false, isLoading: false,
                                        ),
                                      )),
                                    ],
                                  )
                                ],
                              ),
                            ));
                      },
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
