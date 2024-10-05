import 'package:flutter/material.dart';

class MyAppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: mainAppColor
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
    );
  }
}

 MaterialColor mainAppColor = const MaterialColor(0xFF6C2F80, <int, Color>{
         50: Color(0xFF6C2F80),
         100: Color(0xFF6C2F80),
         200: Color(0xFF6C2F80),
         300: Color(0xFF6C2F80),
         400: Color(0xFF6C2F80),
         500: Color(0xFF6C2F80),
         600: Color(0xFF6C2F80),
         700: Color(0xFF6C2F80),
         800: Color(0xFF6C2F80),
         900: Color(0xFF6C2F80),
   });