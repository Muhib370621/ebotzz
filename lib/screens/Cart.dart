// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore, must_be_immutable

import 'package:ebotzz/screens/checkoutNewScreen.dart';
import 'package:ebotzz/utils/imports.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/cart_list_view.dart';
import '../widgets/counter_button.dart';
import '../widgets/empty_widget.dart';
import 'createOrderScreen.dart';

class CartScreen extends StatelessWidget {
  final ProductModel? products;
  CartScreen({super.key,  this.products});
  ProductController controller = Get.put(ProductController());
  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0,
      title: const Text("Cart", style: h2Style),
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
      bottomNavigationBar: Obx(
        () {
          return BottomBar(
            priceLabel: "Total price",
            priceValue: "\$${controller.totalPrice.value.toStringAsFixed(2)}",
            buttonLabel: "Checkout",
            onTap: (){
              Get.to(()=> CheckOutNewScreen(product: products!));
            },
            // onTap: controller.totalPrice > 0 ? () {} : null,
          );
        },
      ),
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
              :  EmptyWidget(title: "Empty",);


        },
      ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.back();
            },
            backgroundColor: Colors.pink,
            child: const Icon(Icons.arrow_back),
          ),
    ));
  }
}
