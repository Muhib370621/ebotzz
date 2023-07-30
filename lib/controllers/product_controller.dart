// ignore_for_file: avoid_print

import 'dart:io';

import 'package:ebotzz/models/productApiModel.dart';
import 'package:ebotzz/services/customerServices.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:flutter/foundation.dart';

class ProductController extends GetxController {
  RxList<ProductModel> cartProduct = <ProductModel>[].obs;
  RxList<ProductModel> favoriteProductList = <ProductModel>[].obs;
  RxList<ProductModel> allproduct = <ProductModel>[].obs;
  RxList<ProductModel> tradingproduct = <ProductModel>[].obs;
  RxDouble totalPrice = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getAllProducts();
    super.onInit();
  }

  RxBool isLoading = false.obs;

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

  List<ProductApiModel> productList = <ProductApiModel>[].obs;


  Future<List<ProductApiModel>?>getAllProducts(
      // String name,
      // String email,
      // String password,
      // String confirmPass,
      ) async {
    try {
      isLoading.value = true;
      var result = await CustomerServices().getAllProducts();
      if (kDebugMode) {
        print("Result: " + result.toString());
      }
      // completeData.value = result;
      productList = result;
      isLoading.value = false;
      return result;
    } on SocketException {
      isLoading.value = false;
      // Prompts.showDialog(
      //     middleText: "Internet connection failure!", title: 'Oops');
    } on Exception {
      isLoading.value = false;
      // Prompts.showDialog(middleText: "No data found!", title: 'Oops');
    } catch (e) {
      isLoading.value = false;
      // Prompts.showDialog(middleText: "No data found!", title: 'Oops');
    }
  }
}
