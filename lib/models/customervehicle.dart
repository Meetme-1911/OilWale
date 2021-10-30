class CustomerVehicle {
  late final String id;
  late final String model;
  late final String brand;
  late final int? kmTravelled;
  late final String? numberPlate;
  late final int? currentKM;

  CustomerVehicle(
      {required this.id,
      required this.model,
      required this.brand,
      this.kmTravelled,
      this.numberPlate,
      this.currentKM});

  CustomerVehicle.fromJSON(Map<String, dynamic> json) {
    this.id = json['productId'];
    this.model = json['productName'];
    this.brand = json['grade'];
    this.kmTravelled = json['specification'];
    this.numberPlate = json['packageSize'];
    this.currentKM = json['productImage'];
  }
}
