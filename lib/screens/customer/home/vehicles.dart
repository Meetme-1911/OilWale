import 'package:flutter/material.dart';
import 'package:oilwale/components/vehiclecard.dart';
import 'package:oilwale/models/customervehicle.dart';
import 'package:oilwale/service/customer_api.dart';

class VehiclesScreen extends StatefulWidget {
  @override
  _VehiclesScreenState createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  List<CustomerVehicle>? customerVehicleList;

  @override
  initState() {
    super.initState();
    CustomerAPIManager.getCustomerVehicles("abc").then((result) {
      setState(() {
        customerVehicleList = result;
      });
    });
  }

  Widget vehicleItemBuilder(context, index) {
    return VehicleCard(customerVehicle: customerVehicleList![index]);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: customerVehicleList?.length ?? 0,
                  itemBuilder: vehicleItemBuilder),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cust_addvehicle');
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "+ Add Vehicle",
                        style: TextStyle(fontSize: 24),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
