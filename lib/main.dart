import 'package:flutter/material.dart';

import 'app_screen/_listtest.dart';
import 'app_screen/calculator.dart';
import 'app_screen/dropdownitem.dart';
import 'app_screen/favcity.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "SteffulWidget Test",
    home: CalculatorTest(),
    //them data for calculator page
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
      accentColor: Colors.indigoAccent,
    ),
  ));
}
