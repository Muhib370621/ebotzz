import 'package:ebotzz/models/product.dart';
import 'package:ebotzz/screens/finializeTradeScreen.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:flutter/material.dart';

class TradeScreen extends StatelessWidget {
  final ProductModel productOriginal;
  final ProductModel productOffered;
  TradeScreen(
      {Key? key, required this.productOriginal, required this.productOffered})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Trading screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Container(
                width: 350.w,
                height: 150.h,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.4),
                    border: Border.all(color: Colors.blue.shade800),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 8.w,
                        ),

                        Icon(
                          Icons.lightbulb_outline_rounded,
                          color: Colors.blue.shade800,
                        ),
                        // SizedBox(height: 10.h,),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                            child: Text(
                          "New! You can split payment for this purchase accross two cards ",
                          style: TextStyle(color: Colors.blue.shade900),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 33.0),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Add cart",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 19.sp),
                          )),
                    )
                  ],
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15),
              child: Text(
                "Seller: beyond_theworld",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 20),
              child: Text("Original product",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    width: 60,
                    height: 70,
                    child: Image.network(productOriginal.img),
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        productOriginal.title,
                        style: TextStyle(
                            color: Colors.grey.shade800, fontSize: 20.sp),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        "\$" + productOriginal.price.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp),
                      ),
                      SizedBox(
                        height: 50.h,
                      )
                    ],
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 20),
              child: Text("Offered product:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    width: 60,
                    height: 70,
                    child: Image.network(productOffered.img),
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        productOffered.title,
                        style: TextStyle(
                            color: Colors.grey.shade800, fontSize: 20.sp),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        "\$" + productOffered.price.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp),
                      ),
                      SizedBox(
                        height: 50.h,
                      )
                    ],
                  )),
                ],
              ),
            ),



            SizedBox(
              height: 20.h,
            ),

            SizedBox(
              height: 15.h,
            ),
            Column(
              children: [
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Message to seller")),
                      Icon(
                        Icons.navigate_next,
                        size: 40.sp,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                Divider()
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Ship to: ",
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "noorkh vrlive",
                    style:
                        TextStyle(fontSize: 16.sp, color: Colors.grey.shade800),
                  ),
                  Text("Noor Islam ",
                      style: TextStyle(
                          fontSize: 16.sp, color: Colors.grey.shade800)),
                  Text("Zamzama commercial DHA phase 5",
                      style: TextStyle(
                          fontSize: 16.sp, color: Colors.grey.shade800)),
                  Text("Karachi, Sindh 75600 ",
                      style: TextStyle(
                          fontSize: 16.sp, color: Colors.grey.shade800)),
                  Text("Pakistan  ",
                      style: TextStyle(
                          fontSize: 16.sp, color: Colors.grey.shade800)),
                  Text("3100220107 ",
                      style: TextStyle(
                          fontSize: 16.sp, color: Colors.grey.shade800)),
                ],
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Pay with: ",
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/paypal.png",
                    width: 70,
                    height: 70,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "PayPal",
                    style: TextStyle(fontSize: 16.sp),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gift cards, coupons, eBay Bucks",
                    style: TextStyle(fontSize: 17.sp),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Icon(
                      Icons.navigate_next,
                      size: 40.sp,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Donate to charity (optional)",
                    style: TextStyle(fontSize: 17.sp),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Icon(
                      Icons.navigate_next,
                      size: 40.sp,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Divider(),

            ((productOriginal.price - productOffered.price) > 0)
                ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Amount to pay is ",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),
                        ),
                      Text(
                          "\$${(productOriginal.price - productOffered.price).toStringAsFixed(2)}",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),
                        ),
                    ],
                  ),
                )
                : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text("The amount to be received is ",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp)),
                        Text(
                          (productOriginal.price == productOffered.price)
                              ? "\$0  "
                              : " \$" +
                                  (productOriginal.price -
                                          productOffered.price)
                                      .toStringAsFixed(2)
                                      .substring(1),
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),
                          // (productOriginal.price - productOffered.price).toString().length==3?
                          // (productOriginal.price - productOffered.price).toString().substring(1,3)+" USD ":
                          //
                          // (productOriginal.price - productOffered.price).toString().length>5?
                          // (productOriginal.price - productOffered.price).toString().substring(1,6)+" USD ":
                          //
                          // (productOriginal.price - productOffered.price).toString().substring(1)+" USD "
                        )
                      ],
                    ),
                ),
            SizedBox(height: 5.h,),
            Divider(),

            Center(
              child: Text("Youll finish checkout on paypal",style: TextStyle(fontSize: 20.sp
              ),),
            ),
            SizedBox(height: 20.h,),
            Center(child: CustomActionButton(buttonText: "Pay with PayPal", isLoading: false,isIcon: false,color: Colors.blue,onTap: (){
              var amount = (productOriginal.price-productOffered.price);
              print(amount.toString());
              Get.to(FinalizeTradeScreen(amount: amount,));
            },)),
            SizedBox(height: 20.h,),

          ],
        ),
      ),
    );
  }
}
