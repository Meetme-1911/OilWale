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
        decoration: InputDecoration(
          icon: this.icon,
          hintText: this.hint,
          labelText: this.label,
          border: OutlineInputBorder(),
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
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.password),
          hintText: "Secret",
          labelText: 'Enter password',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
