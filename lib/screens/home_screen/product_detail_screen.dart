// ignore_for_file: deprecated_member_use, must_be_immutable

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebotzz/controllers/tradingcontroller.dart';
import 'package:ebotzz/core/utils/appColors.dart';
import 'package:ebotzz/core/utils/app_extension.dart';
import 'package:ebotzz/models/yourproduct.dart';
import 'package:ebotzz/utils/prompts.dart';
import 'package:ebotzz/widgets/customActionButton.dart';

import '../../services/currentItem.dart';
import '../../utils/imports.dart';
import '../../widgets/counter_button.dart';
import '../../widgets/trade_column.dart';
import '../bidsScreen.dart';
import '../tradeScreen.dart';

class DashboardProductDetailScreen extends StatelessWidget {
  final ProductModel products;
  TradingController tradingController = Get.put(TradingController());
  final ProductController productController = Get.put(ProductController());

  DashboardProductDetailScreen({Key? key, required this.products})
      : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: whiteColor,
      actions: [
        GetBuilder(
          init: ProductController(),
          builder: (controller) {
            return IconButton(
              splashRadius: 18.0,
              onPressed: () => controller.isFavoriteProduct(products),
              icon: products.isFavorite
                  ? const Icon(Icons.favorite, color: Colors.black)
                  : const Icon(Icons.favorite_border, color: Colors.black),
            );
          },
        )
      ],
      title: Text(products.title, style: h2Style),
    );
  }

  // Widget bottomBar() {
  //   ProductController controller = Get.put(ProductController());
  //   return Container(
  //     padding: const EdgeInsets.all(15),
  //     height: 90,
  //     child:Obx(() {
  //       return Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           const FittedBox(
  //             child: Text('Price',
  //                 style: TextStyle(
  //                     color: Colors.black45, fontWeight: FontWeight.bold)),
  //           ),
  //           const SizedBox(height: 5),
  //           FittedBox(child: Text("\$${productController.totalPrice.value}", style: h2Style))
  //         ],
  //       );}
  //     )
  //   ).fadeAnimation(1.3);
  // }

  Widget productImageSlider(double height) {
    ProductController controller = Get.put(ProductController());
    return Stack(
      children: [
        Center(
          child: Container(
            width: 310.w,
            height: 470.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  30.sp,
                ),
              ),
            ),
            // color: Colors.orange,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(
                12.sp,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          // height: height * 0.5,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20.sp,
                    ),
                  ),
                  child: CachedNetworkImage(
                    height: 270.h,
                    imageUrl: products.img,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                      value: downloadProgress.progress,
                      color: AppColors.mainColor,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                // Image.network(
                //   products.img,
                //   height: 270.h,
                // ),

                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        // tradingController.addYourTradingProduct(Yourtradingproduct(
                        //     product: products, statusid: 3, isApproved: false));
                        // Get.to(() => TradingOfferScreen());

                        Get.defaultDialog(
                          backgroundColor: Colors.grey.shade900,
                          titleStyle: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          title: "Choose item for trade",
                          // confirm: Container(color: Colors.orange,width: 50.w,height: 10,),
                          content: SizedBox(
                            // height: 600,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 550,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            // width: 0.5.sw,
                                            width:0.33.sw,

                                            height: 0.7.sh,
                                            child:
                                            ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: productController.firebaseProductList.length,
                                                shrinkWrap: true,
                                                itemBuilder: (context,index){
                                                  return Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 5, vertical: 5),
                                                    child: InkWell(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                          BorderRadius.all(
                                                            Radius.circular(
                                                              20,
                                                            ),
                                                          ),
                                                        ),
                                                        width: 110,
                                                        height: 120,
                                                        // color: Colors.pink,
                                                        child: Stack(
                                                          // crossAxisAlignment:
                                                          //     CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              width: 110,
                                                              height: 100,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                BorderRadius.all(
                                                                  Radius.circular(
                                                                    20.sp,
                                                                  ),
                                                                ),
                                                                child:
                                                                CachedNetworkImage(
                                                                  fit: BoxFit.fill,
                                                                  imageUrl: productController
                                                                      .firebaseProductList[index].productImage,
                                                                  progressIndicatorBuilder: (context,
                                                                      url,
                                                                      downloadProgress) =>
                                                                      CircularProgressIndicator(
                                                                          color: AppColors
                                                                              .mainColor,
                                                                          value: downloadProgress
                                                                              .progress),
                                                                  errorWidget: (context,
                                                                      url, error) =>
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
                                                                width: 30,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  horizontal: 5,
                                                                  vertical: 2,
                                                                ),
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: AppColors
                                                                      .mainColor,
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
                                                                child: Row(
                                                                  children: [
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        SizedBox(
                                                                          height: 25.h,
                                                                          width: 69,
                                                                          child: Text(
                                                                            productController
                                                                                .firebaseProductList[index].productName
                                                                                .toString(),
                                                                            overflow:
                                                                            TextOverflow
                                                                                .fade,
                                                                            style:
                                                                            TextStyle(
                                                                              fontSize:
                                                                              12.sp,
                                                                              color: Colors
                                                                                  .white,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        // Text(MainScreenItems.recentlyViewdItems[0]["name"].toString()),
                                                                        // Text(MainScreenItems
                                                                        //             .recentlyViewdItems[0]
                                                                        //         ["type"] ??
                                                                        //     "NaN".toString()),
                                                                        Text(
                                                                          "${productController
                                                                              .firebaseProductList[index].productPrice} USD",
                                                                          style:
                                                                          TextStyle(
                                                                            fontSize:
                                                                            13.sp,
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                            color: Colors
                                                                                .white,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    5.horizontalSpace,
                                                                    Container(
                                                                      height: 20,
                                                                      width: 20,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .black,
                                                                          shape: BoxShape
                                                                              .circle),
                                                                      child: Center(
                                                                        child:
                                                                        IconButton(
                                                                          padding:
                                                                          EdgeInsets
                                                                              .all(
                                                                              1),
                                                                          icon: Icon(
                                                                            Icons.add,
                                                                            color: Colors
                                                                                .white,
                                                                            size: 15.sp,
                                                                          ),
                                                                          onPressed:
                                                                              () {
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
                                                                                title:productController
                                                                                    .firebaseProductList[index].productName,
                                                                                description:
                                                                                productController
                                                                                    .firebaseProductList[index].productDescription,
                                                                                price: double.parse(productController
                                                                                    .firebaseProductList[index].productPrice),
                                                                                img: productController
                                                                                    .firebaseProductList[index].productImage);
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
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        var originalProduct = products;
                                                        var offeredProduct = ProductModel(
                                                            id: productController.totalData[index + 40]
                                                            ["id"],
                                                            title: productController
                                                                .firebaseProductList[index].productName
                                                                .toString(),
                                                            description:
                                                            productController
                                                                .firebaseProductList[index].productDescription,
                                                            price: double.parse(
                                                                productController
                                                                    .firebaseProductList[index].productPrice
                                                                ),
                                                            img: productController
                                                                .firebaseProductList[index].productImage);

                                                        Get.back();
                                                        Get.to(TradeScreen(
                                                          productOriginal:
                                                          originalProduct,
                                                          productOffered:
                                                          offeredProduct,
                                                        ));
                                                      },
                                                    ),
                                                  );
                                                }),
                                          ),
                                          // 10.horizontalSpace,
                                          Column(
                                            children: List.generate(4, (index) {
                                              return Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 5),
                                                child: InkWell(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(
                                                          20,
                                                        ),
                                                      ),
                                                    ),
                                                    width: 110,
                                                    height: 120,
                                                    // color: Colors.pink,
                                                    child: Stack(
                                                      // crossAxisAlignment:
                                                      //     CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(
                                                          width: 110,
                                                          height: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                              Radius.circular(
                                                                20.sp,
                                                              ),
                                                            ),
                                                            child:
                                                                CachedNetworkImage(
                                                              fit: BoxFit.fill,
                                                              imageUrl: productController
                                                                          .totalData[
                                                                      index + 40][
                                                                  "images"][0]["src"],
                                                              progressIndicatorBuilder: (context,
                                                                      url,
                                                                      downloadProgress) =>
                                                                  CircularProgressIndicator(
                                                                      color: AppColors
                                                                          .mainColor,
                                                                      value: downloadProgress
                                                                          .progress),
                                                              errorWidget: (context,
                                                                      url, error) =>
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
                                                            width: 30,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal: 5,
                                                              vertical: 2,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .mainColor,
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
                                                            child: Row(
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      height: 25.h,
                                                                      width: 69,
                                                                      child: Text(
                                                                        productController
                                                                            .totalData[
                                                                                index +
                                                                                    40]
                                                                                [
                                                                                "name"]
                                                                            .toString(),
                                                                        overflow:
                                                                            TextOverflow
                                                                                .fade,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12.sp,
                                                                          color: Colors
                                                                              .white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    // Text(MainScreenItems.recentlyViewdItems[0]["name"].toString()),
                                                                    // Text(MainScreenItems
                                                                    //             .recentlyViewdItems[0]
                                                                    //         ["type"] ??
                                                                    //     "NaN".toString()),
                                                                    Text(
                                                                      "${productController.totalData[index + 40]["price"]} USD",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            13.sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                5.horizontalSpace,
                                                                Container(
                                                                  height: 20,
                                                                  width: 20,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child: Center(
                                                                    child:
                                                                        IconButton(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .all(
                                                                                  1),
                                                                      icon: Icon(
                                                                        Icons.add,
                                                                        color: Colors
                                                                            .white,
                                                                        size: 15.sp,
                                                                      ),
                                                                      onPressed:
                                                                          () {
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
                                                                            description:
                                                                                prod[
                                                                                    "description"],
                                                                            price: double.parse(prod[
                                                                                "price"]),
                                                                            img: prod["images"][0]
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
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    var originalProduct = products;
                                                    var offeredProduct = ProductModel(
                                                        id: productController.totalData[index + 40]
                                                            ["id"],
                                                        title: productController
                                                            .totalData[index + 40]
                                                                ["name"]
                                                            .toString(),
                                                        description:
                                                            productController.totalData[index + 40]
                                                                ["description"],
                                                        price: double.parse(
                                                            productController.totalData[index + 40]
                                                                ["price"]),
                                                        img: productController.totalData[index + 40]
                                                            ["images"][0]["src"]);

                                                    Get.back();
                                                    Get.to(TradeScreen(
                                                      productOriginal:
                                                          originalProduct,
                                                      productOffered:
                                                          offeredProduct,
                                                    ));
                                                  },
                                                ),
                                              );
                                            }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: AppColors.mainColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                            20,
                                          ),
                                          topRight: Radius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            height: 35,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade700,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  15,
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Trade Now",
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.shopping_cart,
                                              color: Colors.white,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.home,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: const TradeColumn(
                        image: "assets/images/trade.svg",
                        name: "Trade",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(BidsScreen());
                      },
                      child: const TradeColumn(
                        image: "assets/images/bid.svg",
                        name: "Bid",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Prompts.makeAnOffer();
                      },
                      child: const TradeColumn(
                        image: "assets/images/eye.svg",
                        name: "Make Offer",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.addToCart(products);
                        productController.cartScreenTotal.value +=
                            productController.total.value;
                        var item = CurrentItem(
                            title: productController.total.value,
                            quantity: productController.quantity.value);
                        controller.cartScreenItems.add(item);

                        Get.to(CartScreen(
                          products: products,
                        ));
                      },
                      child: const TradeColumn(
                        image: "assets/images/buy.svg",
                        name: "Buy",
                      ),
                    ),
                    const TradeColumn(
                      image: "assets/images/heart.svg",
                      name: "Add",
                    ),
                  ],
                ),

                // SizedBox(height: 20.h,),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Obx(() {
                        return CounterButton(
                          label: controller.quantity.value,
                          onIncrementSelected: () =>
                              controller.calculateTotal(products),
                          onDecrementSelected: () =>
                              controller.calculateTotalDecremented(products),
                        );
                      }),
                    )
                  ],
                ).fadeAnimation(1.0)
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      // bottomNavigationBar: bottomBar(),
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productImageSlider(height),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        products.title,
                        style: TextStyle(
                            fontFamily: "Montserrat-VariableFont_wght.ttf",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        textAlign: TextAlign.end,
                      ).fadeAnimation(0.6),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products.description.removeAllWhitespace,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  ).fadeAnimation(0.8),
                  SizedBox(
                    height: 3.5.h,
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 3.5.h,
                  ),
                  Obx(() => Text(
                        "price : " +
                            productController.total.value.toStringAsFixed(2) +
                            " USD ",
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ).fadeAnimation(0.8)),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        backgroundColor: Colors.pink,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
