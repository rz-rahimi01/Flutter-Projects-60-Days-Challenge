import 'package:flutter/material.dart';

final ThemeData light = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.deepPurpleAccent,
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.white,
    shadowColor: Colors.blueGrey,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
    labelMedium: TextStyle(color: Colors.black),
  ),
);

final ThemeData dark = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xFF16213e),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1a1a2e),
    foregroundColor: Colors.white,
    elevation: 4,
    shadowColor: Colors.white24,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
    labelMedium: TextStyle(color: Colors.white),
  ),
);
