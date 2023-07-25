// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:ebotzz/utils/imports.dart';

import '../widgets/empty_widget.dart';
import '../widgets/product_list_view.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});
  ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: const Text("Favorites", style: h2Style),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              controller.favoriteProductList.isNotEmpty
                  ? ProductListView(
                      isHorizontal: false,
                      productList: controller.favoriteProductList,
                    )
                  : const EmptyWidget(
                      type: EmptyWidgetType.favorite, title: "Empty")
            ],
          ),
        ),
      ),
    ));
  }
}
