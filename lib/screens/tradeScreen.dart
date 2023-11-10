import 'package:ebotzz/controllers/offerController.dart';
import 'package:ebotzz/core/utils/appColors.dart';
import 'package:ebotzz/core/utils/app_extension.dart';
import 'package:ebotzz/models/product.dart';
import 'package:ebotzz/screens/finializeTradeScreen.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/counter_button.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'home_screen/HomeScreen2.dart';

class TradeScreen extends StatefulWidget {
  final ProductModel productOriginal;
  final ProductModel productOffered;

  TradeScreen(
      {Key? key, required this.productOriginal, required this.productOffered})
      : super(key: key);

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  @override
  Widget build(BuildContext context) {
    OfferController offerController = Get.put(OfferController());
    ProductController productController = Get.put(ProductController());
    offerController.paymentMethod.value = 0;
    offerController.paymentName.value = "Visa card";
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text("Trading offer"),
        ),
        body: WillPopScope(
          onWillPop: () async {
            productController.quantity.value = 1;
            Get.to(HomeScreen2());
            return true;
          },
          child: SingleChildScrollView(
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
                //                   "New! You can split payment for this purchase accross two cards ",
                //                   style: TextStyle(color: Colors.blue.shade900),
                //                 )),
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
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20),
                  child: Text(
                  "Trade Up Product/Wanted",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.04),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            15,
                          ),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(0.04),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              15,
                            ),
                          ),
                          border: Border.all(
                              color: Colors.grey.withOpacity(
                                0.5,
                              ),
                              width: 1.5.w),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 0.15.sh,
                              width: 0.3.sw,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  widget.productOriginal.img,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    5.verticalSpace,
                                    Text(
                                        widget.productOriginal.title
                                            .addOverFlow,
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        "\$${widget.productOriginal.price.toString()}")
                                  ],
                                ),
                                // Text(
                                //     "\$${productController.cartScreenItems[index].title.toString()}",
                                //     style: h2Style),
                                const SizedBox(height: 10),
                                // Text("Quantity:"),
                                // SizedBox(
                                //   height: 5,
                                // ),
                                // Container(
                                //   width: 30,
                                //   height: 30,
                                //   decoration: BoxDecoration(
                                //       border: Border.all(color: Colors.grey.shade700),
                                //       borderRadius: BorderRadius.circular(5)),
                                //   child: Center(
                                //       child: Text(productController
                                //           .cartScreenItems[index].quantity
                                //           .toString())),
                                // )
                              ],
                            ),
                            // Spacer(),
                            CounterButton(
                                orientation: Axis.vertical,
                                onIncrementSelected: () => {
                                      setState(() {
                                        productController.increaseItem(
                                            widget.productOriginal);
                                      })
                                    },
                                onDecrementSelected: () => {
                                      if (widget.productOriginal.quantity >
                                          0)
                                        {
                                          setState(() {
                                            productController.decreaseItem(
                                                widget.productOriginal);
                                          })
                                        }
                                    },
                                label: widget.productOriginal.quantity)
                            // counterButton(products)
                          ],
                        ),
                      )
                      // Column(
                      //   children: [
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       children: [
                      //         ClipRRect(
                      //           borderRadius: BorderRadius.circular(15.0),
                      //           child: SizedBox(
                      //             height: 120.h,
                      //             // width: 100.w,
                      //             child: Image.network(
                      //               productOriginal.img,
                      //             ),
                      //           ),
                      //         ),
                      //         const SizedBox(width: 5),
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             // Text(productOriginal.title.addOverFlow, style: h4Style),
                      //             const SizedBox(height: 5),
                      //             Text(
                      //                 "${productOriginal.title.toString()}",
                      //                 style: h2Style),
                      //             const SizedBox(height: 10),
                      //             Divider(
                      //               color: Colors.redAccent.withOpacity(0.5),
                      //               height: 30.h,
                      //               thickness: 2.w,
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.all(8),
                      //               child: Column(
                      //                 children: [
                      //                   Row(
                      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                     children: [
                      //                       Text("Price "),
                      //                       Text(
                      //                           "\$${productOriginal.price.toString()}")
                      //                     ],
                      //                   ),
                      //                   // Row(
                      //                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                   //   children: [Text("Shipping"), Text("\$ 0")],
                      //                   // ),
                      //                   // Divider(
                      //                   //   color: Colors.redAccent.withOpacity(0.05),
                      //                   //   height: 40.h,
                      //                   //   thickness: 2.w,
                      //                   // ),
                      //                   // Row(
                      //                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                   //   children: [
                      //                   //     Text(
                      //                   //       "Subtotal",
                      //                   //       style: TextStyle(fontWeight: FontWeight.w900),
                      //                   //     ),
                      //                   //     Text(
                      //                   //       "\$${productOriginal.price.toString()}",
                      //                   //       style: TextStyle(fontWeight: FontWeight.w900),
                      //                   //     )
                      //                   //   ],
                      //                   // ),
                      //                   // 20.verticalSpace,
                      //                   // Text("Order Total Calculated at Checkout"),
                      //                 ],
                      //               ),
                      //             )
                      //             // Text("Quantity:"),
                      //             // SizedBox(
                      //             //   height: 5,
                      //             // ),
                      //             // Container(
                      //             //   width: 30,
                      //             //   height: 30,
                      //             //   decoration: BoxDecoration(
                      //             //       border: Border.all(color: Colors.grey.shade700),
                      //             //       borderRadius: BorderRadius.circular(5)),
                      //             //   child: Center(
                      //             //       child: Text(productOriginal.quantity.toString()),
                      //             // )
                      //             // )
                      //           ],
                      //         ),
                      //         // Spacer(),
                      //         // counterButton(products)
                      //       ],
                      //     ).fadeAnimation(0.4 * 2),
                      //
                      //   ],
                      // ),
                      ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20.0, top: 15),
                //   child: Row(
                //     children: [
                //       Expanded(
                //           child: Container(
                //         width: 60,
                //         height: 70,
                //         child: Image.network(productOriginal.img),
                //       )),
                //       Expanded(
                //           child: Column(
                //         children: [
                //           Text(
                //             productOriginal.title,
                //             style: TextStyle(
                //                 color: Colors.grey.shade800, fontSize: 20.sp),
                //           ),
                //         ],
                //       )),
                //       Expanded(
                //           child: Column(
                //         children: [
                //           Text(
                //             "\$" + productOriginal.price.toString(),
                //             style: TextStyle(
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 22.sp),
                //           ),
                //           SizedBox(
                //             height: 50.h,
                //           )
                //         ],
                //       )),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20),
                  child: Text(
                    "Trade in Product/Offered",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.04),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                      border: Border.all(
                          color: Colors.grey.withOpacity(
                            0.5,
                          ),
                          width: 1.5.w),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 0.15.sh,
                          width: 0.3.sw,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              widget.productOffered.img,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                5.verticalSpace,
                                Text(
                                    widget.productOffered.title.addOverFlow,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    "\$${widget.productOffered.price.toString()}")
                              ],
                            ),
                            // Text(
                            //     "\$${productController.cartScreenItems[index].title.toString()}",
                            //     style: h2Style),
                            const SizedBox(height: 10),
                            // Text("Quantity:"),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            // Container(
                            //   width: 30,
                            //   height: 30,
                            //   decoration: BoxDecoration(
                            //       border: Border.all(color: Colors.grey.shade700),
                            //       borderRadius: BorderRadius.circular(5)),
                            //   child: Center(
                            //       child: Text(productController
                            //           .cartScreenItems[index].quantity
                            //           .toString())),
                            // )
                          ],
                        ),
                        // Spacer(),
                        CounterButton(
                            orientation: Axis.vertical,
                            onIncrementSelected: () => {
                                  setState(() {
                                    productController.calculateTotalPrice();

                                    productController.increaseItem(
                                        widget.productOffered);
                                  })
                                },
                            onDecrementSelected: () => {
                                  if (widget.productOffered.quantity > 0)
                                    {
                                      setState(() {
                                        productController
                                            .calculateTotalPrice();
                                        productController.decreaseItem(
                                            widget.productOffered);
                                      })
                                    }
                                },
                            label: widget.productOffered.quantity)
                        // counterButton(products)
                      ],
                    ),
                  ),
                ),
                30.verticalSpace,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Details",
                        style: h2Style,
                      ),
                      10.verticalSpace,
                      Container(
                        padding: EdgeInsets.all(10),
                        // height: 100.h,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor.withOpacity(
                            0.02,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              15,
                            ),
                          ),
                          border: Border.all(
                              color: Colors.grey.withOpacity(
                                0.5,
                              ),
                              width: 1.2.w),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sub Total",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  "\$${((widget.productOriginal.price * widget.productOriginal.quantity) - widget.productOffered.price * widget.productOffered.quantity).toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shipping",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  "\$ 0",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Payment Method",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  "Master Card",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            10.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Balance Due",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  NumberFormat.compact().format("\$${((widget.productOriginal.price * widget.productOriginal.quantity) - widget.productOffered.price * widget.productOffered.quantity).toStringAsFixed(2)}"),
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Deposit Held until delivery",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  NumberFormat.compact().format("\$${(widget.productOriginal.price * widget.productOriginal.quantity)- ((widget.productOriginal.price * widget.productOriginal.quantity) - (widget.productOffered.price * widget.productOffered.quantity))}"),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )

                // Padding(
                //   padding: const EdgeInsets.only(left: 20.0, top: 15),
                //   child: Row(
                //     children: [
                //       Expanded(
                //           child: Container(
                //         width: 60,
                //         height: 70,
                //         child: Image.network(productOffered.img),
                //       )),
                //       Expanded(
                //           child: Column(
                //         children: [
                //           Text(
                //             productOffered.title,
                //             style: TextStyle(
                //                 color: Colors.grey.shade800, fontSize: 20.sp),
                //           ),
                //         ],
                //       )),
                //       Expanded(
                //           child: Column(
                //         children: [
                //           Text(
                //             "\$" + productOffered.price.toString(),
                //             style: TextStyle(
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 22.sp),
                //           ),
                //           SizedBox(
                //             height: 50.h,
                //           )
                //         ],
                //       )),
                //     ],
                //   ),
                // ),
                ,
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.2),
                  thickness: 2.h,
                ),
                ((widget.productOriginal.price - widget.productOffered.price) >
                        0)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Due with deposits",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 17.sp),
                            ),
                            Text(
                              NumberFormat.compact().format("\$${((widget.productOriginal.price * widget.productOriginal.quantity)).toStringAsFixed(2)}"),
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 17.sp),
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp)),
                            Text(
                              (widget.productOriginal.price ==
                                      widget.productOffered.price)
                                  ? "\$0  "
                                  : " \$" +
                                      (widget.productOriginal.price -
                                              widget.productOffered.price)
                                          .toStringAsFixed(2)
                                          .substring(1),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.sp),
                            )
                          ],
                        ),
                      ),

                // SizedBox(
                //   height: 15.h,
                // ),
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
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
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
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            offerController.paymentMethod.value = 0;
                            offerController.paymentName.value = "Visa card";
                          },
                          child: Container(
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        offerController.paymentMethod.value == 0
                                            ? AppColors.mainColor
                                            : Colors.transparent,
                                    width: 3)),
                            child: Image.asset(
                              "assets/images/visalogo.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            offerController.paymentMethod.value = 1;
                            offerController.paymentName.value = "Master card";
                          },
                          child: Container(
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        offerController.paymentMethod.value == 1
                                            ? AppColors.mainColor
                                            : Colors.transparent,
                                    width: 3)),
                            child: Image.asset(
                              "assets/images/mastercard.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            offerController.paymentMethod.value = 2;
                            offerController.paymentName.value = "Google pay";
                          },
                          child: Container(
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        offerController.paymentMethod.value == 2
                                            ? AppColors.mainColor
                                            : Colors.transparent,
                                    width: 3)),
                            child: Image.asset(
                              "assets/images/img_4.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            offerController.paymentMethod.value = 3;
                            offerController.paymentName.value = "Apple pay";
                          },
                          child: Container(
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        offerController.paymentMethod.value == 3
                                            ? AppColors.mainColor
                                            : Colors.transparent,
                                    width: 3)),
                            child: Image.asset(
                              "assets/images/applepay.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),

                Center(
                  child: Container(
                      width: 350.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.08),
                          border: Border.all(color: Colors.blue.shade100),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Note that Funds will be held and released when both parties have confirmed delivery acceptance",
                          style: TextStyle(
                              color: Colors.blue.shade800, fontSize: 15.sp),
                        ),
                      ))),
                ),

                SizedBox(
                  height: 20.h,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Gift cards, coupons, eBay Bucks",
                //         style: TextStyle(fontSize: 17.sp),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(right: 12.0),
                //         child: Icon(
                //           Icons.navigate_next,
                //           size: 40.sp,
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),

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

                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp)),
                      Text("Free shipping",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp)),
                    ],
                  ),
                ),

                Divider(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment method ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp)),
                      Text("Trade",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp)),
                    ],
                  ),
                ),
                Divider(),

                SizedBox(
                  height: 5.h,
                ),
                Divider(),

                Center(
                  child: Text(
                    "Youll finish checkout",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Obx(() => SizedBox(
                        height: 45.h,
                        width: Get.width * 0.9,
                        child: CustomActionButton(
                          buttonText:
                              "Pay with ${offerController.paymentName.value}",
                          isLoading: false,
                          isIcon: false,
                          color: AppColors.mainColor,
                          onTap: () {
                            var amount = (widget.productOriginal.price -
                                widget.productOffered.price);
                            print(amount.toString());
                            Get.to(FinalizeTradeScreen(
                              amount: amount,
                            ));
                          },
                        ),
                      )),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ));
  }
}
