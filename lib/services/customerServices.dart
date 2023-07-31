import 'dart:convert';
import 'dart:io';
import 'package:ebotzz/models/productApiModel.dart';
import 'package:ebotzz/models/signUpModel.dart';
import 'package:ebotzz/services/urlSchemes.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/loginModel.dart';
import '../models/productCategoryModel.dart';

class CustomerServices {

  ///sign Up for customer
  Future<List<ProductApiModel>> getAllProducts() async {
    String url = UrlSchemes.baseUrl("products");
    var response = await http.get(
      Uri.parse(url),
    );
    if (kDebugMode) {
      print("Called API: $url");
      // print("PHONE: $phone");
      print("Status Code: ${response.statusCode}");
      final ProductController productController = Get.put(ProductController());
      productController.totalData=List<Map<String, dynamic>>.from(json.decode(response.body));
      print("products"+  productController.totalData.toString());
      print("Response Body: ${response.body}");

    }

    if (response.statusCode == 200 || response.statusCode == 201) {
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
      print("Response Body: ${response.body}");
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


}
