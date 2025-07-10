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
  late Stream<QuerySnapshot> firebasedata;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    firebasedata = FirebaseFirestore.instance
        .collection("app")
        .doc("data")
        .collection("texts")
        .snapshots();
  }

  late String result;

  Future<void> push() async {
    setState(() => isLoading = true);
    final povi = Provider.of<FirebaseAdd>(context, listen: false);

    String results = await povi.upload(textTosend.text);

    if (results == "success") {
      setState(() {
        isLoading = false;
      });
    }
  }

  String selected = "Formal";
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

              //    Text(result.isEmpty ? "nothing" : result),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Consumer<FirebaseAdd>(
                  builder: (context, value, add) {
                    return ElevatedButton(
                      onPressed: () {
                        push();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          205,
                          175,
                          255,
                        ),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
