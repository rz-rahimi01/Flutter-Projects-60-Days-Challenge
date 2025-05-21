import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseAdd extends ChangeNotifier {
  Future<String> add(title, amount, date) async {
    try {
      await FirebaseFirestore.instance.collection("Entries").add({
        "title": title,
        "amount": amount,
        "date": date,
      });
      return "success";
    } on FirebaseException catch (e) {
      return e.code;
    }
  }
}
