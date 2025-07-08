import 'package:flutter/material.dart';

class TextDialog extends StatefulWidget {
  const TextDialog({super.key});

  @override
  State<TextDialog> createState() => _TextDialogState();
}

class _TextDialogState extends State<TextDialog> {
  String selected = "Formal";

  void selection(txt) {
    setState(() {
      selected = txt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Enter your text here",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),
            TextField(
              maxLines: 8,
              maxLength: 100,
              minLines: 1,
              decoration: InputDecoration(
                label: Text(
                  "Type your text here",
                  style: TextStyle(fontSize: 15),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 15,
              runSpacing: 5,
              // alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selection("Formal");
                  },
                  child: Text("Formal"),
                ),
                ElevatedButton(
                  onPressed: () {
                    selection("Frustrated");
                  },
                  child: Text("Fustrated"),
                ),
                ElevatedButton(
                  onPressed: () {
                    selection("Poetic");
                  },
                  child: Text("Poetic"),
                ),
                ElevatedButton(
                  onPressed: () {
                    selection("Friendly");
                  },
                  child: Text("Friendly"),
                ),
              ],
            ),
            SizedBox(height: 10),

            Text(
              textAlign: TextAlign.center,
              "Selected tone of your text is : \n $selected",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 205, 175, 255),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
