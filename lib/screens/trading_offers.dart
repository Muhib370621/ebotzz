// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, use_key_in_widget_constructors, must_be_immutable

import 'package:ebotzz/controllers/tradingcontroller.dart';
import 'package:ebotzz/models/yourproduct.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/statuscard.dart';

class TradingOfferScreen extends StatelessWidget {
  TradingController tradingController = Get.put(TradingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            CustomAppBar(),
            customHeading(heading: 'Trading Offers'),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: tradingController.yourtradingproducts.length,
                itemBuilder: (context, index) {
                  return TradingOffercard(
                    tradingstatus:
                        tradingController.yourtradingproducts[index].statusid,
                    isApproved:
                        tradingController.yourtradingproducts[index].isApproved,
                    yourtradingProdut:
                        tradingController.yourtradingproducts[index].product,
                  );
                })
          ],
        ),
      ),
    ));
  }
}

class TradingOffercard extends StatelessWidget {
  TradingController controller = Get.put(TradingController());
  ProductModel yourtradingProdut;
  int tradingstatus;
  bool isApproved;

  TradingOffercard(
      {required this.tradingstatus,
      required this.isApproved,
      required this.yourtradingProdut});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width.w,
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 0))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Your Product:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    yourtradingProdut.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    yourtradingProdut.price.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text('Offered Product:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 100.w,
                    child: SingleChildScrollView(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.tradingList.length,
                            itemBuilder: (context, index) {
                              return OfferedProductCard(
                                  product: controller.tradingList[index]);
                            })),
                  )
                ],
              ),
            ),
            StatusCard(
              statuscode: tradingstatus,
            ),
            Expanded(
              child: Column(
                children: [
                  tradingstatus == 1
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 5.h),
                                child: Icon(
                                  Icons.thumb_down,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      : tradingstatus == 2
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffFFC439),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 5.h),
                                    child: Icon(
                                      Icons.thumb_up,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : tradingstatus == 3
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 10.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xffFFC439),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                                vertical: 5.h),
                                            child: Icon(
                                              Icons.thumb_up,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                                vertical: 5.h),
                                            child: Icon(
                                              Icons.thumb_down,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Container()
                ],
              ),
            ),
          ],
        ));
  }
}

class OfferedProductCard extends StatelessWidget {
  OfferedProductCard({required this.product});
  late TradingProdut product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          product.product.title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500),
        ),
        Text(
          product.product.price.toString(),
          style: TextStyle(
              color: Colors.grey, fontSize: 12.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
