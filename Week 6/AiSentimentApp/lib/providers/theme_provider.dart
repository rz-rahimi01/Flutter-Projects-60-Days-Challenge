import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  ThemeMode get current => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void changeTheme(bool value) {
    isDarkMode = value;
    notifyListeners();
  }
}
