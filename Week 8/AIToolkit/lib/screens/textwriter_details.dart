import 'package:flutter/material.dart';

class TextwriterDetails extends StatefulWidget {
  final String userText;
  final String tone;
  final String response;
  const TextwriterDetails({
    super.key,
    required this.userText,
    required this.tone,
    required this.response,
  });

  @override
  State<TextwriterDetails> createState() => _TextwriterDetailsState();
}

class _TextwriterDetailsState extends State<TextwriterDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Writer Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Input:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(widget.userText, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),

            Text(
              "Tone Selected:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(widget.tone.toUpperCase(), style: TextStyle(fontSize: 16)),

            SizedBox(height: 16),
            Text(
              "Response:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(widget.response, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
