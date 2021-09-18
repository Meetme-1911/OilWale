import 'dart:convert';
import 'package:Oilwale/models/product.dart';
import 'package:http/http.dart' as http;

const String base_url = "https://oilwale.herokuapp.com/api";

class APIManager {
  static Future<List<Product>> getProducts() async {
    var client = http.Client();
    String urlStr = base_url + "/getAllProduct";
    var url = Uri.parse(urlStr);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      List jsonMap = jsonDecode(jsonString);
      List<Product> products = [];
      jsonMap.forEach((element) {
        products.add(Product(
            id: element.productId,
            name: element.productName,
            specification: element.specification,
            packageSize: element.packingSize,
            image: element.productImage));
        print(element);
      });
      return [];
    } else {
      return [];
    }
  }
}

void main() {
  APIManager.getProducts();
}
