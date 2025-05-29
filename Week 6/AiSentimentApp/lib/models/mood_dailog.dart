import 'package:aisentimentpp/providers/sentiment_api.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoodDailog extends StatefulWidget {
  const MoodDailog({super.key});

  @override
  State<MoodDailog> createState() => _MoodDailogState();
}

class _MoodDailogState extends State<MoodDailog> {
  final textkey = GlobalKey<FormState>();
  bool isloading = false;
  // late String result;
  late String message = "";
  final TextEditingController moodcontroller = TextEditingController();
  int currentlength = 0;
  int maximumcharacters = 100;

  // Future<void> sending(context, moodtext) async {
  //   SentimentApi data = Provider.of<SentimentApi>(context, listen: false);
  //   result = await data.uploadapi(context, moodcontroller.text);
  // }

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
          Form(
            key: textkey,
            child: TextFormField(
              controller: moodcontroller,
              validator:
                  (value) =>
                      value!.isEmpty
                          ? "Please enter your mood"
                          : null, // Validation for empty input
              minLines: 1,
              maxLines: 3,
              maxLength: maximumcharacters,
              onChanged: (value) {
                setState(() {
                  currentlength = value.length;
                });
              },

              decoration: InputDecoration(
                filled: true, // Enables background fill
                fillColor: Color.fromARGB(
                  255,
                  199,
                  239,
                  245,
                ), // Soft cyan background
                labelText: "Enter your mood",
                counterText: "$currentlength / $maximumcharacters",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (!textkey.currentState!.validate()) {
                    return;
                  }

                  setState(() {
                    isloading = true;
                  });

                  // await sending(context, moodcontroller.text); // Only one call

                  final sentimentApi = Provider.of<SentimentApi>(
                    context,
                    listen: false,
                  );

                  String firebasePostResult = await sentimentApi.uploadapi(
                    context,
                    moodcontroller.text,
                  );
                  //Immediately show sentiment received message first
                  if (mounted) {
                    // The Flushbar needs a context that is a descendant of the Scaffold
                    // or MaterialApp, which MoodDailog's context is.
                    await Flushbar(
                      message:
                          sentimentApi.statusMessage ??
                          "Processing...", // Use message from provider
                      duration: Duration(
                        seconds: 1,
                      ), // Increased duration slightly
                      backgroundColor:
                          firebasePostResult == "success"
                              ? Colors
                                  .green // Green for success
                              : Colors
                                  .teal, // Teal for other messages (or red for errors if you prefer)
                      // ignore: use_build_context_synchronously
                    ).show(context); // Use the dialog's context
                  }

                  // Check if the operation was successful and pop the dialog
                  if (firebasePostResult == "success") {
                    if (mounted) {
                      // Check if the widget is still in the tree
                      Navigator.of(context).pop(); // Pop the dialog
                    }
                    // No need to set isloading = false here if we are popping
                    return; // Exit early if popped
                  }

                  // If not successful, or if still mounted (e.g., pop didn't happen)
                  // ensure loading state is reset.
                  if (mounted) {
                    setState(() {
                      isloading = false;
                    });
                  }
                },

                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  side: const BorderSide(color: Colors.black),

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
                            color: Colors.black,
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
