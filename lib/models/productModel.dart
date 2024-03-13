import 'package:ebotzz/models/userModel.dart';

class FirebaseProduct {
  final String productImage;
  final String productName;
  final String productPrice;
  final String productType;
  final String productDescription;
  final String shortDescription;
  final UserModel userModel;

  FirebaseProduct({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productType,
    required this.productDescription,
    required this.shortDescription,
    required this.userModel,
  });
}