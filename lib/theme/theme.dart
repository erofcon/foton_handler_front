import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color.fromRGBO(244,244,246,1) ,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          shadowColor: Color.fromRGBO(50, 84, 95, 1)));
  final darkTheme = ThemeData.dark().copyWith();
}
