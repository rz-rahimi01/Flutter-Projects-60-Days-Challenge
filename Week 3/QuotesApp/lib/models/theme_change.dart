import 'package:flutter/material.dart';

class ThemeChange extends ChangeNotifier {
  bool isDark = false;

  ThemeMode get current => isDark ? ThemeMode.dark : ThemeMode.light;

  void change(bool value) {
    isDark = value;
    notifyListeners();
  }
}
