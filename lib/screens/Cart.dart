// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore, must_be_immutable

import 'package:ebotzz/core/utils/appColors.dart';
import 'package:ebotzz/screens/checkoutNewScreen.dart';
import 'package:ebotzz/utils/imports.dart';

import '../widgets/cart_list_view.dart';
import '../widgets/counter_button.dart';
import '../widgets/empty_widget.dart';

class CartScreen extends StatelessWidget {
  final ProductModel? products;
  final int index;

  CartScreen({super.key, this.products, required this.index});

  ProductController controller = Get.put(ProductController());

  PreferredSizeWidget _appBar() {
    return AppBar(
      // leading: IconButton(
      //   onPressed: () {
      //     Get.back();
      //   },
      //   icon: Icon(
      //     Icons.arrow_back,
      //     color: Colors.black,
      //   ),
      // ),
      backgroundColor: whiteColor,
      elevation: 0,
      title: const Text("Swapster Cart", style: h2Style),
      actions: [
        IconButton(
          splashRadius: 20.0,
          onPressed: controller.clearCart,
          icon: const Icon(
            Icons.delete,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _appBar(),
      bottomNavigationBar:

           Padding(
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
                    Get.to(() => CheckOutNewScreen(product: products?? ProductModel(id: 1, title: "Rolex"
                        , description: "good", price: 22.2, img: ""), index: index,));
                  },
                  child: Text(
                    "CHECKOUT",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp
                    ),
                  )),
            ),
          )

          // return BottomBar(
          //   priceLabel: "Total price",
          //   priceValue:
          //       "\$${controller.cartScreenTotal.value.toStringAsFixed(2)}",
          //   buttonLabel: "Checkout",
          //   onTap: () {
          //     Get.to(() => CheckOutNewScreen(product: products!));
          //   },
          //   // onTap: controller.totalPrice > 0 ? () {} : null,
          // );

      ,
      body: GetBuilder(
        init: ProductController(),
        builder: (controller) {
          return controller.cartProduct.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: CartListView(
                      cartProduct: controller.cartProduct,
                      counterButton: (product) {
                        return CounterButton(
                            orientation: Axis.vertical,
                            onIncrementSelected: () =>
                                controller.increaseItem(product),
                            onDecrementSelected: () =>
                                controller.decreaseItem(product),
                            label: product.quantity);
                      }),
                )
              : EmptyWidget(
                  title: "Empty",
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
          controller.quantity.value = 1;
        },
        backgroundColor: AppColors.mainColor,
        child: const Icon(Icons.arrow_back),
      ),
    ));
  }
}
