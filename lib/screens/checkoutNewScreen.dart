import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebotzz/controllers/userController.dart';
import 'package:ebotzz/core/utils/global.dart';
import 'package:ebotzz/models/orderModel.dart';
import 'package:ebotzz/models/product.dart';
import 'package:ebotzz/screens/createOrderScreen.dart';
import 'package:ebotzz/services/firebaseServices.dart';
import 'package:ebotzz/utils/constants.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/textswidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CheckOutNewScreen extends StatelessWidget {
  CheckOutNewScreen({super.key, required this.product, required this.index});
  final int index;

  ProductModel product;

  PreferredSizeWidget _appBar() {
    print("product" + product.img.toString());
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0,
      title: const Text("Checkout", style: h2Style),
      leading: IconButton(
        splashRadius: 20.0,
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.cancel,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());

    log("index is"+index.toString());
    ProductController productController = Get.put(ProductController());
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            // Center(
            //   child: Container(
            //     width: 350.w,
            //     height: 150.h,
            //     decoration: BoxDecoration(
            //         color: Colors.blue.withOpacity(0.4),
            //         border: Border.all(color: Colors.blue.shade800),
            //         borderRadius: BorderRadius.circular(20)),
            //     child: Column(
            //       children: [
            //         SizedBox(
            //           height: 20.h,
            //         ),
            //         Row(
            //           children: [
            //             SizedBox(
            //               width: 8.w,
            //             ),
            //
            //             Icon(
            //               Icons.lightbulb_outline_rounded,
            //               color: Colors.blue.shade800,
            //             ),
            //             // SizedBox(height: 10.h,),
            //             SizedBox(
            //               width: 8.w,
            //             ),
            //             Expanded(
            //                 child: Text(
            //               "New! You can split payment for this purchase accross two cards ",
            //               style: TextStyle(color: Colors.blue.shade900),
            //             )),
            //           ],
            //         ),
            //         SizedBox(
            //           height: 20.h,
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 33.0),
            //           child: Align(
            //               alignment: Alignment.bottomLeft,
            //               child: Text(
            //                 "Add card",
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black,
            //                     fontSize: 19.sp),
            //               )),
            //         )
            //       ],
            //     ),
            //   ),
            // ),

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
            // Padding(
            //   padding: const EdgeInsets.only(top: 15,left: 20),
            //   child: Text("Original product",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            // ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 330.h,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemCount: productController.cartProduct.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 15.0, top: 15, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(0.04),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20.sp,
                            ),
                          ),
                          border: Border.all(
                            color: Colors.redAccent.withOpacity(
                              0.1,
                            ),
                            width: 2.w,
                          ),

                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              width: 60,
                              height: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    20.sp,
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      productController.cartProduct[index].img,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                    color: Colors.red.shade600,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              // Image.network(productController.cartProduct[index].img),
                            )),
                            20.horizontalSpace,
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  productController.cartProduct[index].title,
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 20.sp),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "ID",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      productController.cartProduct[index].id
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  "\$" +
                                    product.price
                                          .toString(),
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
                    );
                  }),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 15,left: 20),
            //   child: Text("Offered product:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20.0, top: 15),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: Container(
            //             width: 60,
            //             height: 70,
            //             child: Image.network(product.img),
            //           )),
            //       Expanded(
            //           child: Column(
            //             children: [
            //               Text(
            //                 product.title,
            //                 style: TextStyle(
            //                     color: Colors.grey.shade800, fontSize: 20.sp),
            //               ),
            //             ],
            //           )),
            //       Expanded(
            //           child: Column(
            //             children: [
            //               Text(
            //                 "\$" + product.price.toString(),
            //                 style: TextStyle(
            //                     color: Colors.black,
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 22.sp),
            //               ),
            //               SizedBox(
            //                 height: 50.h,
            //               )
            //             ],
            //           )),
            //     ],
            //   ),
            // ),

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
              child: Row(
                children: [
                  Text(
                    "Ship to: ",
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    "Select Address ",
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 17,
            ),
            // Center(
            //     child: Padding(
            //   padding: const EdgeInsets.only(left: 60),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "noorkh vrlive",
            //         style:
            //             TextStyle(fontSize: 16.sp, color: Colors.grey.shade800),
            //       ),
            //       Text("Noor Islam ",
            //           style: TextStyle(
            //               fontSize: 16.sp, color: Colors.grey.shade800)),
            //       Text("Zamzama commercial DHA phase 5",
            //           style: TextStyle(
            //               fontSize: 16.sp, color: Colors.grey.shade800)),
            //       Text("Karachi, Sindh 75600 ",
            //           style: TextStyle(
            //               fontSize: 16.sp, color: Colors.grey.shade800)),
            //       Text("Pakistan  ",
            //           style: TextStyle(
            //               fontSize: 16.sp, color: Colors.grey.shade800)),
            //       Text("3100220107 ",
            //           style: TextStyle(
            //               fontSize: 16.sp, color: Colors.grey.shade800)),
            //     ],
            //   ),
            // )),
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
                    "Gift cards, coupons, ebotzz Bucks",
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

            ((product.price - product.price) > 0)
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Amount to pay is ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp),
                        ),
                        Text(
                          "\$${(product.price - product.price).toStringAsFixed(2)}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.sp)),
                        Text(
                          " \$ ${productController.cartScreenTotal.value}"
                              // (product.price - product.price)
                              // .toStringAsFixed(2)
                              .substring(1),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.sp),
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
            SizedBox(
              height: 5.h,
            ),
            Divider(),

            Center(
              child: Text(
                "Youll finish checkout on paypal",
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
                child: SizedBox(
                  width: Get.width*0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40.h,
                      width: Get.width * 0.9,
                      child: ElevatedButton(
                          style: ButtonStyle(

                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    // side: BorderSide(color: Colors.red)
                                  ))),
                          onPressed: () {
                            FirebaseServices().placeOrder(OrderModel(
                              orderID: DateTime.now().millisecond.toString(),
                              orderStatus: "Pending",
                              orderTimeStamp: DateTime.now().toString(),
                              totalPrice: product.price.toString(),
                              buyerEmail: globalUserModel.email.toString(),
                              sellerEmail: productController.firebaseProductList[index].userModel.email.toString(),
                              orderedProducts: product
                            ));

                            // var amount = (product.price - product.price);
                            //       print(amount.toString());
                            //       Get.to(CreateOrderScreen(
                            //         product: product,
                            //       ));
                          },
                          child: Text(
                            "Place Order",
                            // "Pay with Paypal",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18.sp
                            ),
                          )),
                    ),
                  )
            //       CustomActionButton(
            //   buttonText: "Pay with PayPal",
            //   isLoading: false,
            //   isIcon: false,
            //   color: Colors.redAccent,
            //   onTap: () {
            //       var amount = (product.price - product.price);
            //       print(amount.toString());
            //       Get.to(CreateOrderScreen(
            //         product: product,
            //       ));
            //   },
            // ),
                )),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
