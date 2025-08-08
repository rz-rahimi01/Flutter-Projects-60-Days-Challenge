import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageApiUpload extends ChangeNotifier {
  Future<Uint8List> imageapi(
    String prompt,
    String model,
    String ratio,
    int imageCount,
  ) async {
    final String apiKey = ''; // Replace with your actual API key
    final String url = 'https://api-inference.huggingface.co/models/$model';

    if (prompt.isEmpty) {
      throw Exception("Prompt cannot be empty");
    }

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json",
        },

        body: jsonEncode({"inputs": prompt}),
      );

      if (response.statusCode == 200) {
        print(url);
        print("Response content-type: ${response.headers['content-type']}");
        print("Response length: ${response.bodyBytes.length}");

        return response.bodyBytes;
      } else {
        print(url);
        throw Exception(
          "Failed to generate image: ${response.statusCode} ${response.reasonPhrase}",
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
