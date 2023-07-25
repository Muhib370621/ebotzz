class ProductModel {
  int id;
  String title;
  String description;
  double price;
  int quantity;
  String img;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 1,
    required this.img,
    this.isFavorite = false,
  });
}
