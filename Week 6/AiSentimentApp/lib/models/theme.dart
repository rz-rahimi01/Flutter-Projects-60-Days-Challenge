import 'package:flutter/material.dart';

ThemeData light = ThemeData().copyWith(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.teal,
    elevation: 5,
    shadowColor: Colors.black,
  ),
  scaffoldBackgroundColor: Colors.teal[50],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.cyan[200],
      foregroundColor: Colors.black,
      shadowColor: Colors.black,
      elevation: 4,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.white),
    trackColor: WidgetStateProperty.all(Colors.teal[700]),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.cyan[200],
    foregroundColor: Colors.black,
  ),
);

ThemeData dark = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[800],
    elevation: 5,
    shadowColor: Colors.white,
  ),
  scaffoldBackgroundColor: Color(0xFF121212),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.teal[700],
      foregroundColor: Colors.white,
      shadowColor: Colors.black,
      elevation: 4,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.white),
    trackColor: WidgetStateProperty.all(Colors.teal[400]),
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey[600],
    foregroundColor: Colors.white,
  ),
);
