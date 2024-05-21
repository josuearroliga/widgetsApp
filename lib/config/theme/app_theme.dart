import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.orange,
  Colors.red,
  Colors.purple
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

//Crete the method to get the theme data.
  ThemeData getTheme() => ThemeData(
      colorSchemeSeed: colorList[selectedColor], brightness: Brightness.light);
}
