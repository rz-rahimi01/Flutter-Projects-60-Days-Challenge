import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseAdd extends ChangeNotifier {
  Future<String> add(title, amount, date) async {
    try {
      // ignore: unused_local_variable
      DocumentReference docf = await FirebaseFirestore.instance
          .collection("Entries")
          .add({"title": title, "amount": amount, "date": date});

      // ✅ Success: Document ID exists

      return "success";
      // Show success message, clear fields, etc.
    } catch (e) {
      print("🔥 Firebase Add Error: ${e.toString()}");
      return "Unexpected error: ${e.toString()}";
      // Show error message to user
    }
  }
}
