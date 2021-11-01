import 'package:flutter/material.dart';
import 'package:oilwale/components/vehicledetailblock.dart';
import 'package:oilwale/models/customervehicle.dart';

class VehicleDetails extends StatefulWidget {
  @override
  _VehicleDetailsState createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.deepOrange),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "My vehicle",
            style: TextStyle(color: Colors.deepOrange),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Vehicle Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0),
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: Icon(Icons.edit))
                      ],
                    ),
                    VehicleDetailBlock(
                      customerVehicle: CustomerVehicle(
                          brand: "Hero",
                          id: args,
                          model: "YuYu",
                          numberPlate: "11 22 33",
                          currentKM: 428,
                          kmperday: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
