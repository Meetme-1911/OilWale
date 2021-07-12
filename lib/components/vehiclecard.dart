import 'package:flutter/material.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          print("someone touched me");
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Vehicle Model",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "Number Plate",
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 16,
              ),
              Text("KM Reading: 10256, 15km/day",
                  style:
                      TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal)),
            ],
          ),
        ),
      ),
    );
  }
}
