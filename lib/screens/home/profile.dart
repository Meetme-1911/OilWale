import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: TextStyle(fontSize: 12),
          ),
          Text(
            "XYZ Kumar",
            style: TextStyle(fontSize: 18),
          ),
          Divider(),
          SizedBox(height: 10),
          Text(
            "Phone",
            style: TextStyle(fontSize: 12),
          ),
          Text(
            "1230456789",
            style: TextStyle(fontSize: 18),
          ),
          Divider(),
          SizedBox(height: 10),
          Text(
            "Address",
            style: TextStyle(fontSize: 12),
          ),
          Text(
            "XYZ city, asd qwadsd",
            style: TextStyle(fontSize: 18),
          ),
          Divider(),
          SizedBox(height: 10),
          Text(
            "Total number of time oil serviced",
            style: TextStyle(fontSize: 12),
          ),
          Text(
            "12",
            style: TextStyle(fontSize: 18),
          ),
          Divider(),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Text("Log out"),
          )
        ],
      )),
    );
  }
}
