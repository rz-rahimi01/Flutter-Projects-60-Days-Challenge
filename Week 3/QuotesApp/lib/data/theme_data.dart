import 'package:flutter/material.dart';

ThemeData light = ThemeData().copyWith(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.orange.shade50,
    elevation: 4,
    shadowColor: Colors.orange.shade200,
  ),
  scaffoldBackgroundColor: Colors.orange.shade50,

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black87, width: 2),
      ),
      backgroundColor: Colors.orange.shade200,
      foregroundColor: Colors.black87,
      shadowColor: Colors.black87,
      elevation: 4,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.white),
    trackColor: WidgetStateProperty.all(Colors.amber.shade700),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.orange.shade200,
    foregroundColor: Colors.black87,
  ),
);

ThemeData dark = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 4,
    shadowColor: Colors.white24,
  ),

  scaffoldBackgroundColor: Colors.grey.shade900,

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.white70, width: 2),
      ),
      backgroundColor: Colors.grey.shade800,
      foregroundColor: Colors.white,
      shadowColor: Colors.grey.shade200,
      elevation: 4,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey.shade600,
    foregroundColor: Colors.white,
    elevation: 4,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.black54),
    trackColor: WidgetStateProperty.all(Colors.grey.shade200),
  ),
);
