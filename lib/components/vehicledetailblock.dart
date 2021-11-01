import 'package:flutter/material.dart';
import 'package:oilwale/models/customervehicle.dart';

class VehicleDetailBlock extends StatelessWidget {
  final CustomerVehicle customerVehicle;

  final TextStyle heading = TextStyle(color: Colors.deepOrange, fontSize: 16.0);
  final TextStyle bodytext = TextStyle(color: Colors.black, fontSize: 24.0);

  VehicleDetailBlock({required this.customerVehicle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Brand",
            style: heading,
          ),
          Text(
            customerVehicle.brand,
            style: bodytext,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "Model",
            style: heading,
          ),
          Text(
            customerVehicle.model,
            style: bodytext,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "Number Plate",
            style: heading,
          ),
          Text(
            customerVehicle.numberPlate ?? "Not Available",
            style: bodytext,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "KM per day",
            style: heading,
          ),
          Text(
            customerVehicle.kmperday.toString(),
            style: bodytext,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "Total Travelled Distance",
            style: heading,
          ),
          Text(
            customerVehicle.currentKM.toString(),
            style: bodytext,
          ),
        ],
      ),
    );
  }
}
