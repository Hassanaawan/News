import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xFFC9B3EA), // light purple
  colorScheme: ColorScheme.light(
    primary: const Color(0xFFC9B3EA), // light purple
    secondary: const Color(0xFF83679A), // dark purple
    background: const Color(0xffffffff), // white
    surface: const Color(0xfff5f5f5), // light grey
    error: const Color(0xffff5252), // red
    onPrimary: const Color(0xff000000), // black
    onSecondary: const Color(0xfff5f5f5), // light grey
    onBackground: const Color(0xff000000), // black
    onSurface: const Color(0xff000000), // black
    onError: const Color(0xffffffff), // white
  ),
  scaffoldBackgroundColor: const Color(0xffffffff), // white background
  textTheme: const TextTheme(
    headlineLarge: TextStyle(color: Color(0xffd1d1d0), fontSize: 24, fontWeight: FontWeight.bold), // title text color
    bodyLarge: TextStyle(color: Color(0xff797878), fontSize: 16), // subtitle text color
    bodyMedium: TextStyle(color: Color(0xff000000), fontSize: 14), // black body text
    bodySmall: TextStyle(color: Color(0xff9D99A7), fontSize: 12), // grey text
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xFFC9B3EA), // light purple
    iconTheme: IconThemeData(color: Color(0xff000000)), // black icons
    titleTextStyle: TextStyle(
      color: Color(0xff000000), // black title
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xff3b4ea7), // dark blue buttons
    textTheme: ButtonTextTheme.primary,
  ),
);