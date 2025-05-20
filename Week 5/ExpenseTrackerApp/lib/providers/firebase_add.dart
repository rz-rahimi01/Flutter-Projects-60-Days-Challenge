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
    } on FirebaseException catch (e) {
      return e.code;
      // Show error message to user
    }
  }
}
