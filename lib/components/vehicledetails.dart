import 'package:flutter/material.dart';
import 'package:oilwale/components/editvehicledetail.dart';
import 'package:oilwale/components/vehicledetailblock.dart';
import 'package:oilwale/models/customervehicle.dart';

class VehicleDetails extends StatefulWidget {
  @override
  _VehicleDetailsState createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  CustomerVehicle? args;
  VehicleDetailBlock? _vehicleDetailBlock;
  EditVehicleDetailBlock? _editVehicleDetailBlock;
  bool isEditing = false;

  // @override
  // void initState() {
  //   super.initState();
  //   args = ModalRoute.of(context)!.settings.arguments as String;
  // }

  Widget? toggleForm() {
    if (isEditing) {
      return _editVehicleDetailBlock;
    }
    return _vehicleDetailBlock;
  }

  IconData getEditButtonIcon() {
    if (isEditing) {
      return Icons.save;
    }
    return Icons.edit;
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as CustomerVehicle;
    _vehicleDetailBlock = VehicleDetailBlock(
        customerVehicle: CustomerVehicle(
            brand: "Hero",
            id: args!.id,
            model: "YuYu",
            numberPlate: "11 22 33",
            currentKM: 428,
            kmperday: 12));
    _editVehicleDetailBlock = EditVehicleDetailBlock();
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
                            onPressed: () {
                              setState(() {
                                isEditing = !isEditing;
                              });
                            },
                            child: Icon(getEditButtonIcon()))
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    toggleForm() ?? Container(),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
              ),
              Text(
                "Last Serviced",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
              Divider(
                height: 24.0,
              ),
              Text(
                "Recommend Products",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              )
            ],
          ),
        ));
  }
}
