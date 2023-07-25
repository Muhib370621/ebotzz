

import '../models/product.dart';
import 'app_assets.dart';

class AppData {
  const AppData._();

  static const dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  static List<ProductModel> productList = [
    ProductModel(
      quantity: 1,
      isFavorite: false,
      title: 'Product 1',
      description: dummyText,
      price: 469.99,
      img: AppAsset.coverProduct,
      id: 1,
    ),
    ProductModel(
      quantity: 1,
      isFavorite: false,
      title: 'Product 2',
      description: dummyText,
      price: 469.99,
      img: AppAsset.electronicHeadphone,
      id: 1,
    ),
  ];

}
