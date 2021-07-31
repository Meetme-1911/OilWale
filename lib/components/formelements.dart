import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final String label;
  final Icon icon;

  const TextInput(
      {Key? key, required this.hint, required this.label, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          icon: this.icon,
          hintText: this.hint,
          labelText: this.label,
          labelStyle: TextStyle(color: Colors.deepOrange),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.deepOrange,
            ),
          ),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange)),
          hintStyle: TextStyle(color: Colors.deepOrange),
        ),
      ),
    );
  }
}

class TextArea extends StatelessWidget {
  final String hint;
  final String label;
  final Icon icon;
  final int lines;

  const TextArea(
      {Key? key,
      required this.hint,
      required this.label,
      required this.icon,
      required this.lines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        maxLines: this.lines,
        decoration: InputDecoration(
          icon: this.icon,
          labelText: this.label,
          hintText: this.hint,
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
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        style: TextStyle(fontSize: 16.0),
        obscureText: true,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          icon: Icon(
            Icons.password,
            color: Colors.deepOrange,
          ),
          hintText: "Secret",
          labelText: 'Enter password',
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
    );
  }
}
