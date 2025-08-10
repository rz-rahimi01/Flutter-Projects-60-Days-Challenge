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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Text Writer Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoCard(
              title: "Your Input",
              content: widget.userText,
              icon: Icons.edit_note_rounded,
              color: Colors.blue.shade50,
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              title: "Tone Selected",
              content: widget.tone.toUpperCase(),
              icon: Icons.color_lens_rounded,
              color: Colors.orange.shade50,
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              title: "Response",
              content: widget.response,
              icon: Icons.chat_bubble_outline_rounded,
              color: Colors.green.shade50,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String content,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28, color: Colors.grey[700]),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(content, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
