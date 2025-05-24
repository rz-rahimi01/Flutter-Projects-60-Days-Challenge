import 'package:aisentimentpp/models/mood_dailog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  late ScrollController movecontroller;
  bool _isFabVisible = true;

  final firebasedata =
      FirebaseFirestore.instance.collection("moods").snapshots();

  @override
  void initState() {
    super.initState();
    movecontroller = ScrollController();

    movecontroller.addListener(() {
      if (movecontroller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // Scrolling down - hide FAB
        if (_isFabVisible) setState(() => _isFabVisible = false);
      } else if (movecontroller.position.userScrollDirection ==
          ScrollDirection.forward) {
        // Scrolling up - show FAB
        if (!_isFabVisible) setState(() => _isFabVisible = true);
      }
    });
  }

  @override
  void dispose() {
    movecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 5,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
        ),
        centerTitle: true,
        title: const Text(
          "MoodTrack AI",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 175, 251, 233),
              Colors.teal.shade100,
              Colors.teal.shade300,
            ],
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: firebasedata,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.indigo,
                  strokeWidth: 3,
                ),
              );
            }

            if (snap.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 60,
                      color: Colors.red.shade300,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Something went wrong!",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red.shade400,
                      ),
                    ),
                  ],
                ),
              );
            }

            if (!snap.hasData || snap.data!.docs.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.receipt_long,
                      size: 60,
                      color: Colors.indigo.shade200,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "No Moods Added Yet",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.indigo.shade400,
                      ),
                    ),
                    Text(
                      "Tap + to add your first mood",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              controller: movecontroller,
              itemCount: snap.data!.docs.length,
              itemBuilder: (context, index) {
                return Card(
                  shadowColor: Colors.amber,
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                  child: ListTile(
                    title: Text(
                      snap.data!.docs[index]["MoodFeeling"],
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      snap.data!.docs[index]["Date"]
                          .toDate()
                          .toString()
                          .substring(0, 10),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: _isFabVisible ? 1.0 : 0.0,
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const MoodDailog(),
            );
          },
          backgroundColor: Colors.cyan[200],
          child: Icon(Icons.edit_note, color: Colors.black, size: 30),
        ),
      ),
    );
  }
}
