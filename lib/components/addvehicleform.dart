import 'package:flutter/material.dart';
import '../components/formelements.dart';

class AddVehicleForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Add vehicle"),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
