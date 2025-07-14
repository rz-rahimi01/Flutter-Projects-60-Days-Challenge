import 'package:aitoolkit/screens/textwriter_details.dart';
import 'package:aitoolkit/widgets/text_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Textwriter extends StatefulWidget {
  const Textwriter({super.key});

  @override
  State<Textwriter> createState() => _TextwriterState();
}

class _TextwriterState extends State<Textwriter> {
  late Stream<QuerySnapshot> firebasedata;
  @override
  void initState() {
    super.initState();
    firebasedata = FirebaseFirestore.instance
        .collection("app")
        .doc("data")
        .collection("textWriter")
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: firebasedata,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Loading data...",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              );
            }

            if (snap.hasError) {
              return Center(child: Text("Error: ${snap.error}"));
            }

            if (!snap.hasData || snap.data!.docs.isEmpty) {
              return Center(child: Text("No data available"));
            }

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: snap.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      snap.data!.docs[index]['userText'] ?? 'No text',
                    ),
                    subtitle: Text(
                      snap.data!.docs[index]['response'] ?? 'No type',
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TextwriterDetails(
                            userText:
                                snap.data!.docs[index]['userText'] ?? 'No text',

                            tone: snap.data!.docs[index]['tone'] ?? 'No tone',
                            response:
                                snap.data!.docs[index]['response'] ??
                                'No response',
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
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
