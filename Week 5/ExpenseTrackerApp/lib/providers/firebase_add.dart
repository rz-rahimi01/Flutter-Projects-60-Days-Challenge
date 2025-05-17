import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseAdd extends ChangeNotifier {
  Future<void> add(title, amount, date) async {
    try {
      DocumentReference docf = await FirebaseFirestore.instance
          .collection("Entries")
          .add({"title": title, "amount": amount, "date": date});

      // ✅ Success: Document ID exists
      if (docf.id.isNotEmpty) {
        print("Document added with ID: ${docf.id}");
        // Show success message, clear fields, etc.
      }
    } catch (e) {
      print("Failed to add document: $e");
      // Show error message to user
    }
  }
}
