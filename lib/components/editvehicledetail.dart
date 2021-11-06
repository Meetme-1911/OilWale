import 'package:flutter/material.dart';
import 'package:oilwale/components/formelements.dart';

class EditVehicleDetailBlock extends StatelessWidget {
// late final String id;
// late final String model;
// late final String brand;
// late final int? kmperday;
// late final String? numberPlate;
// late final int? currentKM;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: DropDownMenu(
              dpmItems: ['Brand1', 'Brand2', 'Brand3'],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: DropDownMenu(
              dpmItems: ['Model1', 'Model2', 'Model3'],
            ),
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
              label: 'Dairy KM travel',
              icon: Icon(Icons.timeline),
            ),
          )
        ],
      ),
    );
  }
}

// Brand dropdown menu
class DropDownMenu extends StatefulWidget {
  final List<String> dpmItems;

  const DropDownMenu({Key? key, required this.dpmItems}) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState(dpmItems);
}

/// This is the private State class that goes with MyStatefulWidget.
class _DropDownMenuState extends State<DropDownMenu> {
  String dropdownValue = 'Brand1';
  List<String> dpmItems = [];

  _DropDownMenuState(itemlist) {
    this.dpmItems = itemlist ?? ['None'];
    this.dropdownValue = itemlist[0] ?? ['None'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        // style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          // color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: dpmItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
