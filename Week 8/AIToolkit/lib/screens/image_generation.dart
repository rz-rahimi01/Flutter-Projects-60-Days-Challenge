import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageGeneratorScreen extends StatefulWidget {
  const ImageGeneratorScreen({super.key});

  @override
  State<ImageGeneratorScreen> createState() => _ImageGeneratorScreenState();
}

class _ImageGeneratorScreenState extends State<ImageGeneratorScreen> {
  final TextEditingController _promptController = TextEditingController();
  final String apiKey = ''; // Replace with your actual
  final String model = 'black-forest-labs/FLUX.1-dev';
  final String ratio = "1/1"; // You can make this user-selectable
  final int imageCount = 1;

  bool isLoading = false;
  List<Uint8List> images = [];

  Map<String, int> getImageDimensions(String aspectRatio, int baseSize) {
    final parts = aspectRatio.split('/');
    final widthRatio = int.parse(parts[0]);
    final heightRatio = int.parse(parts[1]);

    final scaleFactor = baseSize / sqrt(widthRatio * heightRatio);

    int width = (widthRatio * scaleFactor).round();
    int height = (heightRatio * scaleFactor).round();

    width = (width ~/ 16) * 16;
    height = (height ~/ 16) * 16;

    return {'width': width, 'height': height};
  }

  Future<void> generateImages() async {
    if (_promptController.text.isEmpty) return;

    setState(() {
      isLoading = true;
      images.clear();
    });

    final dims = getImageDimensions(ratio, 512);
    final width = dims['width']!;
    final height = dims['height']!;
    final url = 'https://api-inference.huggingface.co/models/$model';

    for (int i = 0; i < imageCount; i++) {
      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json',
            'x-use-cache': 'false',
          },
          body: jsonEncode({
            'inputs': _promptController.text,
            'parameters': {'width': width, 'height': height},
          }),
        );

        if (response.statusCode == 200) {
          setState(() {
            images.add(response.bodyBytes);
          });
        } else {
          debugPrint('Error: ${response.body}');
        }
      } catch (e) {
        debugPrint('Exception: $e');
      }
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _promptController,
              decoration: const InputDecoration(
                labelText: 'Enter Prompt',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isLoading ? null : generateImages,
              child: const Text('Generate Image'),
            ),
            const SizedBox(height: 16),
            if (isLoading) const CircularProgressIndicator(),
            Expanded(
              child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Image.memory(images[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
