// ignore_for_file: avoid_print

import 'dart:io';

import 'package:ebotzz/models/orderStatusModel.dart';
import 'package:ebotzz/models/productApiModel.dart';
import 'package:ebotzz/services/customerServices.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:flutter/foundation.dart';

import '../models/createOrderModel.dart';
import '../models/createProductModel.dart';
import '../models/deleteOrderByIdModel.dart';
import '../models/getOrderByIdModel.dart';
import '../models/productCategoryModel.dart';

class ProductController extends GetxController {
  RxList<ProductModel> cartProduct = <ProductModel>[].obs;
  RxList<ProductModel> favoriteProductList = <ProductModel>[].obs;
  RxList<ProductModel> allproduct = <ProductModel>[].obs;
  RxList<ProductModel> tradingproduct = <ProductModel>[].obs;
  RxList<ProductCategoryModel> categoryList = <ProductCategoryModel>[].obs;
  RxDouble totalPrice = 0.0.obs;
  var billing = {}.obs;
  var shipping = {}.obs;
  var getOrderById = {}.obs;
  var deleteOrderById = {}.obs;
  var createProductResponse ={}.obs;
  CreateOrderModel? getResultCreate;

  @override
  void onInit() {
    // TODO: implement onInit
    inital();
    super.onInit();
  }

  inital() async {
    await getAllProducts();
    await getCategories();
    await getOrderStatus();
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

  RxList<Map<String, dynamic>> totalData = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> totalCategoryData = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> totalOrderStatusData =
      <Map<String, dynamic>>[].obs;
  var list = [].obs;

  Future<List<ProductApiModel>?> getAllProducts() async {
    try {
      isLoading.value = true;
      var result = await CustomerServices().getAllProducts();
      if (kDebugMode) {
        print("Result: " + result.toString());
      }
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

  Future<List<ProductCategoryModel>?> getCategories() async {
    try {
      isLoading.value = true;
      var result = await CustomerServices().getCategory();
      // list.value = result;
      if (kDebugMode) {
        print("Result: " + result.toString());
      }
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

  Future<List<OrderStatus>?> getOrderStatus() async {
    try {
      isLoading.value = true;
      var result = await CustomerServices().getOrderStatus();
      if (kDebugMode) {
        print("Result: " + result.toString());
      }
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

  Future<GetByIdOrderModel?> getOrderByIdResponse(String id) async {
    try {
      isLoading.value = true;
      var result = await CustomerServices().getOrderById(id);
      if (kDebugMode) {
        print("Result: " + result.toString());
      }
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

  Future<DeleteOrderByIdModel?> deleteOrderByIdResponse(String id) async {
    try {
      isLoading.value = true;
      var result = await CustomerServices().deleteOrderById(id);
      if (kDebugMode) {
        print("Result: " + result.toString());
      }
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

  Map<String, String> setBilling(String firstName, lastName, address1, address2,
      city, state, postcode, country, email, phone) {
    var set = <String, String>{
      "first_name": firstName,
      "last_name": lastName,
      "address1": address1,
      "address2": address2,
      "city": city,
      "state": state,
      "postcode": postcode,
      "country": country,
      "email": email,
      "phone": phone
    };
    return set;
  }

  Map<String, String> setShipping(String firstName, lastName, address1,
      address2, city, state, postcode, country) {
    var set = <String, String>{
      "first_name": firstName,
      "last_name": lastName,
      "address1": address1,
      "address2": address2,
      "city": city,
      "state": state,
      "postcode": postcode,
      "country": country,
    };
    return set;
  }

  Future<CreateOrderModel?> createOrder(
      String paymentMethod,
      String paymentMethodTitle,
      bool setPaid,
      Map<String, dynamic> billing,
      Map<String, dynamic> shipping) async {
    try {
      isLoading.value = true;
      var result = await CustomerServices().createOrder(
          paymentMethod, paymentMethodTitle, setPaid, billing, shipping);

      getResultCreate = result;

      if (kDebugMode) {
        print("Result: " + result.toString());
      }
      return result;
    } on SocketException {
      isLoading.value = false;
    } on Exception {
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future<CreateProductModel?> createProduct(String name, type, regularPrice,
      description, shortDescription, images) async {
    try {
      isLoading.value = true;
      var result = await CustomerServices().createProduct(
          name, type, regularPrice, description, shortDescription, images);
      if (kDebugMode) {
        print("Result: " + result.toString());
      }
      return result;
    } on SocketException {
      isLoading.value = false;
    } on Exception {
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}
