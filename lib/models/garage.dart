// address	string
// alternateNumber	string
// area	string
// createdAt	string($date-time)
// garageId	string
// garageName	string
// gstNumber	string
// image	string
// name	string
// phoneNumber	string
// pincode	string
// referralCode	string
// updatedAt	string($date-time)

class Garage {
  late final String id;
  late final String address;
  late final String? alternateNumber;
  late final String area;
  late final String garageName;
  late final String? gstNumber;
  late final String? image;
  late final String ownerName;
  late final String phoneNumber;
  late final String pincode;
  late final String referralCode;

  Garage({
    required this.id,
    required this.address,
    this.alternateNumber,
    required this.area,
    required this.garageName,
    this.gstNumber,
    this.image,
    required this.ownerName,
    required this.phoneNumber,
    required this.pincode,
    required this.referralCode,
  });

  Garage.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.address = json['address'];
    this.alternateNumber = json['alternateNumber'];
    this.area = json['area'];
    this.garageName = json['garageName'];
    this.gstNumber = json['gstNumber'];
    this.image = json['image'];
    this.ownerName = json['ownerName'];
    this.phoneNumber = json['phoneNumber'];
    this.pincode = json['pincode'];
    this.referralCode = json['referralCode'];
  }
}
