import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseAdd extends ChangeNotifier {
  Future<String> upload(String userText, tone, response) async {
    try {
      await FirebaseFirestore.instance
          .collection("app")
          .doc("data")
          .collection("textWriter")
          .add({
            "userText": userText,
            "tone": tone,
            "timestamp": DateTime.now(),
            "response": response,
          });

      return "success";
    } on FirebaseException catch (e) {
      return e.message ?? e.code;
    }
  }
}
