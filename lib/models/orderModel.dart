import 'package:ebotzz/models/product.dart';

class OrderModel {
  String? orderID;
  String? buyerEmail;
  String? sellerEmail;
  String? orderStatus;
  String? totalPrice;
  ProductModel? orderedProducts;
  String? orderTimeStamp;

  OrderModel(
      {this.orderID,
      this.buyerEmail,
      this.sellerEmail,
      this.orderedProducts,
      this.orderTimeStamp,
      this.totalPrice,
      this.orderStatus,
      });
}
