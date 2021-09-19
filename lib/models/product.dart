class Product {
  late final String id;
  late final String name;
  late final String? specification;
  late final String? packageSize;
  late final String? image;

  Product(
      {required this.id,
      required this.name,
      this.specification,
      this.packageSize,
      this.image});

  Product.fromJSON(Map<String, dynamic> json) {
    this.id = json['productId'];
    this.name = json['productId'];
    this.specification = json['productId'];
    this.packageSize = json['productId'];
    this.image = json['productId'];
  }
}
