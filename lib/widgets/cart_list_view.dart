// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'package:ebotzz/core/app_extension.dart';

import '../utils/imports.dart';

class CartListView extends StatelessWidget {
  ProductController controller = Get.put(ProductController());

  CartListView(
      {Key? key, required this.counterButton, required this.cartProduct})
      : super(key: key);

  final Widget Function(ProductModel product) counterButton;
  final List<ProductModel> cartProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: cartProduct.length,
        itemBuilder: (_, index) {
          ProductModel products = cartProduct[index];
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      products.img,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(products.title.addOverFlow, style: h4Style),
                    const SizedBox(height: 5),
                    Text("\$${products.price}", style: h2Style),
                    const SizedBox(height: 5),
                  ],
                ),
                // Spacer(),
                counterButton(products)
              ],
            ).fadeAnimation(0.4 * index),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(padding: EdgeInsets.only(bottom: 15));
        },
      ),
    );
  }
}
