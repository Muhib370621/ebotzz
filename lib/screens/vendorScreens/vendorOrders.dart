import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebotzz/core/utils/appColors.dart';
import 'package:ebotzz/services/firebaseServices.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';
import 'package:ebotzz/widgets/vendorWidgets/vendorTabBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorOrders extends StatefulWidget {
  const VendorOrders({Key? key}) : super(key: key);

  @override
  State<VendorOrders> createState() => _VendorOrdersState();
}

class _VendorOrdersState extends State<VendorOrders>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    FirebaseServices().getVendorPendingOrders();
    FirebaseServices().getVendorAcceptedOrders();
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController controller = TextEditingController()
    ProductController productcontroller = Get.put(ProductController());

    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.vendorAppBarColor,
        title: Text("Vendor Orders "),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            CustomInputField(
              controller: controller,
              label: "Search orders",
            ),
            Row(
              children: [
                Expanded(
                    child: CustomInputField(
                  controller: controller,
                  label: "Start Date (YY-MM-DD)",
                )),
                Expanded(
                    child: CustomInputField(
                  controller: controller,
                  label: "End Date (YY-MM-DD)",
                )),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomActionButton(
              buttonText: "Apply",
              isIcon: false,
              isLoading: false,
            ),
            SizedBox(
              height: 30.h,
            ),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'Pending Orders'),
                Tab(text: 'Accepted Orders'),
              ],
            ),
            Obx(() {
              return SizedBox(
                height: 0.8.sh,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Content for 'Pending Orders' tab
                    Column(
                      children: [
                        productcontroller.firebaseVendorPendingOrderList.isEmpty
                            ? Text(
                                "No Pending Orders Found",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.r,
                                  fontWeight: FontWeight.bold,
                                ),
                              ).paddingOnly(top: 0.35.sh)
                            : ListView.builder(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.r, horizontal: 15.r),
                                shrinkWrap: true,
                                itemCount: productcontroller
                                    .firebaseVendorPendingOrderList.length,
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
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
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
                                                  imageUrl: productcontroller
                                                      .firebaseVendorPendingOrderList[
                                                          index]
                                                      .orderedProducts!
                                                      .img
                                                      .toString(),
                                                  progressIndicatorBuilder: (context,
                                                          url,
                                                          downloadProgress) =>
                                                      CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress,
                                                    color: Colors.red.shade600,
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ).paddingOnly(
                                                bottom: 10.r, top: 10.r),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  productcontroller
                                                      .firebaseVendorPendingOrderList[
                                                          index]
                                                      .orderedProducts!
                                                      .title,
                                                  style: TextStyle(
                                                    fontSize: 26.r,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Order #",
                                                      style: TextStyle(
                                                        fontSize: 20.r,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      productcontroller
                                                          .firebaseVendorPendingOrderList[
                                                              index]
                                                          .orderID
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 18.r,
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
                                                        fontSize: 20.r,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      productcontroller
                                                          .firebaseVendorPendingOrderList[
                                                              index]
                                                          .orderTimeStamp
                                                          .toString()
                                                          .substring(0, 10),
                                                      style: TextStyle(
                                                        fontSize: 18.r,
                                                        // fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ).paddingSymmetric(
                                                horizontal: 15.r,
                                                vertical: 10.r),
                                            Row(
                                              children: [
                                                Text(
                                                  "Amount ",
                                                  style: TextStyle(
                                                    fontSize: 20.r,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "\$${productcontroller.firebaseVendorPendingOrderList[index].totalPrice.toString()}",
                                                  style: TextStyle(
                                                    fontSize: 18.r,
                                                    // fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ).paddingOnly(
                                                bottom: 10.r, top: 10.r),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: InkWell(
                                            onTap: () {
                                              FirebaseServices()
                                                  .changeOrderStatusToAccepted(
                                                productcontroller
                                                    .firebaseVendorPendingOrderList[
                                                        index]
                                                    .orderID
                                                    .toString(),
                                              );
                                            },
                                            child: Container(
                                              height: 0.05.sh,
                                              width: 0.3.sw,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                    20.r,
                                                  ),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.mainColor
                                                        .withOpacity(0.2),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Accept",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.r,
                                                    color: AppColors.mainColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ).paddingOnly(right: 20.r),
                                        25.h.verticalSpace,
                                      ],
                                    ),
                                  );
                                })
                      ],
                    ),
                    // Content for 'Accepted Orders' tab
                    Column(
                      children: [
                        productcontroller
                                .firebaseVendorAcceptedOrderList.isEmpty
                            ? Text(
                                "No Accepted Orders Found",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.r,
                                  fontWeight: FontWeight.bold,
                                ),
                              ).paddingOnly(top: 0.35.sh)
                            : ListView.builder(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.r, horizontal: 15.r),
                                shrinkWrap: true,
                                itemCount: productcontroller
                                    .firebaseVendorAcceptedOrderList.length,
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
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
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
                                                  imageUrl: productcontroller
                                                      .firebaseVendorAcceptedOrderList[
                                                          index]
                                                      .orderedProducts!
                                                      .img
                                                      .toString(),
                                                  progressIndicatorBuilder: (context,
                                                          url,
                                                          downloadProgress) =>
                                                      CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress,
                                                    color: Colors.red.shade600,
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ).paddingOnly(
                                                bottom: 10.r, top: 10.r),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  productcontroller
                                                      .firebaseVendorAcceptedOrderList[
                                                          index]
                                                      .orderedProducts!
                                                      .title,
                                                  style: TextStyle(
                                                    fontSize: 26.r,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Order #",
                                                      style: TextStyle(
                                                        fontSize: 20.r,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      productcontroller
                                                          .firebaseVendorAcceptedOrderList[
                                                              index]
                                                          .orderID
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 18.r,
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
                                                        fontSize: 20.r,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      productcontroller
                                                          .firebaseVendorAcceptedOrderList[
                                                              index]
                                                          .orderTimeStamp
                                                          .toString()
                                                          .substring(0, 10),
                                                      style: TextStyle(
                                                        fontSize: 18.r,
                                                        // fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ).paddingSymmetric(
                                                horizontal: 15.r,
                                                vertical: 10.r),
                                            Row(
                                              children: [
                                                Text(
                                                  "Amount ",
                                                  style: TextStyle(
                                                    fontSize: 20.r,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "\$${productcontroller.firebaseVendorAcceptedOrderList[index].totalPrice.toString()}",
                                                  style: TextStyle(
                                                    fontSize: 18.r,
                                                    // fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ).paddingOnly(
                                                bottom: 10.r, top: 10.r),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: Colors.green,
                                              size: 24.r,
                                            ),
                                            Text(
                                              "Order Accepted",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.r,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ).paddingOnly(right: 15.r,bottom: 10.r)
                                      ],
                                    ),
                                  );
                                })
                      ],
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
