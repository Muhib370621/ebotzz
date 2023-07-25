import 'package:ebotzz/models/product.dart';
import 'package:ebotzz/models/tradingproduct.dart';

class Yourtradingproduct {
  ProductModel product;
  int statusid;
  bool isApproved;
  Yourtradingproduct(
      {required this.product,
      required this.statusid,
      required this.isApproved});
}
