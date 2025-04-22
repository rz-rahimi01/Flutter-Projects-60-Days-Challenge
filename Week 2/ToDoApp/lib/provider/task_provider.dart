import 'package:flutter/material.dart';

class Tasks extends ChangeNotifier {
  List itemValues = [];
  List itemdone = [];
  List date = [];
  bool isdone = false;

  void taskadd(String task, BuildContext context) {
    if (task == '') {
      //if the textfield is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter a task"),
          backgroundColor: Colors.black,
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      itemValues.add(task);
      itemdone.add(false);
      date.add(DateTime.now());
      notifyListeners();
    }
  }

  void taskdelete(int index) {
    itemValues.removeAt(index);
    itemdone.removeAt(index);
    notifyListeners();
  }

  void taskdone(int index) {
    itemdone[index] = !itemdone[index];
    notifyListeners();
  }
}
