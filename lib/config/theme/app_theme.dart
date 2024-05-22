import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.orange,
  Colors.red,
  Colors.purple
];

class AppTheme {
  //Overal color theme
  final int selectedColor;
  //Darkmode boolean variable.
  final bool darkModeEnabled;

  AppTheme({this.darkModeEnabled = false, this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

//Crete the method to get the theme data.
  ThemeData getTheme() => ThemeData(
      colorSchemeSeed: colorList[selectedColor],
      brightness: darkModeEnabled ? Brightness.dark : Brightness.light);

//We need to use copyWith in order to create a whole copy of the state of AppTheme and send it to the ThemeNotifierProvider.

  AppTheme copyWith({int? selectedColor, bool? darkModeEnabled}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled);
}
