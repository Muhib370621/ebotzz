// ignore_for_file: avoid_print

import 'package:ebotzz/utils/imports.dart';

class ProductController extends GetxController {
  RxList<ProductModel> cartProduct = <ProductModel>[].obs;
  RxList<ProductModel> favoriteProductList = <ProductModel>[].obs;
  RxList<ProductModel> allproduct = <ProductModel>[].obs;
  RxList<ProductModel> tradingproduct = <ProductModel>[].obs;
  RxDouble totalPrice = 0.0.obs;

  isFavoriteProduct(ProductModel product) {
    product.isFavorite = !product.isFavorite;
    update();
    if (product.isFavorite) {
      favoriteProductList.add(product);
    }
    if (!product.isFavorite) {
      favoriteProductList.removeWhere((element) => element == product);
    }
  }

  void increaseItem(ProductModel product) {
    product.quantity++;

    update();
    calculateTotalPrice();
  }

  void decreaseItem(ProductModel product) {
    if (product.quantity > 1) {
      product.quantity--;
      update();
      calculateTotalPrice();
    }
  }

  void addToCart(ProductModel furniture) {
    furniture.quantity = 1;
    cartProduct.add(furniture);
    calculateTotalPrice();
    update();
  }

  calculateTotalPrice() {
    totalPrice.value = 0;
    for (var element in cartProduct) {
      totalPrice.value += element.quantity * element.price;
    }
  }

  void clearCart() {
    cartProduct.clear();
    totalPrice.value = 0;
    update();
  }
}
