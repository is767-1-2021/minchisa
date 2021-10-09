import 'package:fitness_app/pages/constants.dart';
import 'package:fitness_app/pages/welcome.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: colorSwatch,
        primaryColor: colorPrimary,
        accentColor: Color(0XFF233C63),
        fontFamily: 'Poppins',
      ),
      home: Welcome(),
    );
  }
}
