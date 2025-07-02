import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final Map<String, List<Color>> itemGradients = {
  "Python": [Colors.blue, Colors.yellow],
  "Java": [Colors.orange, Colors.red],
  "C++": [Colors.indigo, Colors.blueGrey],
  "JavaScript": [Colors.yellow, Colors.orange],
  "Dart": [Colors.lightBlue, Colors.blue],
  "Ruby": [Colors.red, Colors.pink],
  "PHP": [Colors.purple, Colors.deepPurple],
  "Swift": [Colors.deepOrange, Colors.orangeAccent],
  "Flutter": [Colors.cyan, Colors.blueAccent],
};

final List proItems = [
  "Python",
  "Java",
  "C++",
  "JavaScript",
  "Dart",
  "Ruby",
  "PHP",
  "Swift",
  "Flutter",
];

final List icons = [
  FontAwesomeIcons.python,
  FontAwesomeIcons.java,
  FontAwesomeIcons.cuttlefish,
  FontAwesomeIcons.js,
  FontAwesomeIcons.dartLang,
  FontAwesomeIcons.diamond,
  FontAwesomeIcons.php,
  FontAwesomeIcons.swift,
  FontAwesomeIcons.flutter,
];

final Color primaryColor = const Color(0xFF1a1a2e);
final Color secondaryColor = const Color(0xFF16213e);
final Color accentColor = const Color(0xFF0f3460);
final Color textColor = Colors.white;

// Pre-calculated colors with opacity
final Color primaryWithOpacity = const Color.fromRGBO(26, 26, 46, 0.8);
final Color accentWithOpacity = const Color.fromRGBO(15, 52, 96, 0.9);
final Color borderColor = const Color.fromRGBO(255, 255, 255, 0.1);
final Color shadowColor = const Color.fromRGBO(0, 0, 0, 0.3);
final Color textColorWithOpacity = const Color.fromRGBO(255, 255, 255, 0.9);
