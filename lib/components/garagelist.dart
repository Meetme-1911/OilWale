import 'package:flutter/material.dart';

class Garage {
  int? id;
  String? name;
  int? pincode;
  String? address;
  Garage({this.id, this.name, this.pincode, this.address});
}

class GarageTile extends StatelessWidget {
  final Garage garage;

  const GarageTile({Key? key, required this.garage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.deepOrange),
        // color: Colors.deepOrange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${garage.name}",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Text(
              "${garage.pincode}",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
            Text(
              "${garage.address}",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            )
          ],
        ));
  }
}

String inputext = '';
List<Garage> allGarages = [
  new Garage(
      id: 1, name: "Garage1", pincode: 123456, address: "example addresss"),
  new Garage(
      id: 2, name: "Garage2", pincode: 123456, address: "example addresss"),
  new Garage(
      id: 3, name: "Garage3", pincode: 123456, address: "example addresss"),
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
                if (g.name!.toLowerCase().contains(inpLowercase)) {
                  return true;
                } else if (g.pincode!
                    .toString()
                    .toLowerCase()
                    .contains(inpLowercase)) {
                  return true;
                } else if (g.address!.toLowerCase().contains(inpLowercase)) {
                  return true;
                } else {
                  return false;
                }
              }).toList();
            });
          },
          decoration: InputDecoration(
              hintText: 'Search',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder()),
        ),
        Container(
          height: (MediaQuery.of(context).size.height - 179),
          child: ListView.builder(
            itemCount: allGarages.length,
            itemBuilder: (context, index) {
              return GarageTile(garage: _gList[index]);
            },
          ),
        ),
      ],
    );
  }
}
