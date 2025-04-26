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
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.black87, width: 2),
      ),
      backgroundColor: Colors.orange.shade200,
      foregroundColor: Colors.black87,
      elevation: 4,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.white),
    trackColor: WidgetStateProperty.all(Colors.black54),
  ),
);

ThemeData dark = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 4,
    shadowColor: Colors.white24,
  ),
  scaffoldBackgroundColor: Colors.grey.shade900,
  // dividerColor: Colors.grey.shade600,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.white70, width: 2),
      ),
      backgroundColor: Colors.grey.shade800,
      foregroundColor: Colors.white,
      elevation: 4,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.grey.shade900),
    trackColor: WidgetStateProperty.all(Colors.amber.shade700),
  ),
);
