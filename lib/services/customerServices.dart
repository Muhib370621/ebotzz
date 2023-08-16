import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:ebotzz/models/orderStatusModel.dart';
import 'package:ebotzz/models/productApiModel.dart';
import 'package:ebotzz/models/signUpModel.dart';
import 'package:ebotzz/screens/home_screen/HomeScreen2.dart';
import 'package:ebotzz/services/urlSchemes.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/createOrderModel.dart';
import '../models/createProductModel.dart';
import '../models/deleteOrderByIdModel.dart';
import '../models/errorModel.dart';
import '../models/getOrderByIdModel.dart';
import '../models/loginModel.dart';
import '../models/productCategoryModel.dart';
import '../utils/prompts.dart';

class CustomerServices {

  ///sign Up for customer
  Future<List<ProductApiModel>> getAllProducts() async {
    String url = UrlSchemes.baseUrl("products");
    var response = await http.get(
      Uri.parse(url),
    );
    final ProductController productController = Get.put(ProductController());
    productController.totalData.value=List<Map<String, dynamic>>.from(json.decode(response.body));

    if (kDebugMode) {
      print("Called API: $url");
      // print("PHONE: $phone");
      print("Status Code: ${response.statusCode}");
      print("products"+  productController.totalData.toString());
      print("Response Body: ${response.body}");

    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      productController.isLoading.value = false;
      return productApiModelFromJson(response.body);
    }
    if (response.statusCode == 400) {
    }
    if (response.statusCode == 401) {
      throw Exception('Failed to send!');
    }
    if (response.statusCode == 500) {
      throw Exception('Internal Server Error!');
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<ProductCategoryModel>> getCategory() async {

    String url = UrlSchemes.baseUrl("products/categories");
    var response = await http.get(
      Uri.parse(url),
    );
    if (kDebugMode) {
      print("Called API: $url");
      // print("PHONE: $phone");
      final ProductController productController = Get.put(ProductController());
      productController.totalCategoryData.value=List<Map<String, dynamic>>.from(json.decode(response.body));
      productController.isLoading.value = false;
      print("Response Body of category product is : ${productController.totalCategoryData}");
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      return productCategoryModelFromJson(response.body);
    }
    if (response.statusCode == 400) {
    }
    if (response.statusCode == 401) {
      throw Exception('Failed to send!');
    }
    if (response.statusCode == 500) {
      throw Exception('Internal Server Error!');
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<OrderStatus>> getOrderStatus() async {

    String url = UrlSchemes.baseUrl("orders");
    var response = await http.get(
      Uri.parse(url),
    );
    if (kDebugMode) {
      print("Called API: $url");
      // print("PHONE: $phone");
      final ProductController productController = Get.put(ProductController());
      productController.totalOrderStatusData.value=List<Map<String, dynamic>>.from(json.decode(response.body));
      productController.isLoading.value = false;
      print("Response Body: ${response.body}");
    }
    if (response.statusCode == 200 || response.statusCode == 201) {
      return orderStatusFromJson(response.body);
    }
    if (response.statusCode == 400) {
    }
    if (response.statusCode == 401) {
      throw Exception('Failed to send!');
    }
    if (response.statusCode == 500) {
      throw Exception('Internal Server Error!');
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<GetByIdOrderModel> getOrderById(String id) async {

    String url = UrlSchemes.baseUrl("orders/${id}");
    var response = await http.get(
      Uri.parse(url),
    );
    if (kDebugMode) {
      print("Called API: $url");
      // print("PHONE: $phone");
      final ProductController productController = Get.put(ProductController());
      productController.getOrderById.value =Map<String, dynamic>.from(json.decode(response.body));
      productController.isLoading.value = false;
      print("Response Body: ${response.body}");
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      return getByIdOrderModelFromJson(response.body);
    }
    if (response.statusCode == 400) {
    }
    if (response.statusCode == 401) {
      throw Exception('Failed to send!');
    }
    if (response.statusCode == 500) {
      throw Exception('Internal Server Error!');
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<DeleteOrderByIdModel> deleteOrderById(String id) async{
    String url = UrlSchemes.baseUrl("orders/${id}");
    var response = await http.delete(
        headers:{
          'Content-Type': 'application/json',
        },
        Uri.parse(url)
    );
    // debug mode
    if (kDebugMode) {
      print("Called API: $url");
      print("Status Code: ${response.statusCode}");
      final ProductController productController = Get.put(ProductController());

      productController.deleteOrderById.value =Map<String, dynamic>.from(json.decode(response.body));
      productController.isLoading.value = false;
      print("Response Body of delete order by id is : ${response.body}");
      // print("HEADERS: $header");
    }
    if (response.statusCode == 200) {
      return deleteOrderByIdModelFromJson(response.body);
    }
    if (response.statusCode == 401) {
      throw Exception('Not Authorized');
    }
    if (response.statusCode == 500) {
      throw Exception('Server Not Responding');
    } else {
      throw Exception('Something Went Wrong');
    }

  }

  static Future<LoginResponseModel?> loginCustomer(String userName,String password) async{
    LoginResponseModel? model;

      var response = await http.post(
        Uri.parse(UrlSchemes.loginToken),
        body:{
          "userName":userName,
          "password":password,
      },
        headers: {
          HttpHeaders.contentTypeHeader:"application/x-ww-form-urlencoded",
        }
      );

    if(response.statusCode == 200|| response.statusCode == 201){
      model = LoginResponseModel.fromJson(response.body as Map<String, dynamic>);
    }
    return model;
  }



  Future<CreateOrderModel> createOrder (
      String paymentMethod,String paymentMethodTitle,bool setPaid,
      Map<String,dynamic> billing,
      Map<String,dynamic> shipping
      )
  async{

    String url = UrlSchemes.baseUrl("orders");
    var data = jsonEncode({
      "payment_method":paymentMethod,
      "payment_method_title":paymentMethodTitle,
      "set_paid":setPaid,
      "billing":billing,
      "shipping":shipping
    });

    var response = await http.post(
      headers: {'Content-Type': 'application/json'},
      Uri.parse(url),
      body: data,
    );

    if (kDebugMode) {
      print("Called API: $url");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
    }
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.defaultDialog(
          title: "Successfully placed order",
          titleStyle: const TextStyle(color: Colors.green,fontSize: 16),
          content:Container(
            width: 300,height: 300,child: Lottie.asset("assets/json/successIcon.json"),
          )
      );
      return createOrderModelFromJson(response.body);
    }
    if (response.statusCode == 400) {
      Prompts.showError("Oops",errorModelFromJson(response.body).message!);
    }
    if (response.statusCode == 401) {
      throw Exception('Failed to send!');
    }
    if (response.statusCode == 500) {
      throw Exception('Internal Server Error!');
    } else {
      throw Exception('Something went wrong');
    }
  }


  Future<CreateProductModel> createProduct (
      String name,String type,String regularPrice,
      String description,
      String shortDescription,
      List images
      ) async{

    String url = UrlSchemes.baseUrl("orders");
    var data = jsonEncode({
      "name":name,
      "type":type,
      "regular_price":regularPrice,
      "description":description,
      "short_description":shortDescription,
      "images":[
        {
          "src" : images
        }
      ]
    });

    var response = await http.post(
      headers: {'Content-Type': 'application/json'},
      Uri.parse(url),
      body: data,
    );

    if (kDebugMode) {
      print("Called API: $url");
      print("Status Code: ${response.statusCode}");
      ProductController productController = Get.put(ProductController());
      productController.createProductResponse.value =Map<String, dynamic>.from(json.decode(response.body));
      productController.isLoading.value = false;
      print("Response Body of create product is : ${response.body}");
    }
    if ((response.statusCode == 200 || response.statusCode == 201) ) {
      Get.defaultDialog(
          title: "Successfully placed order",
          titleStyle: const TextStyle(color: Colors.green,fontSize: 16),
          content:Container(
            width: 300,height: 300,child: Lottie.asset("assets/json/successIcon.json"),
          )
      );
      Future.delayed(Duration(seconds: 2),(){
        Get.off(()=> HomeScreen2());
      });
      return createProductModelFromJson(response.body);
    }
    if (response.statusCode == 400) {
      Prompts.showError("Oops",errorModelFromJson(response.body).message!);
    }
    if (response.statusCode == 401) {
      throw Exception('Failed to send!');
    }
    if (response.statusCode == 500) {
      throw Exception('Internal Server Error!');
    } else {
      throw Exception('Something went wrong');
    }
  }
}
