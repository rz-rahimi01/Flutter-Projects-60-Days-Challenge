import 'package:flutter/material.dart';

class Favorite extends ChangeNotifier {
  List favoriteFlags = [];

  void changeFavorite(int index) {
    if (favoriteFlags.contains(index)) {
      favoriteFlags.remove(index);
    } else {
      favoriteFlags.add(index);
    }
    notifyListeners();
  }
}
