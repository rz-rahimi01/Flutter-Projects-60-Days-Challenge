import 'dart:convert';
import 'package:aisentimentpp/providers/firebase_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SentimentApi extends ChangeNotifier {
  Future<String?> getSentimentToken() async {
    try {
      final doc =
          await FirebaseFirestore.instance
              .collection('config')
              .doc('sentiment_api')
              .get();

      return doc.data()?['token'];
    } catch (e) {
      debugPrint("Error fetching sentiment token: $e");
      return null;
    }
  }

  String? _statusMessage;
  String? get statusMessage => _statusMessage;

  void _setStatus(String msg) {
    _statusMessage = msg;

    notifyListeners();
  }

  Future<String> uploadapi(BuildContext context, String message) async {
    final token = await getSentimentToken();
    final response = await http.post(
      Uri.parse(
        "https://api-inference.huggingface.co/models/tabularisai/multilingual-sentiment-analysis",
      ),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({'inputs': message}),
    );

    if (response.statusCode == 200) {
      _setStatus("Sentiment received ✅. Now posting to Firebase...23");

      FirebasePost firebaseProvider = Provider.of<FirebasePost>(
        // ignore: use_build_context_synchronously
        context,
        listen: false,
      );
      // --- MODIFICATION STARTS HERE ---
      final List decodedBody = jsonDecode(response.body);

      List sentimentsToSend;

      if (decodedBody.isNotEmpty && decodedBody[0] is List) {
        // If the response is like [[{...}]]
        sentimentsToSend = decodedBody[0];
      } else {
        // If the response is like [{...}] (less common for this API, but good to handle)
        sentimentsToSend = decodedBody;
      }
      // --- MODIFICATION ENDS HERE ---

      final firebaseResult = await firebaseProvider.post(
        message,
        sentimentsToSend,
      );

      switch (firebaseResult) {
        case "permission-denied":
          _setStatus("❌ You do not have permission to add data.");
          break;
        case "unavailable":
          _setStatus("⚠️ Service is temporarily unavailable.");
          break;
        case "unknown-error":
          _setStatus("❌ Unexpected error. Try again.");
          break;
        case "success":
          _setStatus("✅ Mood posted successfully!");
          break;
        default:
          _setStatus("❌ Error: $firebaseResult");
          break;
      }
      return firebaseResult;
    } else {
      _setStatus("❌ Error: ${response.statusCode}");
      return "Error: ${response.statusCode}";
    }
  }
}
