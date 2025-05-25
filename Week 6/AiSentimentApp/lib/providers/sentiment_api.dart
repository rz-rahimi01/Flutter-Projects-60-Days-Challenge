import 'package:aisentimentpp/providers/firebase_post.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SentimentApi extends ChangeNotifier {
  void uploadapi(String message) async {
    final response = await http.post(
      Uri.parse(
        "https://api-inference.huggingface.co/models/tabularisai/multilingual-sentiment-analysis",
      ),
    );

    if (response.statusCode == 200) {
      void post() {
        FirebasePost send = Provider.of<FirebasePost>(context, listen: false);
      }
    }
  }
}
