import 'dart:convert';
import 'package:ebotzz/models/productApiModel.dart';
import 'package:ebotzz/models/signUpModel.dart';
import 'package:ebotzz/services/urlSchemes.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CustomerServices {

  ///sign Up for customer
  Future<List<ProductApiModel>> getAllProducts() async {
    /// Url
    String url = UrlSchemes.baseUrl("products");
    // var data = jsonEncode(<String, String>{
    //   // "username": name,
    //   // "email": email,
    //   // "password":password,
    //   // "passwordConf": confirmPass,
    //   // "role": "Manager",
    // });
    final ProductController productController = Get.put(ProductController());

    /// Request
    var response = await http.get(
      // headers: {'Content-Type': 'application/json'},
      Uri.parse(url),
      // body: data,
    );

    /// this is called when we are debugging and this is not called when we
    /// make the release.
    if (kDebugMode) {
      print("Called API: $url");
      // print("PHONE: $phone");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      productController.productList= productApiModelFromJson(response.body);
      // Prompts.showSuccess("Congrats!", "Successfully Signed Up.");
      // Get.offAllNamed(RouteNames.loginScreen);
      // Get.defaultDialog(
      //     title: "Successfully registered",
      //     titleStyle: TextStyle(color: Colors.green,fontSize: 16),
      //     content:Container(
      //       width: 300,height: 300,child: Lottie.asset("assets/json/successIcon.json"),
      //     )
      // );
      return productApiModelFromJson(response.body);
    }
    if (response.statusCode == 400) {
      // Prompts.showError("Oops",errorModelFromJson(response.body).error);
      // return errorModelFromJson(response.body);
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
