import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';
import 'package:flutter/material.dart';

class AddAuctionScreen extends StatelessWidget {
  const AddAuctionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    TextEditingController controller4= TextEditingController();
    TextEditingController controller5= TextEditingController();
    TextEditingController controller6= TextEditingController();
    TextEditingController controller7= TextEditingController();
    TextEditingController controller8= TextEditingController();
    TextEditingController controller9= TextEditingController();
    TextEditingController controller10= TextEditingController();
    TextEditingController controller11= TextEditingController();
    TextEditingController controller12= TextEditingController();
    TextEditingController controller13= TextEditingController();
    TextEditingController controller14= TextEditingController();
    TextEditingController controller15= TextEditingController();
    TextEditingController controller16= TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("Add Auction Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h,),
            Center(
              child: Container(
                width: 200.w,
                height: 200.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade800),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(child: Column(
                  children: [
                    SizedBox(height: 20.h,),
                    Text("Add Image",style: TextStyle(fontSize: 24.sp),),
                    SizedBox(height: 20.h,),
                    Icon(Icons.image,size: 48.sp,)
                  ],
                ),),
              ),

            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)
                ),
                child:Column(
                  children: [
                    SizedBox(height: 20.h,),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomInputField(controller:controller,label: "Product Name", ),
                          SizedBox(height: 5.h,),
                          CustomInputField(controller:controller2,label: "Short Description", ),
                          CustomInputField(controller:controller3,label: "Select Category", ),
                          CustomInputField(controller:controller4,label: "Select Tag", ),
                          SizedBox(height: 20.h,),

                          Container(
                            width: double.infinity,
                            height:50.h,color: Colors.black,
                            child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("General Options",style: TextStyle(color: Colors.white,fontSize: 18.sp),),
                          ),),
                          SizedBox(height: 10.h,),

                          Row(
                            children: [
                              Expanded(child: Column(children: [
                                Text("Item condition",style: TextStyle(fontSize: 18.sp),),
                                CustomInputField(controller: controller5,label: "New",)
                              ],)),
                              Expanded(child: Column(children: [
                                Text("Auction Type",style: TextStyle(fontSize: 18.sp),),
                                CustomInputField(controller: controller6,label: "Normal",)
                              ],)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15,bottom: 20),
                            child: Text("Enable proxy bidding",style: TextStyle(fontSize: 19.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                          Row(
                            children: [
                              Expanded(child: Column(children: [
                                Text("Start price",style: TextStyle(fontSize: 18.sp),),
                                CustomInputField(controller: controller7,label: "New",)
                              ],)),
                              Expanded(child: Column(children: [
                                Text("Bid increment",style: TextStyle(fontSize: 18.sp),),
                                CustomInputField(controller: controller8,label: "Normal",)
                              ],)),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              Expanded(child: Column(children: [
                                Text("Reserved price",style: TextStyle(fontSize: 18.sp),),
                                CustomInputField(controller: controller9,label: "New",)
                              ],)),
                              Expanded(child: Column(children: [
                                Text("Buy it now price",style: TextStyle(fontSize: 18.sp),),
                                CustomInputField(controller: controller10,label: "Normal",)
                              ],)),
                            ],
                          ),
                          SizedBox(height: 30.h,),
                          Container(
                          color: Colors.black,
                            width: double.infinity,
                            height: 50.h,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Shipping and Tax",style: TextStyle(color: Colors.white,fontSize: 18.sp),),
                              )
                          ),
                          CustomInputField(controller: controller11,label: "weight(lbs)",),
                          CustomInputField(controller: controller12,label: "length(inch)",),
                          CustomInputField(controller: controller13,label: "width(inch)",),
                          CustomInputField(controller: controller14,label: "weiht(lbs)",),
                          CustomInputField(controller: controller15,label: "height(inch)",),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Shipping class",style: TextStyle(fontSize: 18.sp),),
                          ),
                          CustomInputField(controller: controller16,label: "No shipping class (0 USD)",),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Shipping classes are used by certain shipping methods to group similar products. Before adding a product, please configure the shipping settings",
                              style: TextStyle(fontSize: 18.sp,color: Colors.grey),),
                          ),
                          SizedBox(height:5.h),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text("Click here to configure shipping setting",style: TextStyle(color: Colors.black),),
                            
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 20.h),
                            child: Center(child: const CustomActionButton(buttonText: "Add Auction Product", isIcon: false, isLoading: false,)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
