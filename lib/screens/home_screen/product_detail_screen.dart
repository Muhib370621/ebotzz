// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:ebotzz/controllers/tradingcontroller.dart';
import 'package:ebotzz/core/app_extension.dart';
import 'package:ebotzz/models/yourproduct.dart';
import 'package:ebotzz/widgets/customActionButton.dart';

import '../../utils/imports.dart';
import '../../widgets/counter_button.dart';
import '../../widgets/trade_column.dart';

class DashboardProductDetailScreen extends StatelessWidget {

  final ProductModel products;
  TradingController tradingController = Get.put(TradingController());
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

  Widget bottomBar() {
    ProductController controller = Get.put(ProductController());

    return Container(
      padding: const EdgeInsets.all(15),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FittedBox(
                child: Text('Price',
                    style: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 5),
              FittedBox(child: Text("\$${products.price}", style: h2Style))
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: blackColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              tradingController.addYourTradingProduct(Yourtradingproduct(
                  product: products, statusid: 3, isApproved: false));
              Get.to(() => TradingOfferScreen());
            },
            child: const Text("Trade"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: blackColor,
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              controller.addToCart(products);
            },
            child: const Text("Add to cart"),
          )
        ],
      ),
    ).fadeAnimation(1.3);
  }

  Widget productImageSlider(double height) {
    ProductController controller = Get.put(ProductController());
    return Container(
      padding: const EdgeInsets.all(10),
      // height: height * 0.5,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(products.img),

            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Expanded(
                    child: GetBuilder(
                      init: ProductController(),
                      builder: (controller) {
                        return CounterButton(
                          label: products.quantity,
                          onIncrementSelected: () =>
                              controller.increaseItem(products),
                          onDecrementSelected: () =>
                              controller.decreaseItem(products),
                        );
                      },
                    ))
              ],
            ).fadeAnimation(1.0),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    tradingController.addYourTradingProduct(Yourtradingproduct(
                        product: products, statusid: 3, isApproved: false));
                    Get.to(() => TradingOfferScreen());
                  },
                  child: const TradeColumn(
                    image: "assets/images/trade.svg",
                    name: "Trade",
                  ),
                ),
                const TradeColumn(
                  image: "assets/images/bid.svg",
                  name: "Bid",
                ),
                const TradeColumn(
                  image: "assets/images/eye.svg",
                  name: "Watch",
                ),
                InkWell(
                  onTap: (){
                    controller.addToCart(products);
                    Get.to(CartScreen(products: products,));
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // bottomNavigationBar: bottomBar(),
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productImageSlider(height),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10,left: 10,right: 10),
                child: Column(
                  children: [
                    Center(
                      child: Text(products.title,
                              style: h2Style, textAlign: TextAlign.end)
                          .fadeAnimation(0.6),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(products.description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                    style:  TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.bold,fontSize: 16.sp),)
                      .fadeAnimation(0.8),
                  SizedBox(height: 8.h,),
                  Text("price : "+products.price.toString()+" USD ",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style:  TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.bold,fontSize: 20.sp),)
                      .fadeAnimation(0.8),
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
