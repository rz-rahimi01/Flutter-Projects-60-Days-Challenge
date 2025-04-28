import 'package:flutter/material.dart';

class Favorite extends ChangeNotifier {
  List favoriteFlags = [];

  void changeFavorite(int category, int index) {
    List newitem = [category, index];

    bool exists = favoriteFlags.any(
      (fav) =>
          fav[0] == category &&
          fav[1] ==
              index, // here the fav is a placeholder for the list means storing elements from list
    ); // it is a lamda function that checks if the list contains the element or not and aswers true or false

    // (fav) {
    //   if (fav[0] == category && fav[1] == index) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // } above lamda function is the same as this function

    if (exists) {
      favoriteFlags.removeWhere((fav) => fav[0] == category && fav[1] == index);
    } else {
      favoriteFlags.add(newitem);
    }

    notifyListeners();
  }
}
