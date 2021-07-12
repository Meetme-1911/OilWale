import 'package:flutter/material.dart';
import '../components/formelements.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextInput(
                  hint: 'your name',
                  label: 'Enter name',
                  icon: Icon(Icons.person),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextInput(
                  hint: '000-000-0000',
                  label: 'Enter phone',
                  icon: Icon(Icons.phone),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_pin),
                    labelText: 'Enter address',
                    hintText: "xyz society, abc area ...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextInput(
                  hint: 'REFERALCODE',
                  label: 'Referal code (optional)',
                  icon: Icon(Icons.code),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: PasswordInput(),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addvehicle');
                },
                style: ButtonStyle(
                    // textStyle: MaterialStateProperty.all<TextStyle>(
                    //     TextStyle(fontSize: 20.0)),
                    fixedSize: MaterialStateProperty.all(
                        Size.fromWidth(MediaQuery.of(context).size.width))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              )
            ],
          )),
        ));
  }
}
