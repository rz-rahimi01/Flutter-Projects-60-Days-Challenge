import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Favorite extends ChangeNotifier {
  void changeFavorite(int category, int index) {
    final favData = Hive.box('favorites');
    // Remove from Hive
    final keyToRemove = favData.keys.firstWhere((key) {
      List value = favData.get(key);
      return value[0] == category && value[1] == index;
    }, orElse: () => null);

    if (keyToRemove != null) {
      favData.delete(keyToRemove);
    } else {
      favData.add([category, index]);
    }
    notifyListeners();
  }
}
//here the key to remove serves as a unique identifier for the favorite item
// and is used to delete it from the Hive box. If the key is not found, it returns null.
//its example is same like we have in python
//favData.keys get all the keys from the box {1:[],2:[],3:[]...} . firstWhere says that firstone value
//List value = favData.get(key) get the value of the key and store it in the list whose name is value
// return value[0] == category && value[1] == index; this is the condition to check if the key is present or not
// if it is present then it will add the key to keyToRemove variable