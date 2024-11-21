import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF00B6F1);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: primaryColor),
    ),
  );
} 