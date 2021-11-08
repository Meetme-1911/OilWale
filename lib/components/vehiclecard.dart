import 'package:flutter/material.dart';
import 'package:oilwale/models/customervehicle.dart';

class VehicleCard extends StatelessWidget {
  final CustomerVehicle customerVehicle;

  const VehicleCard({Key? key, required this.customerVehicle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.pushNamed(context, "/cust_vehicle",
              arguments: customerVehicle);
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: Colors.deepOrange, width: 4.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  customerVehicle.model,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  customerVehicle.numberPlate ?? "Not found",
                  style:
                      TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                    "KM Reading: ${customerVehicle.currentKM}, ${customerVehicle.kmperday} KM/day",
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.normal)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
