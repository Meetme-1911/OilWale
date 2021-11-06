import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool? active;
  String? customerId;
  String? customerName;
  String? customerPhoneNumber;
  String? customerAddress;
  String? customerPincode;
  String? garageReferralCode;

  TextStyle h1 = const TextStyle(fontSize: 12, color: Colors.deepOrange);
  TextStyle p1 = const TextStyle(fontSize: 18, color: Colors.black);

  Future<void> getCustomerPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    customerName = preferences.getString("customerName");
    customerPhoneNumber = preferences.getString("customerPhoneNumber");
    customerAddress = preferences.getString("customerAddress");
    customerPincode = preferences.getString("customerPincode");
    garageReferralCode = preferences.getString("garageReferralCode");
  }

  @override
  Widget build(BuildContext context) {
    getCustomerPrefs().then((value) {
      setState(() {});
    });
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16.0, 0),
                  child: Container(
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 72,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(36.0)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: h1,
                    ),
                    Text(
                      customerName ?? 'Loading..',
                      style: p1,
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 10),
          Text(
            'Phone',
            style: h1,
          ),
          Text(
            customerPhoneNumber ?? 'Loading..',
            style: p1,
          ),
          Divider(),
          SizedBox(height: 10),
          Text(
            'Address',
            style: h1,
          ),
          Text(
            customerAddress ?? 'Loading..',
            style: p1,
          ),
          Divider(),
          SizedBox(height: 10),
          Text(
            'PINCODE',
            style: h1,
          ),
          Text(
            customerPincode ?? 'Loading..',
            style: p1,
          ),
          Divider(),
          SizedBox(height: 10),
          Text(
            'Total number of time oil serviced',
            style: h1,
          ),
          Text(
            '12',
            style: p1,
          ),
          Divider(),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Log out",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
