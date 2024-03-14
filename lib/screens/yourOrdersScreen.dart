import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebotzz/services/firebaseServices.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class YourOrdersScreen extends StatefulWidget {
  const YourOrdersScreen({super.key});

  @override
  State<YourOrdersScreen> createState() => _YourOrdersScreenState();
}

class _YourOrdersScreenState extends State<YourOrdersScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ProductController controller = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getAllOrders();
  }

  getAllOrders() async {
    await FirebaseServices().getUserPendingOrders();
    await FirebaseServices().getUserAcceptedOrders();
    log("---------------------firebase" +
        controller.firebaseUserPendingOrderList.toJson().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Your Orders",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Pending Orders'),
            Tab(text: 'Accepted Orders'),
          ],
        ),
      ),
      body: Obx(() {
        return TabBarView(
          controller: _tabController,
          children: [
            // Content for 'Pending Orders' tab
            Column(
              children: [
                controller.firebaseUserPendingOrderList.isEmpty
                    ? Text(
                  "No Pending Orders Found",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.r,
                    fontWeight: FontWeight.bold,
                  ),
                ).paddingOnly(top: 0.35.sh)
                    :
                ListView.separated(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.r, horizontal: 15.r),
                    shrinkWrap: true,
                    itemCount: controller.firebaseUserPendingOrderList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      // Add a SizedBox to act as the separator with desired height
                      return SizedBox(height: 10.h); // Adjust height as needed
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        // height: 0.1.sh,
                        // width: 0.9.sw,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.r),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 0.1.sh,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    20.r,
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: controller
                                      .firebaseUserPendingOrderList[index]
                                      .orderedProducts!
                                      .img
                                      .toString(),
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
                            ).paddingOnly(bottom: 10.r, top: 10.r),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.firebaseUserPendingOrderList[index]
                                      .orderedProducts!.title,
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Order #",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      controller
                                          .firebaseUserPendingOrderList[index]
                                          .orderID
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Order Date ",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      controller
                                          .firebaseUserPendingOrderList[index]
                                          .orderTimeStamp
                                          .toString()
                                          .substring(0, 10),
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ).paddingSymmetric(
                                horizontal: 15.r, vertical: 10.r),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Amount ",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$${controller.firebaseUserPendingOrderList[index].totalPrice.toString()}",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ).paddingOnly(bottom: 10.r, top: 10.r),
                          ],
                        ),
                      );
                    })
              ],
            ),
            // Content for 'Accepted Orders' tab
            Column(
              children: [
                controller.firebaseUserAcceptedOrderList.isEmpty
                    ? Text(
                        "No Accepted Orders Found",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.r,
                          fontWeight: FontWeight.bold,
                        ),
                      ).paddingOnly(top: 0.35.sh)
                    : ListView.separated(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.r, horizontal: 15.r),
                        shrinkWrap: true,
                        itemCount:
                            controller.firebaseUserAcceptedOrderList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      // Add a SizedBox to act as the separator with desired height
                      return SizedBox(height: 15.h); // Adjust height as needed
                    },
                        itemBuilder: (context, index) {
                          return Container(
                            // height: 0.1.sh,
                            // width: 0.9.sw,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.r),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 0.1.sh,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            20.r,
                                          ),
                                        ),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: controller
                                              .firebaseUserAcceptedOrderList[index]
                                              .orderedProducts!
                                              .img
                                              .toString(),
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
                                    ).paddingOnly(bottom: 10.r, top: 10.r),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .firebaseUserAcceptedOrderList[index]
                                              .orderedProducts!
                                              .title,
                                          style: TextStyle(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Order #",
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              controller
                                                  .firebaseUserAcceptedOrderList[
                                                      index]
                                                  .orderID
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Order Date ",
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              controller
                                                  .firebaseUserAcceptedOrderList[
                                                      index]
                                                  .orderTimeStamp
                                                  .toString()
                                                  .substring(0, 10),
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ).paddingSymmetric(
                                        horizontal: 15.r, vertical: 10.r),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Amount ",
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "\$${controller.firebaseUserAcceptedOrderList[index].totalPrice.toString()}",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.underline
                                          ),

                                        ),
                                      ],
                                    ).paddingOnly(bottom: 10.r, top: 10.r),
                                  ],
                                ),
                              ],
                            ),
                          );
                        })
              ],
            )
          ],
        );
      }),
    );
  }
}
