import 'package:expensetracker/models/expenses.dart';
import 'package:flutter/material.dart';

class ExpensePro extends ChangeNotifier {
  List myexpense = [];

  void add(Expenses values) {
    myexpense.add(values);
    notifyListeners();
  }
}
