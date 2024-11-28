class ProductModel{
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.quantity,
    required this.image,
});

  int id;
  String name;
  double price;
  String category;
  int quantity;
  String image;
}