import 'package:flutter/material.dart';
import 'package:oilwale/components/garage_tile.dart';
import 'package:oilwale/models/garage.dart';

List<Garage> allGarages = [
  new Garage(
      id: "1",
      garageName: "Jet Set Go",
      pincode: "124356",
      address: "example addresss",
      area: 'Ahemdabad',
      ownerName: 'Ramesh',
      phoneNumber: '9898989898',
      referralCode: 'ASG154L'),
  new Garage(
      id: "2",
      garageName: "Suresh Autoshop",
      pincode: "145236",
      address: "example addresss",
      area: 'Ahemdabad',
      ownerName: 'Suresh',
      phoneNumber: '9711895298',
      referralCode: 'G5G154L'),
  new Garage(
      id: "3",
      garageName: "Shiv Garage",
      pincode: "312456",
      address: "example addresss",
      area: 'Gandhinagar',
      ownerName: 'Mahesh',
      phoneNumber: '7120835298',
      referralCode: 'HJG184Q')
];

class GarageListView extends StatefulWidget {
  GarageListView({Key? key}) : super(key: key);

  @override
  _GarageListViewState createState() => _GarageListViewState();
}

class _GarageListViewState extends State<GarageListView> {
  List<Garage> _gList = [];

  @override
  void initState() {
    super.initState();
    _gList = allGarages;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: (String input) {
            print("User entered: " + input);
            setState(() {
              String inpLowercase = input.toLowerCase();
              _gList = allGarages.where((g) {
                if (g.garageName.toLowerCase().contains(inpLowercase)) {
                  return true;
                } else if (g.pincode.toLowerCase().contains(inpLowercase)) {
                  return true;
                } else if (g.address.toLowerCase().contains(inpLowercase)) {
                  return true;
                } else {
                  return false;
                }
              }).toList();
            });
          },
          decoration: InputDecoration(
            hintText: 'Search',
            suffixIcon: Icon(
              Icons.search,
              color: Colors.deepOrange,
            ),
            labelStyle: TextStyle(color: Colors.deepOrange),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.deepOrange,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange)),
            hintStyle: TextStyle(color: Colors.deepOrange),
          ),
        ),
        Expanded(
          // height: (MediaQuery.of(context).size.height - 179),
          child: ListView.builder(
            itemCount: _gList.length,
            itemBuilder: (context, index) {
              return GarageTile(garage: _gList[index]);
            },
          ),
        ),
      ],
    );
  }
}
