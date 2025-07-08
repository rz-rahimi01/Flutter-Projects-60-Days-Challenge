import 'package:aitoolkit/widgets/text_dialog.dart';
import 'package:flutter/material.dart';

class Textwriter extends StatefulWidget {
  const Textwriter({super.key});

  @override
  State<Textwriter> createState() => _TextwriterState();
}

class _TextwriterState extends State<Textwriter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.newspaper, size: 40),
            Text("No data is there", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return TextDialog();
            },
          );
        },
        child: Icon(Icons.add, size: 30),
      ),
    );
  }
}
