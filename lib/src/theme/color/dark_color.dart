import 'package:flutter/material.dart';

/// Define light theme with custom colors


/// Optional: Define a dark theme similarly
ThemeData darkTheme = ThemeData(
  primaryColor: const Color(0xFF8E7FE0), // purple
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFF8E7FE0), // purple
    secondary: const Color(0xFF6e3c7d), // dark pink
    background: const Color(0xff101010), // dark background
    surface: const Color(0xff3E404D), // light black
    error: const Color(0xffff5252), // red
    onPrimary: const Color(0xffffffff), // white
    onSecondary: const Color(0xffffffff), // white
    onBackground: const Color(0xffd1d1d0), // title text color
    onSurface: const Color(0xffd1d1d0), // title text color
    onError: const Color(0xff000000), // black
  ),
  scaffoldBackgroundColor: const Color(0xff101010), // dark background
  textTheme: const TextTheme(
    headlineLarge: TextStyle(color: Color(0xffd1d1d0), fontSize: 24, fontWeight: FontWeight.bold), // title text color
    bodyLarge: TextStyle(color: Color(0xff797878), fontSize: 16), // subtitle text color
    labelLarge: TextStyle(color: Color(0xffffffff), fontSize: 14), // white body text
    labelMedium: TextStyle(color: Color(0xff9D99A7), fontSize: 12), // grey text
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xff3E404D), // light black
    iconTheme: IconThemeData(color: Color(0xffffffff)), // white icons
    titleTextStyle: TextStyle(
      color: Color(0xffffffff), // white title
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xff2c53b2), // light blue buttons
    textTheme: ButtonTextTheme.primary,
  ),
);
