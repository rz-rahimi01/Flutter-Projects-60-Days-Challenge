import 'package:aisentimentpp/providers/firebase_post.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MoodDailog extends StatefulWidget {
  const MoodDailog({super.key});

  @override
  State<MoodDailog> createState() => _MoodDailogState();
}

class _MoodDailogState extends State<MoodDailog> {
  final textkey = GlobalKey();
  bool isloading = false;
  late String result;
  late String message = "";
  final TextEditingController moodcontroller = TextEditingController();

  Future<void> getSentiment(String text) async {
    final response = await http.post(
      Uri.parse(
        'https://api-inference.huggingface.co/models/tabularisai/multilingual-sentiment-analysis',
      ),
      headers: {'Authorization': '', 'Content-Type': 'application/json'},
      body: jsonEncode({'inputs': text}),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  void sending(value) async {
    FirebasePost data = Provider.of<FirebasePost>(context, listen: false);
    result = await data.post(value);

    switch (result) {
      case "permission-denied":
        message = "You do not have permission to add data.";
        break;
      case "unavailable":
        message = "Service is temporarily unavailable. Try again later.";
        break;
      case "unknown-error":
        message = "An unexpected error occurred. Please try again.";
        break;
      case "success":
        message = "Mood posted successfully!";
        break;
      default:
        message = "Error: $result";
        break;
    }

    Flushbar(
      message: message,
      duration: Duration(milliseconds: 1000),
      backgroundColor: result == "success" ? Colors.green : Colors.red,
    ).show(context);
    setState(() {
      isloading = false; // Reset loading state
    });

    moodcontroller.clear(); // Clear the text field after posting
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss keyboard on tap outside
      },
      child: AlertDialog(
        backgroundColor: Colors.teal[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.deepPurple, width: 1),
        ),
        title: const Text("Mood Tracker"),
        content: const Text(
          "How You are feeling today? \nPlease write your mood in the text field below.",
        ),
        actions: [
          TextFormField(
            key: textkey,
            controller: moodcontroller,
            minLines: 1,
            maxLines: 3,
            decoration: InputDecoration(
              filled: true, // Enables background fill
              fillColor: Color.fromARGB(
                255,
                199,
                239,
                245,
              ), // Soft cyan background
              labelText: "Enter your mood",

              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  getSentiment(moodcontroller.text); // Call sentiment analysis
                  isloading = true; // Set loading state
                  setState(() {}); // Update the UI to show loading
                  sending(moodcontroller.text);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  side: const BorderSide(color: Colors.deepPurple),

                  shadowColor: Colors.black,
                  backgroundColor: Colors.teal[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child:
                    isloading
                        ? Padding(
                          padding: EdgeInsets.all(10),
                          child: const CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                        : const Text(
                          "Post Mood",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.deepPurple,
                          ),
                        ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
