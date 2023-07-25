import 'package:ebotzz/models/yourproduct.dart';

import '../utils/imports.dart';

class TradingController extends GetxController {
  RxList<TradingProdut> tradingList = <TradingProdut>[].obs;
  RxList<Yourtradingproduct> yourtradingproducts = <Yourtradingproduct>[].obs;

  void addTradingProduct(TradingProdut tradingproduct) {
    tradingList.add(tradingproduct);
  }

  void addYourTradingProduct(Yourtradingproduct tradingproduct) {
    yourtradingproducts.add(tradingproduct);
  }

  void disposeyourtradingproductlist() {
    yourtradingproducts.clear();
  }
}
