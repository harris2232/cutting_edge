import 'package:cutting_edge/screens/appointment.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ).copyWith(
        primaryColor: Color(0xFF800405),
      ),
      home: AppointmentScreen(),
      // home: MyHomePage(),
    );
  }
}
