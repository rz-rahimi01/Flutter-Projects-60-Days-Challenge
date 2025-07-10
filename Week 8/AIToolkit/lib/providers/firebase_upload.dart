import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseAdd extends ChangeNotifier {
  Future<String> upload(userText) async {
    try {
      await FirebaseFirestore.instance
          .collection("app")
          .doc("data")
          .collection("textWriter")
          .add({"userText": userText});

      return "success";
    } on FirebaseException catch (e) {
      return e.code;
    }
  }
}
