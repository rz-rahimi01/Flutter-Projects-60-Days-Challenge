import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiUpload extends ChangeNotifier {
  Future<String> apikey() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection("app")
          .doc("api")
          .get();

      return doc.data()?['key'] ?? 'No key found';
    } catch (e) {
      return e.toString();
    }
  }

  Future<List> sendToApi(String userText, String tone) async {
    const String apiurl = "https://tinq.ai/api/v2/rewrite";
    String token = await apikey();

    try {
      final response = await http.post(
        Uri.parse(apiurl),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode({'text': userText, 'tone': tone}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ["success", data];
      } else {
        final error = jsonDecode(response.body);
        return ["error", error["message"] ?? "Unknown error from API"];
      }
    } catch (e) {
      return ["error", e.toString()];
    }
  }
}
