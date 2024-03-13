import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebotzz/controllers/login_controller.dart';
import 'package:ebotzz/controllers/product_controller.dart';
import 'package:ebotzz/controllers/signUpController.dart';
import 'package:ebotzz/controllers/userController.dart';
import 'package:ebotzz/core/routes/routeNames.dart';
import 'package:ebotzz/models/userModel.dart';
import 'package:ebotzz/screens/bottom_nav_bar.dart';
import 'package:ebotzz/utils/prompts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/productModel.dart';

class FirebaseServices {
  final SignUpController signUpController = Get.put(SignUpController());
  final LoginController loginController = Get.put(LoginController());
  ProductController productController = Get.put(ProductController());

  Future<void> signUp(String name, String email, String password) async {
    final LoginController loginController = Get.put(LoginController());
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    signUpController.isLoading.value = true;
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // You can update the user's display name here
      await userCredential.user!.updateDisplayName(name);
      await firestore.collection('users').add({
        'userID': DateTime.now().microsecond,
        'userName': name,
        'email': email,
        'role': loginController.isSeller.value ? 'Seller' : 'Buyer'
        // 'productType': product.productType,
        // 'productDescription': product.productDescription,
        // 'shortDescription': product.shortDescription,
      });
      Prompts.showSuccess("Success", "User Registered Successfully");
      Get.back();
      signUpController.isLoading.value = false;

      // User has been registered successfully
    } catch (e) {
      // Handle errors
      if (e is FirebaseAuthException) {
        Prompts.showError("Oops", e.message.toString());
      }
      print(e.toString());
      signUpController.isLoading.value = false;
    }
  }

  Future<void> signIn(String email, String password) async {
    final UserController userController = Get.put(UserController());

    loginController.isLoading.value = true;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      // Query for the email in the "users" collection
      QuerySnapshot querySnapshot =
          await usersCollection.where('email', isEqualTo: email).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Email found in the "users" collection
        print('Email found in users collection');
        for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
          print('User ID: ${documentSnapshot.id}');
          Map<String, dynamic>? data =
              documentSnapshot.data() as Map<String, dynamic>;
          print('User Data: ${data}');
          String selectedRole =
              loginController.isSeller.value ? 'Seller' : 'Buyer';
          if (data["role"] == selectedRole) {
            userController.userModel.value = UserModel(
                email: data["email"].toString(),
                name: data["userName"].toString(),
                role: data["role"].toString(),
                userID: data["userID"].toString());
            Prompts.showSuccess("Success", "Successfully Logged In");
            Get.to(() => BottomNavBar());
            loginController.isLoading.value = false;
          } else {
            Prompts.showError("Error", "Kindly login as ${data['role']}");
            loginController.isLoading.value = false;
          }
        }
      } else {
        // Email not found in the "users" collection
        print('Email not found in users collection');
      }

      // User has been signed in successfully
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.message!.contains("INVALID_LOGIN_CREDENTIALS ")) {
          Prompts.showError("Oops", "Email or Password is wrong");
        } else {
          Prompts.showError("Oops", e.message.toString());
        }
      }
      // Handle errors
      loginController.isLoading.value = false;
      print(e.toString());
    }
  }

  Future<void> addProduct(FirebaseProduct product) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('products').add({
        'productImage': product.productImage,
        'productName': product.productName,
        'productPrice': product.productPrice,
        'productType': product.productType,
        'productDescription': product.productDescription,
        'shortDescription': product.shortDescription,
        'user': product.userModel
      });
      Prompts.showSuccess("Success", "Product Added");
      Get.offAll(() => BottomNavBar());
      print('Product added to Firestore.');
    } catch (e) {
      if (e is FirebaseAuthException) {
        Prompts.showError("Oops", e.message.toString());
      }
      print('Error adding product to Firestore: $e');
    }
  }

  Future<List<FirebaseProduct>> getProducts() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot querySnapshot =
        await firestore.collection('products').get();

    // final List<FirebaseProduct> products = [];

    querySnapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final map = {
        "productImage": data['productImage'],
        "productName": data['productName'],
        "productType": data['productType'],
        "productDescription": data['productDescription'],
        "shortDescription": data['shortDescription'],
        "productPrice": data["productPrice"],
      };
      final product = FirebaseProduct(
        productImage: data['productImage'],
        productName: data['productName'],
        productType: data['productType'],
        productDescription: data['productDescription'],
        shortDescription: data['shortDescription'],
        productPrice: data["productPrice"], userModel: UserModel(),
      );
      // productController.totalData.add(map);
      productController.firebaseProductList.add(product);
    });
    log("product firebase" +
        productController.firebaseProductList.length.toString());

    return productController.firebaseProductList;
  }
}
