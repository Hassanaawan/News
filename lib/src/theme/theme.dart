import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme();

  // Define common text styles
  static const TextStyle titleStyle =
      TextStyle(color: Color(0xff000000), fontSize: 16);
  static const TextStyle subTitleStyle =
      TextStyle(color: Color(0xff9D99A7), fontSize: 12);

  static const TextStyle h1Style =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const TextStyle h2Style = TextStyle(fontSize: 22);
  static const TextStyle h3Style = TextStyle(fontSize: 20);
  static const TextStyle h4Style = TextStyle(fontSize: 18);
  static const TextStyle h5Style = TextStyle(fontSize: 16);
  static const TextStyle h6Style = TextStyle(fontSize: 14);

  // Light theme configuration
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF003366), // Navy blue
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF003366), // Navy blue
      secondary: const Color(0xFFFF0000), // Red
      background: const Color(0xFFFFFFFF), // White
      surface: const Color(0xFFF5F5F5), // Light grey
      error: const Color(0xFFFF5252), // Red
      onPrimary: const Color(0xFFFFFFFF), // White
      onSecondary: const Color(0xFFFFFFFF), // White
      onBackground: const Color(0xFF000000), // Black
      onSurface: const Color(0xFF000000), // Black
      onError: const Color(0xFFFFFFFF), // White
    ),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF), // White background
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Color(0xFF003366), // Navy blue
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ), // Title text color
      bodyLarge: TextStyle(
        color: Color(0xFF797878), // Subtitle text color
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF000000), // Black text
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: Color(0xFF9D99A7), // Grey text
        fontSize: 12,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF003366), // Navy blue
      iconTheme: IconThemeData(color: Color(0xFFFFFFFF)), // White icons
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF), // White title
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFFFF0000), // Red buttons
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Dark theme configuration
  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFF003366), // Navy blue
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF003366), // Navy blue
      secondary: const Color(0xFFFF0000), // Red
      background: const Color(0xFF101010), // Dark background
      surface: const Color(0xFF3E404D), // Light black
      error: const Color(0xFFFF5252), // Red
      onPrimary: const Color(0xFFFFFFFF), // White
      onSecondary: const Color(0xFFFFFFFF), // White
      onBackground: const Color(0xFFD1D1D0), // Grey text
      onSurface: const Color(0xFFD1D1D0), // Grey text
      onError: const Color(0xFF000000), // Black
    ),
    scaffoldBackgroundColor: const Color(0xFF101010), // Dark background
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Color(0xFFD1D1D0), // Grey text
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ), // Title text color
      bodyLarge: TextStyle(
        color: Color(0xFF797878), // Subtitle text color
        fontSize: 16,
      ),
      labelLarge: TextStyle(
        color: Color(0xFFFFFFFF), // White text
        fontSize: 14,
      ),
      labelMedium: TextStyle(
        color: Color(0xFF9D99A7), // Grey text
        fontSize: 12,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF3E404D), // Light black
      iconTheme: IconThemeData(color: Color(0xFFFFFFFF)), // White icons
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF), // White title
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFFFF0000), // Red buttons
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
