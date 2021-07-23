import 'package:flutter/material.dart';
import 'screens/index.dart';
import 'components/addvehicleform.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white, color: Colors.deepOrange)),
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
