import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebotzz/controllers/signUpController.dart';
import 'package:ebotzz/core/utils/appColors.dart';
import 'package:ebotzz/models/productApiModel.dart' as prodAPI;
import 'package:ebotzz/services/currentItem.dart';
import 'package:ebotzz/services/mainScreenItems.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';

import '../tradeScreen.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    TextEditingController controller4 = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Obx(() {
        return SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: productController.isLoading.value == true
                ? Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.mainColor,
                      ),
                      // Lottie.asset(
                      //   "assets/json/loadingAnimation.json",
                      // ),
                    ),
                  )
                : productController.totalData.isEmpty
                    ? Center(
                        child: Lottie.asset(
                          "assets/json/noData.json",
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // CustomInputField(controller: controller,label: "Search on ebotzz",),
                          const CustomAppBar(),
                          15.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  height: 45.h,
                                  child: CustomInputField(
                                    controller: controller,
                                    label: "Search for anything",
                                    suffixIcon: Icon(Icons.search),
                                  ),
                                ),
                              ),
                              Container(
                                width: 95.w,
                                height: 45.h,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20)),
                                child: InkWell(
                                    onTap: () {
                                      Get.defaultDialog(
                                        title: "Categories",
                                        content: SizedBox(
                                          height: 480.h,
                                          child: ListView.builder(
                                            physics: BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: productController
                                                .totalCategoryData.length,
                                            itemBuilder: (context, index) {
                                              return SingleChildScrollView(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      height: 45.h,
                                                      width: 290.w,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.black12,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(
                                                            15,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Text(productController
                                                              .totalCategoryData[
                                                          index]["name"]),
                                                    ),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Center(
                                      child: Text(
                                        "Categories",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                              ),
                              10.horizontalSpace
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.grey.shade900,
                            child: Column(
                              children: [
                                15.verticalSpace,
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 24,
                                    ),
                                    Text(
                                      "Your Recently Viewed Items",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        productController.total.value =
                                            double.parse(productController
                                                .totalData[0]["price"]);
                                        Get.to(DashboardProductDetailScreen(
                                            products: ProductModel(
                                          id: productController.totalData[0]
                                              ["id"],
                                          title: productController.totalData[0]
                                              ["name"],
                                          description: productController
                                              .totalData[0]["description"],
                                          price: double.parse(productController
                                              .totalData[0]["price"]),
                                          quantity: 1,
                                          img: productController.totalData[0]
                                              ["images"][0]["src"],
                                        )));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              20,
                                            ),
                                          ),
                                        ),
                                        width: 160,
                                        height: 200,
                                        // color: Colors.pink,
                                        child: Stack(
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 160,
                                              height: 140,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                    20.sp,
                                                  ),
                                                ),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.fill,
                                                  imageUrl: productController
                                                          .totalData[0]
                                                      ["images"][0]["src"],
                                                  progressIndicatorBuilder: (context,
                                                          url,
                                                          downloadProgress) =>
                                                      CircularProgressIndicator(
                                                          color: AppColors
                                                              .mainColor,
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                            // Image(
                                            //   image: NetworkImage(
                                            //      ),
                                            //   fit: BoxFit.cover,
                                            // )),
                                            Positioned(
                                              // top: 0,
                                              bottom: 0,
                                              right: 0,
                                              left: 0,
                                              child: Container(
                                                // height: 80,
                                                width: 90,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 5,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.mainColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                      15,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(
                                                      15,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 40.h,
                                                          width: 100,
                                                          child: Text(
                                                            productController
                                                                .totalData[0]
                                                                    ["name"]
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                            style: TextStyle(
                                                              fontSize: 15.sp,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                        // Text(MainScreenItems.recentlyViewdItems[0]["name"].toString()),
                                                        // Text(MainScreenItems
                                                        //             .recentlyViewdItems[0]
                                                        //         ["type"] ??
                                                        //     "NaN".toString()),
                                                        Text(
                                                          "${productController.totalData[0]["price"]} USD",
                                                          style: TextStyle(
                                                            fontSize: 20.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    5.horizontalSpace,
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors.black,
                                                          shape:
                                                              BoxShape.circle),
                                                      child: Center(
                                                        child: IconButton(
                                                          padding:
                                                              EdgeInsets.all(1),
                                                          icon: Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                          ),
                                                          onPressed: () {
                                                            ProductController
                                                                controller =
                                                                Get.put(
                                                                    ProductController());
                                                            var prod =
                                                                productController
                                                                    .totalData[0];
                                                            log("=============? " +
                                                                prod.toString());
                                                            var productModel = ProductModel(
                                                                id: (prod[
                                                                    "id"]),
                                                                title: prod[
                                                                    "name"],
                                                                description: prod[
                                                                    "description"],
                                                                price: double
                                                                    .parse(prod[
                                                                        "price"]),
                                                                img: prod[
                                                                        "images"]
                                                                    [0]["src"]);
                                                            controller.addToCart(
                                                                productModel);
                                                            productController
                                                                    .cartScreenTotal
                                                                    .value +=
                                                                productController
                                                                    .total
                                                                    .value;
                                                            var item = CurrentItem(
                                                                title:
                                                                    productController
                                                                        .total
                                                                        .value,
                                                                quantity:
                                                                    productController
                                                                        .quantity
                                                                        .value);
                                                            controller
                                                                .cartScreenItems
                                                                .add(item);

                                                            Get.to(CartScreen(
                                                              products:
                                                                  productModel,
                                                            ));
                                                          },
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        productController.total.value =
                                            double.parse(productController
                                                .totalData[1]["price"]);
                                        Get.to(
                                          DashboardProductDetailScreen(
                                            products: ProductModel(
                                              id: productController.totalData[1]
                                                  ["id"],
                                              title: productController
                                                  .totalData[1]["name"],
                                              description: productController
                                                  .totalData[1]["description"],
                                              price: double.parse(
                                                  productController.totalData[1]
                                                      ["price"]),
                                              quantity: 1,
                                              img:
                                                  productController.totalData[1]
                                                      ["images"][0]["src"],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              20,
                                            ),
                                          ),
                                        ),
                                        width: 160,
                                        // height: 210,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 160,
                                              height: 125,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                    20.sp,
                                                  ),
                                                ),
                                                child: Container(
                                                  child: CachedNetworkImage(
                                                    imageUrl: productController
                                                            .totalData[1]
                                                        ["images"][0]["src"],
                                                    progressIndicatorBuilder: (context,
                                                            url,
                                                            downloadProgress) =>
                                                        CircularProgressIndicator(
                                                            color: AppColors
                                                                .mainColor,
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // top: 0,
                                              bottom: 1,
                                              right: 0,
                                              left: 0,
                                              child: Container(
                                                // height: 80,
                                                width: 160,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 5,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.mainColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                      15,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(
                                                      15,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 40.h,
                                                          width: 100,
                                                          child: Text(
                                                            productController
                                                                .totalData[1]
                                                                    ["name"]
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                            style: TextStyle(
                                                              fontSize: 15.sp,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                        // Text(MainScreenItems.recentlyViewdItems[0]["name"].toString()),
                                                        // Text(MainScreenItems
                                                        //             .recentlyViewdItems[0]
                                                        //         ["type"] ??
                                                        //     "NaN".toString()),
                                                        Text(
                                                          "${productController.totalData[1]["price"]} USD",
                                                          style: TextStyle(
                                                            fontSize: 20.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    5.horizontalSpace,
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors.black,
                                                          shape:
                                                              BoxShape.circle),
                                                      child: Center(
                                                        child: IconButton(
                                                          padding:
                                                              EdgeInsets.all(1),
                                                          icon: Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                          ),
                                                          onPressed: () {
                                                            ProductController
                                                                controller =
                                                                Get.put(
                                                                    ProductController());
                                                            var prod =
                                                                productController
                                                                    .totalData[1];
                                                            log("=============? " +
                                                                prod.toString());
                                                            var productModel = ProductModel(
                                                                id: (prod[
                                                                    "id"]),
                                                                title: prod[
                                                                    "name"],
                                                                description: prod[
                                                                    "description"],
                                                                price: double
                                                                    .parse(prod[
                                                                        "price"]),
                                                                img: prod[
                                                                        "images"]
                                                                    [0]["src"]);
                                                            controller.addToCart(
                                                                productModel);
                                                            productController
                                                                    .cartScreenTotal
                                                                    .value +=
                                                                productController
                                                                    .total
                                                                    .value;
                                                            var item = CurrentItem(
                                                                title:
                                                                    productController
                                                                        .total
                                                                        .value,
                                                                quantity:
                                                                    productController
                                                                        .quantity
                                                                        .value);
                                                            controller
                                                                .cartScreenItems
                                                                .add(item);

                                                            Get.to(CartScreen(
                                                              products:
                                                                  productModel,
                                                            ));
                                                          },
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                            // Padding(
                                            //   padding:
                                            //       const EdgeInsets.only(left: 8.0),
                                            //   child: SizedBox(
                                            //     width: 160,
                                            //     child: Column(
                                            //       crossAxisAlignment:
                                            //           CrossAxisAlignment.start,
                                            //       children: [
                                            //         SizedBox(
                                            //           height: 40.h,
                                            //           child: Text(
                                            //             productController.totalData[1]
                                            //                     ["name"]
                                            //                 .toString(),
                                            //             overflow: TextOverflow.fade,
                                            //           ),
                                            //         ),
                                            //         // Text(MainScreenItems.recentlyViewdItems[0]["name"].toString()),
                                            //         Text(MainScreenItems
                                            //                     .recentlyViewdItems[1]
                                            //                 ["type"] ??
                                            //             "NaN".toString()),
                                            //         Text(
                                            //           "${productController.totalData[1]["price"]} USD",
                                            //           style: TextStyle(
                                            //               fontSize: 20.sp,
                                            //               fontWeight:
                                            //                   FontWeight.bold),
                                            //         ),
                                            //       ],
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Container(
                                    //   color: Colors.white,
                                    //   width: 160,
                                    //   height: 250,
                                    //   // color: Colors.pink,
                                    //   child: InkWell(
                                    //     child: Column(
                                    //       crossAxisAlignment:
                                    //           CrossAxisAlignment.start,
                                    //       children: [
                                    //         SizedBox(
                                    //             width: 120,
                                    //             height: 140,
                                    //             child: Image.network(
                                    //               productController.totalData[1]
                                    //                   ["images"][0]["src"],
                                    //               fit: BoxFit.cover,
                                    //             )),
                                    //         Text(productController.totalData[1]
                                    //                 ["name"]
                                    //             .toString()),
                                    //         Text(productController.totalData[1]
                                    //                 ["type"]
                                    //             .toString()),
                                    //         Text(
                                    //           productController.totalData[1]["price"]
                                    //                   .toString() +
                                    //               " USD",
                                    //           style: TextStyle(
                                    //               fontSize: 20.sp,
                                    //               fontWeight: FontWeight.bold),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //     onTap: () {
                                    //       productController.total.value =
                                    //           double.parse(productController
                                    //               .totalData[1]["price"]);
                                    //       Get.to(DashboardProductDetailScreen(
                                    //           products: ProductModel(
                                    //         id: productController.totalData[1]["id"],
                                    //         title: productController.totalData[1]
                                    //             ["name"],
                                    //         description: productController
                                    //             .totalData[0]["description"],
                                    //         price: double.parse(productController
                                    //             .totalData[1]["price"]),
                                    //         quantity: 1,
                                    //         img: productController.totalData[1]
                                    //             ["images"][0]["src"],
                                    //       )));
                                    //     },
                                    //   ),
                                    // ),
                                  ],
                                ),
                                20.verticalSpace
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: 30.h,
                          // ),
                          Container(
                            decoration:
                                BoxDecoration(color: Colors.grey.shade900),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                10.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    "Hot Deals",
                                    style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Recommended for you",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(10, (index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: InkWell(
                                          child: Container(
                                            width: 221.w,
                                            // height: 290,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              // border:
                                              //     Border.all(color: Colors.grey)
                                            ),
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 150,
                                                      width: 200,
                                                      // decoration: BoxDecoration(
                                                      //
                                                      // ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                  15,
                                                                ),
                                                                topRight: Radius
                                                                    .circular(
                                                                  15,
                                                                )),
                                                        child: Image(
                                                          image: NetworkImage(
                                                              productController
                                                                          .totalData[3]
                                                                      ["images"]
                                                                  [0]["src"]),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 100,
                                                      width: 218.w,
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            AppColors.mainColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  15),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  15),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 25,
                                                                width: 140,
                                                                child: Text(
                                                                  productController
                                                                      .totalData[
                                                                          index +
                                                                              2]
                                                                          [
                                                                          "name"]
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18.sp,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                  productController
                                                                      .totalData[
                                                                          index + 2]
                                                                          [
                                                                          "type"]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.sp,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Text(
                                                                  "price : ${productController.totalData[index + 2]["price"]}" +
                                                                      " USD ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18.sp,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900)),
                                                            ],
                                                          ),
                                                          Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    shape: BoxShape
                                                                        .circle),
                                                            child: Center(
                                                              child: IconButton(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(1),
                                                                icon: Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                onPressed: () {
                                                                  ProductController
                                                                      controller =
                                                                      Get.put(
                                                                          ProductController());
                                                                  var prod =
                                                                      productController
                                                                              .totalData[
                                                                          index +
                                                                              2];
                                                                  log("=============? " +
                                                                      prod.toString());
                                                                  var productModel = ProductModel(
                                                                      id: (prod[
                                                                          "id"]),
                                                                      title: prod[
                                                                          "name"],
                                                                      description:
                                                                          prod[
                                                                              "description"],
                                                                      price: double.parse(
                                                                          prod[
                                                                              "price"]),
                                                                      img: prod["images"]
                                                                              [
                                                                              0]
                                                                          [
                                                                          "src"]);
                                                                  controller
                                                                      .addToCart(
                                                                          productModel);
                                                                  productController
                                                                          .cartScreenTotal
                                                                          .value +=
                                                                      productController
                                                                          .total
                                                                          .value;
                                                                  var item = CurrentItem(
                                                                      title: productController
                                                                          .total
                                                                          .value,
                                                                      quantity: productController
                                                                          .quantity
                                                                          .value);
                                                                  controller
                                                                      .cartScreenItems
                                                                      .add(
                                                                          item);

                                                                  Get.to(
                                                                      CartScreen(
                                                                    products:
                                                                        productModel,
                                                                  ));
                                                                },
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            productController.total.value =
                                                double.parse(productController
                                                        .totalData[index + 2]
                                                    ["price"]);
                                            Get.to(DashboardProductDetailScreen(
                                                products: ProductModel(
                                              id: productController
                                                  .totalData[index + 2]["id"],
                                              title: productController
                                                  .totalData[index + 2]["name"],
                                              description: productController
                                                      .totalData[index + 2]
                                                  ["description"],
                                              price: double.parse(
                                                  productController
                                                          .totalData[index + 2]
                                                      ["price"]),
                                              quantity: 1,
                                              img: productController
                                                      .totalData[index + 2]
                                                  ["images"][0]["src"],
                                            )));
                                          },
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                20.verticalSpace,
                              ],
                            ),
                          ),

                          // const SizedBox(
                          //   height: 30,
                          // ),
                          Container(
                            color: Colors.grey.shade300,
                            height: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Hot Trades",
                                  style: TextStyle(fontSize: 24.sp),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Divider(
                                        thickness: 2,
                                        color: Colors.black,
                                      )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.handyman)),
                                      Expanded(
                                          child: Divider(
                                        thickness: 2,
                                        color: Colors.black,
                                      )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: List.generate(5, (index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        child: InkWell(
                                          child: Container(
                                            // width: 200,
                                            height: 280,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              // border: Border.all(
                                              //     color: Colors.grey)
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 150,
                                                  width: 200,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        20.sp,
                                                      ),
                                                      topRight: Radius.circular(
                                                        20.sp,
                                                      ),
                                                    ),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl: productController
                                                                  .totalData[
                                                              index + 40]
                                                          ["images"][0]["src"],
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              CircularProgressIndicator(
                                                        value: downloadProgress
                                                            .progress,
                                                        color:
                                                            AppColors.mainColor,
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.mainColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(
                                                        15,
                                                      ),
                                                      bottomRight:
                                                          Radius.circular(
                                                        15,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 190.w,
                                                        child: Text(
                                                          productController
                                                              .totalData[index +
                                                                  40]["name"]
                                                              .toString(),
                                                          overflow:
                                                              TextOverflow.fade,
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Text(
                                                          productController
                                                              .totalData[index +
                                                                  40]["type"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text(
                                                          "price : ${productController.totalData[index + 40]["price"]}" +
                                                              " USD ",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            productController.total.value =
                                                double.parse(productController
                                                        .totalData[index + 40]
                                                    ["price"]);

                                            Get.to(DashboardProductDetailScreen(
                                                products: ProductModel(
                                              id: productController
                                                  .totalData[index + 40]["id"],
                                              title: productController
                                                      .totalData[index + 40]
                                                  ["name"],
                                              description: productController
                                                      .totalData[index + 40]
                                                  ["description"],
                                              price: double.parse(
                                                  productController
                                                          .totalData[index + 40]
                                                      ["price"]),
                                              quantity: 1,
                                              img: productController
                                                      .totalData[index + 40]
                                                  ["images"][0]["src"],
                                            )));
                                          },
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: List.generate(5, (index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        child: InkWell(
                                          child: Container(
                                            width: 200,
                                            height: 280,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              // border: Border.all(
                                              //     color: Colors.grey)
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 150,
                                                  width: 200,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        20.sp,
                                                      ),
                                                      topRight: Radius.circular(
                                                        20.sp,
                                                      ),
                                                    ),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl: productController
                                                                  .totalData[
                                                              index + 45]
                                                          ["images"][0]["src"],
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              CircularProgressIndicator(
                                                        value: downloadProgress
                                                            .progress,
                                                        color:
                                                            AppColors.mainColor,
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.mainColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(
                                                        15,
                                                      ),
                                                      bottomRight:
                                                          Radius.circular(
                                                        15,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 190.w,
                                                        height: 70.h,
                                                        child: Text(
                                                          productController
                                                              .totalData[index +
                                                                  45]["name"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          overflow:
                                                              TextOverflow.fade,
                                                        ),
                                                      ),
                                                      Text(
                                                          productController
                                                              .totalData[index +
                                                                  45]["type"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text(
                                                          "price : ${productController.totalData[index + 45]["price"]}" +
                                                              " USD ",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            productController.total.value =
                                                double.parse(productController
                                                        .totalData[index + 45]
                                                    ["price"]);
                                            Get.to(DashboardProductDetailScreen(
                                                products: ProductModel(
                                              id: productController
                                                  .totalData[index + 45]["id"],
                                              title: productController
                                                      .totalData[index + 45]
                                                  ["name"],
                                              description: productController
                                                      .totalData[index + 45]
                                                  ["description"],
                                              price: double.parse(
                                                  productController
                                                          .totalData[index + 45]
                                                      ["price"]),
                                              quantity: 1,
                                              img: productController
                                                      .totalData[index + 45]
                                                  ["images"][0]["src"],
                                            )));
                                          },
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 30.h,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Daily Deals",
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                          SizedBox(
                            height: 10.h,
                          ),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(10, (index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    width: 200,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      // border: Border.all(color: Colors.grey)
                                    ),
                                    child: InkWell(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 150,
                                            width: 182,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                  20.sp,
                                                ),
                                                topRight: Radius.circular(
                                                  20.sp,
                                                ),
                                              ),

                                              child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl:productController
                                                  .totalData[index + 40]
                                              ["images"][0]["src"],
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                  downloadProgress) =>
                                                  CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress,
                                                    color:
                                                    AppColors.mainColor,
                                                  ),
                                              errorWidget: (context,
                                                  url, error) =>
                                                  Icon(Icons.error),
                                            ),
                                            ),
                                          ),
                                          Container(

                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: AppColors.mainColor,
                                              borderRadius:
                                              BorderRadius.only(
                                                bottomLeft:
                                                Radius.circular(
                                                  15,
                                                ),
                                                bottomRight:
                                                Radius.circular(
                                                  15,
                                                ),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 25,
                                                  child: Text(
                                                    productController
                                                        .totalData[index + 40]
                                                            ["name"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Text(
                                                    productController
                                                        .totalData[index + 40]
                                                            ["type"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    "price : ${productController.totalData[index + 40]["price"]}" +
                                                        " USD ",
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        productController.total.value =
                                            double.parse(productController
                                                    .totalData[index + 40]
                                                ["price"]);
                                        print(index);
                                        Get.to(DashboardProductDetailScreen(
                                            products: ProductModel(
                                          id: productController
                                              .totalData[index + 40]["id"],
                                          title: productController
                                              .totalData[index + 40]["name"],
                                          description: productController
                                                  .totalData[index + 40]
                                              ["description"],
                                          price: double.parse(productController
                                              .totalData[index + 40]["price"]),
                                          quantity: 1,
                                          img: productController
                                                  .totalData[index + 40]
                                              ["images"][0]["src"],
                                        )));
                                      },
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),

                          SizedBox(
                            height: 40.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              "Explore Now",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Column(
                            children: List.generate(4, (index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 10),
                                child: Container(
                                  width: 500,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        2.sp,
                                      ),
                                    ),
                                    color: index % 2 == 0
                                        ? Colors.orange
                                        : index % 3 == 0
                                            ? Colors.purple
                                            : Colors.red,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Electronics",
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "Trade or Buy Electronics",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 200,
                                        height: 100,
                                        child: Image(
                                            image: NetworkImage(
                                                "https://static.vecteezy.com/system/resources/previews/014/033/452/original/wireless-headphones-front-view-white-icon-on-a-transparent-background-3d-rendering-png.png")),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),

                          SizedBox(
                            height: 50.h,
                          ),
                          Column(
                            children: [
                              Text(
                                "Need help? Contact us ",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 300.h,
                                width: 500.h,
                                child: Image.asset("assets/images/us.png"),
                              ),
                              Container(
                                width: 400.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    CustomInputField(
                                      controller: controller2,
                                      label: "First name",
                                    ),
                                    10.verticalSpace,
                                    CustomInputField(
                                      controller: controller3,
                                      label: "Last name",
                                    ),
                                    10.verticalSpace,
                                    CustomInputField(
                                      controller: controller4,
                                      label: "Email aAddress",
                                    ),
                                    10.verticalSpace,
                                    CustomInputField(
                                      controller: controller4,
                                      label: "Your Message",
                                    ),
                                    10.verticalSpace,
                                    CustomActionButton(
                                      buttonText: "Submit",
                                      isIcon: false,
                                      onTap: () {
                                        Get.snackbar("Successfully",
                                            "Successfully Submitted",
                                            colorText: Colors.white,
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor: Colors.green,
                                            icon: const Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            ));
                                      },
                                      isLoading: false,
                                    ),
                                    20.verticalSpace,
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
          ),
        );
      }),
    );
  }
}
