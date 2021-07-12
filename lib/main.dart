import 'package:flutter/material.dart';
import 'screens/index.dart';
import 'components/addvehicleform.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      // '/': (context) => SplashScreen(),
      '/home': (context) => HomeScreen(),
      '/login': (context) => LoginScreen(),
      '/createAccount': (context) => CreateAccountScreen(),
      '/addvehicle': (context) => AddVehicleForm()
    },
  ));
}
