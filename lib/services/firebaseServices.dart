import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebotzz/controllers/login_controller.dart';
import 'package:ebotzz/controllers/product_controller.dart';
import 'package:ebotzz/controllers/signUpController.dart';
import 'package:ebotzz/controllers/userController.dart';
import 'package:ebotzz/core/routes/routeNames.dart';
import 'package:ebotzz/core/utils/global.dart';
import 'package:ebotzz/models/orderModel.dart';
import 'package:ebotzz/models/product.dart';
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
            globalUserModel = UserModel(
                email: data["email"].toString(),
                name: data["userName"].toString(),
                role: data["role"].toString(),
                userID: data["userID"].toString());

            log("==================User Model" +
                globalUserModel.name.toString());
            Prompts.showSuccess("Success", "Successfully Logged In");
            await FirebaseServices().getProducts();
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
    final UserController userController = Get.put(UserController());

    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('products').add({
        'productImage': product.productImage,
        'productName': product.productName,
        'productPrice': product.productPrice,
        'productType': product.productType,
        'productDescription': product.productDescription,
        'shortDescription': product.shortDescription,
        'user': {
          globalUserModel.userID,
          globalUserModel.name,
          globalUserModel.email,
          globalUserModel.role,
        }
      });
      log("------------------------------" + product.userModel.name.toString());
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

  Future<void> placeOrder(OrderModel order) async {
    // final UserController userController = Get.put(UserController());

    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // DocumentReference orderRef = FirebaseFirestore.instance.collection('orders').doc();

      await firestore.collection('orders').add({
        'orderID': order.orderID,
        'buyerEmail': order.buyerEmail,
        'sellerEmail': order.sellerEmail,
        'orderStatus': order.orderStatus,
        'totalPrice': order.totalPrice,
        'orderDateTime': order.orderTimeStamp,
        'orderProducts': [
          {
            'ID': order.orderedProducts?.id.toString(),
            'title': order.orderedProducts?.title,
            'price': order.orderedProducts?.price.toString(),
            'qty': order.orderedProducts?.quantity.toString(),
            'img': order.orderedProducts?.img.toString(),
            'isFav': order.orderedProducts?.isFavorite.toString(),
            'description': order.orderedProducts?.description,
          }
        ]
      });

      // await orderRef.update();
      // 'productType': product.productType,
      // 'productDescription': product.productDescription,
      // 'shortDescription': product.shortDescription,
      // 'user':{
      //   userController.userModel.value.userID,
      //   userController.userModel.value.name,
      //   userController.userModel.value.email,
      //   userController.userModel.value.role,
      //
      // }
      // });
      // log("------------------------------"+product.userModel.name.toString());
      Prompts.showSuccess("Success", "Order Placed Successfully");
      Get.close(2);
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
    log("-----------------getting fiebase projects");
    querySnapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      log("-------data" + data.toString());
      final map = {
        "productImage": data['productImage'],
        "productName": data['productName'],
        "productType": data['productType'],
        "productDescription": data['productDescription'],
        "shortDescription": data['shortDescription'],
        "productPrice": data["productPrice"],
      };
      final product = FirebaseProduct(
        productImage: data['productImage'].toString(),
        productName: data['productName'].toString(),
        productType: data['productType'],
        productDescription: data['productDescription'],
        shortDescription: data['shortDescription'],
        productPrice: data["productPrice"],
        userModel: UserModel(
            name: data["user"][1].toString(),
            userID: data["user"][0],
            role: data["user"][3],
            email: data["user"][2]),
      );
      // productController.totalData.add(map);
      productController.firebaseProductList.add(product);
      productController.firebaseProductList.removeWhere((element) => element.userModel.userID==globalUserModel.userID);
    });
    log("product firebase" +
        productController.firebaseProductList.length.toString());

    return productController.firebaseProductList;
  }

  Future<List<OrderModel>> getUserPendingOrders() async {
    productController.firebaseUserPendingOrderList.clear();
    final UserController userController = Get.put(UserController());

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot querySnapshot = await firestore
        .collection('orders')
        .where('buyerEmail',
            isEqualTo: globalUserModel.email.toString())
        .where('orderStatus', isEqualTo: 'Pending')
        .get();

    // final List<FirebaseProduct> products = [];
    log("-----------------getting orders projects"+globalUserModel.email.toString());
    log("-----------------getting orders projects"+querySnapshot.docs.length.toString());
    querySnapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      //   log("-------data" + data.toString());
      final product = OrderModel(
        orderTimeStamp: data['orderDateTime'],
        orderID: data['orderID'],
        buyerEmail: data['buyerEmail'],
        sellerEmail: data['sellerEmail'],
        totalPrice: data['totalPrice'],
        orderStatus: data['orderStatus'],
        orderedProducts: ProductModel(
            id: int.parse(data['orderProducts'][0]['ID']),
            title: data['orderProducts'][0]['title'],
            description: data['orderProducts'][0]['description'],
            price: double.parse(data['orderProducts'][0]['price']),
            img: data['orderProducts'][0]['img'],
            isFavorite: bool.parse(data['orderProducts'][0]['isFav'])),
      );
      //   // productController.totalData.add(map);
      productController.firebaseUserPendingOrderList.add(product);
      // });
      log("pending orders firebase" +
          productController.firebaseUserPendingOrderList.length.toString());
    });
    return productController.firebaseUserPendingOrderList.value;
  }
  Future<List<OrderModel>> getUserAcceptedOrders() async {
    productController.firebaseUserAcceptedOrderList.clear();
    final UserController userController = Get.put(UserController());

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot querySnapshot = await firestore
        .collection('orders')
        .where('buyerEmail',
            isEqualTo: globalUserModel.email.toString())
        .where('orderStatus', isEqualTo: 'Accepted')
        .get();

    // final List<FirebaseProduct> products = [];
    log("-----------------getting orders projects"+globalUserModel.email.toString());
    log("-----------------getting orders projects"+querySnapshot.docs.length.toString());
    querySnapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      //   log("-------data" + data.toString());
      final product = OrderModel(
        orderTimeStamp: data['orderDateTime'],
        orderID: data['orderID'],
        buyerEmail: data['buyerEmail'],
        sellerEmail: data['sellerEmail'],
        totalPrice: data['totalPrice'],
        orderStatus: data['orderStatus'],
        orderedProducts: ProductModel(
            id: int.parse(data['orderProducts'][0]['ID']),
            title: data['orderProducts'][0]['title'],
            description: data['orderProducts'][0]['description'],
            price: double.parse(data['orderProducts'][0]['price']),
            img: data['orderProducts'][0]['img'],
            isFavorite: bool.parse(data['orderProducts'][0]['isFav'])),
      );
      //   // productController.totalData.add(map);
      productController.firebaseUserAcceptedOrderList.add(product);
      // });
      log("pending orders firebase" +
          productController.firebaseUserAcceptedOrderList.length.toString());
    });
    return productController.firebaseUserAcceptedOrderList.value;
  }

  Future<List<OrderModel>> getVendorPendingOrders() async {
    productController.firebaseVendorPendingOrderList.clear();
    final UserController userController = Get.put(UserController());

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot querySnapshot = await firestore
        .collection('orders')
        .where('sellerEmail',
        isEqualTo: globalUserModel.email.toString())
        .where('orderStatus', isEqualTo: 'Pending')
        .get();

    // final List<FirebaseProduct> products = [];
    log("-----------------getting orders projects"+globalUserModel.email.toString());
    log("-----------------getting orders projects"+querySnapshot.docs.length.toString());
    querySnapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      //   log("-------data" + data.toString());
      final product = OrderModel(
        orderTimeStamp: data['orderDateTime'],
        orderID: data['orderID'],
        buyerEmail: data['buyerEmail'],
        sellerEmail: data['sellerEmail'],
        totalPrice: data['totalPrice'],
        orderStatus: data['orderStatus'],
        orderedProducts: ProductModel(
            id: int.parse(data['orderProducts'][0]['ID']),
            title: data['orderProducts'][0]['title'],
            description: data['orderProducts'][0]['description'],
            price: double.parse(data['orderProducts'][0]['price']),
            img: data['orderProducts'][0]['img'],
            isFavorite: bool.parse(data['orderProducts'][0]['isFav'])),
      );
      //   // productController.totalData.add(map);
      productController.firebaseVendorPendingOrderList.add(product);
      // });
      log("pending orders firebase" +
          productController.firebaseVendorPendingOrderList.length.toString());
    });
    return productController.firebaseVendorPendingOrderList.value;
  }
  Future<List<OrderModel>> getVendorAcceptedOrders() async {
    productController.firebaseVendorAcceptedOrderList.clear();
    final UserController userController = Get.put(UserController());

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot querySnapshot = await firestore
        .collection('orders')
        .where('sellerEmail',
        isEqualTo: globalUserModel.email.toString())
        .where('orderStatus', isEqualTo: 'Accepted')
        .get();

    // final List<FirebaseProduct> products = [];
    log("-----------------getting orders projects"+globalUserModel.email.toString());
    log("-----------------getting orders projects"+querySnapshot.docs.length.toString());
    querySnapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      //   log("-------data" + data.toString());
      final product = OrderModel(
        orderTimeStamp: data['orderDateTime'],
        orderID: data['orderID'],
        buyerEmail: data['buyerEmail'],
        sellerEmail: data['sellerEmail'],
        totalPrice: data['totalPrice'],
        orderStatus: data['orderStatus'],
        orderedProducts: ProductModel(
            id: int.parse(data['orderProducts'][0]['ID']),
            title: data['orderProducts'][0]['title'],
            description: data['orderProducts'][0]['description'],
            price: double.parse(data['orderProducts'][0]['price']),
            img: data['orderProducts'][0]['img'],
            isFavorite: bool.parse(data['orderProducts'][0]['isFav'])),
      );
      //   // productController.totalData.add(map);
      productController.firebaseVendorAcceptedOrderList.add(product);
      // });
      log("pending orders firebase" +
          productController.firebaseVendorAcceptedOrderList.length.toString());
    });
    return productController.firebaseVendorAcceptedOrderList.value;
  }

  Future<void> changeOrderStatusToAccepted(String orderID) async {
    try {
      // Query for the order document where email matches
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('orders')
          .where('orderID', isEqualTo: orderID)
          .get();

      // Iterate through the documents and update each one
      for (DocumentSnapshot doc in querySnapshot.docs) {
        // Get reference to the order document
        DocumentReference orderRef = FirebaseFirestore.instance.collection('orders').doc(doc.id);

        // Update the order document with the new status
        await orderRef.update({
          'orderStatus': "Accepted",
        });
        Get.back();

        Prompts.showSuccess("Success", "Accepted Order#$orderID");

        print('Order status updated successfully!');
      }
    } catch (e) {
      // Handle errors
      print('Error updating order status: $e');
    }
  }

}
