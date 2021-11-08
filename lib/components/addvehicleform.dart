import 'package:flutter/material.dart';
import 'package:oilwale/models/vehicle.dart';
import 'package:oilwale/models/vehiclecompany.dart';
import 'package:oilwale/service/vehicle_api.dart';
import 'package:oilwale/components/formelements.dart';

class AddVehicleForm extends StatefulWidget {
  @override
  _AddVehicleFormState createState() => _AddVehicleFormState();
}

class _AddVehicleFormState extends State<AddVehicleForm> {
  List<VehicleCompany> _company = [];
  List<Vehicle> _models = [];
  bool loadingVCList = true;
  bool loadingVMList = true;
  Text loadingDDM = Text(
    'Loading Options..',
    style: TextStyle(fontSize: 24.0),
  );

  @override
  void initState() {
    super.initState();
    VehicleAPIManager.getAllVehicleCompanies().then((result) {
      setState(() {
        loadingVCList = false;
        _company = result;
      });
    });
  }

  void changeModelList(String vehicleCompanyId) {
    setState(() {
      loadingVMList = true;
    });
    VehicleAPIManager.getVehiclesByCompanyId(vehicleCompanyId).then((_result) {
      setState(() {
        _models = _result;
        loadingVMList = false;
      });
    });
  }

  DropdownMenuItem<String> vehicleCompanyDDMB(VehicleCompany vehicleCompany) {
    return DropdownMenuItem(
        value: vehicleCompany.vehicleCompanyId,
        child: Text(vehicleCompany.vehicleCompany));
  }

  DropdownMenuItem<String> vehicleModelDDMB(Vehicle vehicle) {
    return DropdownMenuItem(
        value: vehicle.vehicleId, child: Text(vehicle.vehicleModel));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.deepOrange),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Add vehicle",
            style: TextStyle(color: Colors.deepOrange),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(bottom: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: loadingVCList
                    ? loadingDDM
                    : DropdownButton<String>(
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          // color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? vehicleCompanyId) {
                          print('Selected: ' + (vehicleCompanyId ?? ''));
                          changeModelList(vehicleCompanyId ?? '');
                        },
                        value: _company.length != 0
                            ? _company[0].vehicleCompanyId
                            : null,
                        items: _company
                            .map((e) => vehicleCompanyDDMB(e))
                            .toList()),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(bottom: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: loadingVMList
                    ? loadingDDM
                    : DropdownButton<String>(
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          // color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? vehicleId) {
                          print('Selected: ' + (vehicleId ?? ''));
                        },
                        value:
                            _models.length != 0 ? _models[0].vehicleId : null,
                        items:
                            _models.map((e) => vehicleModelDDMB(e)).toList()),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextInput(
                  hint: 'AB-XX-CD-XXXX',
                  label: 'Enter vehicle reg. number',
                  icon: Icon(Icons.drive_eta),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextInput(
                  hint: '102453',
                  label: 'Enter KM travelled',
                  icon: Icon(Icons.linear_scale),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextInput(
                  hint: '102453',
                  label: 'Daily KM travel',
                  icon: Icon(Icons.timeline),
                ),
              ),
              SizedBox(
                height: 120.0,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ElevatedButton(
                    onPressed: () {
                      print("vehicle added");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size.fromWidth(
                            MediaQuery.of(context).size.width)))),
              )
            ],
          )),
        ));
  }
}
