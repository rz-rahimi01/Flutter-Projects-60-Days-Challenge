import 'package:aitoolkit/providers/api_upload.dart';
import 'package:aitoolkit/providers/firebase_upload.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextDialog extends StatefulWidget {
  const TextDialog({super.key});

  @override
  State<TextDialog> createState() => _TextDialogState();
}

class _TextDialogState extends State<TextDialog> {
  late Stream<QuerySnapshot> apikey;

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  Future<void> push() async {
    if (textTosend.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("❗ Please enter some text")));
      return;
    }

    setState(() => isLoading = true);

    try {
      final apiPov = Provider.of<ApiUpload>(context, listen: false);
      List apiResults = await apiPov.sendToApi(textTosend.text, selected);

      if (apiResults[0] == "success") {
        final apiData = apiResults[1];

        final firPov = Provider.of<FirebaseAdd>(context, listen: false);
        String firebaseResult = await firPov.upload(
          textTosend.text,
          selected,
          apiData['paraphrase'],
        );

        if (firebaseResult == "success") {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("✅ Text uploaded successfully!")),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("🔥 Firebase upload failed: $firebaseResult"),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("🛑 API error: ${apiResults[1]}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("❌ Unexpected error: $e")));
    } finally {
      setState(() => isLoading = false);
    }
  }

  String selected = "formal";
  TextEditingController textTosend = TextEditingController();

  void selection(txt) {
    setState(() {
      selected = txt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss keyboard on tap outside
      },
      child: Dialog(
        child: SingleChildScrollView(
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
                  controller: textTosend,
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
                        selection("formal");
                      },
                      child: Text("Formal"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        selection("cooperative");
                      },
                      child: Text("Cooperative"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        selection("informal");
                      },
                      child: Text("Informal"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        selection("pessimistic");
                      },
                      child: Text("Pessimistic"),
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

                //    Text(result.isEmpty ? "nothing" : result),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await push();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 205, 175, 255),
                    ),
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Text(
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
        ),
      ),
    );
  }
}
