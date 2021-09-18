class Product {
  final String id;
  final String name;
  final String? specification;
  final String packageSize;
  final String? image;

  Product(
      {required this.id,
      required this.name,
      this.specification,
      required this.packageSize,
      this.image});

  Product(Map<String, dynamic> json) {
    this.id = json['productId'];
    this.name = json['productId'];
    this.specification = json['productId'];
    this.packageSize = json['productId'];
    this.image = json['productId'];
  }
}
