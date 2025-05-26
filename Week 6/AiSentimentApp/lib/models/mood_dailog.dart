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
  final textkey = GlobalKey();
  bool isloading = false;
  late String result;
  late String message = "";
  final TextEditingController moodcontroller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final sentimentApi = Provider.of<SentimentApi>(context);
    if (sentimentApi.statusMessage != null) {
      Flushbar(
        message: sentimentApi.statusMessage,
        duration: Duration(seconds: 1),
        backgroundColor: Colors.teal,
      ).show(context);
    }
  }

  void sending(context, moodtext) async {
    SentimentApi data = Provider.of<SentimentApi>(context, listen: false);
    result = await data.uploadapi(context, moodcontroller.text);
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
                onPressed: () async {
                  setState(() {
                    isloading = true;
                  });

                  sending(context, moodcontroller.text); // Only one call

                  setState(() {
                    isloading = false;
                  });
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
