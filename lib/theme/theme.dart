import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: const Color.fromRGBO(90, 143, 187, 1),
      scaffoldBackgroundColor: const Color.fromRGBO(244, 244, 246, 1),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          shadowColor: Color.fromRGBO(50, 84, 95, 1)));

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: const Color.fromRGBO(187, 134, 251, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(41, 55, 72, 1.0),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(33, 45, 59, 1),
        shadowColor: Color.fromRGBO(77, 83, 101, 1.0)),
    dialogBackgroundColor: const Color.fromRGBO(41, 55, 72, 1.0),
    popupMenuTheme: const PopupMenuThemeData(
      color: Color.fromRGBO(41, 55, 72, 1.0),
    ),
    checkboxTheme:
        CheckboxThemeData(fillColor: MaterialStateProperty.all(Colors.blue)),
  );
}
