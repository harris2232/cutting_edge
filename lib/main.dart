import 'package:flutter/material.dart';
import 'my_homepage.dart';

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
      home: MyHomePage(),
    );
  }
}
