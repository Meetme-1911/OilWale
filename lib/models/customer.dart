class Customer {
  late bool isActive;
  late String customerId;
  late String customerName;
  late String customerPhoneNumber;
  late String customerAddress;
  late String customerPincode;
  String? garageReferralCode;
  late DateTime createdAt;
  DateTime? updatedAt;

  Customer(
      {required this.isActive,
      required this.customerId,
      required this.customerName,
      required this.customerPhoneNumber,
      required this.customerAddress,
      required this.customerPincode,
      this.garageReferralCode,
      required this.createdAt,
      required this.updatedAt});

  Customer.fromJSON(Map<String, dynamic> json) {
    this.isActive = json['productId'];
    this.customerId = json['productId'];
    this.customerName = json['productId'];
    this.customerPhoneNumber = json['productId'];
    this.customerAddress = json['productId'];
    this.customerPincode = json['productId'];
    this.garageReferralCode = json['productId'];
    this.createdAt = json['productId'];
    this.updatedAt = json['productId'];
  }
}
