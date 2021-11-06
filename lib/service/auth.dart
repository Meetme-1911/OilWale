import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oilwale/models/customer.dart';
import 'package:oilwale/service/customer_api.dart';

const String base_url = "https://oilwale.herokuapp.com/api";

class AuthManager {
  // return customer object on success or false on error
  static Future<dynamic> login(String phone, String pwd, bool customer) async {
    try {
      if (phone == "0123456789" && pwd == "garage" && !customer) {
        return true;
      } else if (phone == "0123456789" && pwd == "customer" && customer) {
        Customer customerdetail = await CustomerAPIManager.getCustomerDetail(
            '61471733b5d80304faa4ccc2');
        print(customerdetail);
        return true;
      }
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
    }
    return false;
  }

  static Future<bool> addCustomer(Map<String, dynamic> data) async {
    try {
      String dataString = jsonEncode(data);
      var client = http.Client();
      String urlStr = base_url + "/addCustomer";
      var url = Uri.parse(urlStr);
      print(dataString);
      var response = await client.post(url,
          body: dataString, headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        print(jsonMap);
        return true;
      } else {
        return false;
      }
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
    }
    return false;
  }
}
