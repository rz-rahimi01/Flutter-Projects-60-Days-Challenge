import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebasePost extends ChangeNotifier {
  Future<String> post(String mood, List sentiments) async {
    try {
      await FirebaseFirestore.instance.collection("moods").add({
        "MoodFeeling": mood,
        "Sentiment": sentiments,
        "Date": DateTime.now(),
      });

      return "success"; // Return true if the post was successful
    } on FirebaseException catch (e) {
      return e.code; // Return false if there was an error
    }
  }
}
