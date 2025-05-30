import 'package:aisentimentpp/models/mood_dailog.dart';
import 'package:aisentimentpp/providers/theme_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  late ScrollController movecontroller;
  bool _isFabVisible = true;

  final firebasedata =
      FirebaseFirestore.instance
          .collection("moods")
          .orderBy("Date", descending: true)
          .snapshots();

  // Track expanded items using their index
  final Set<int> expandedItems = {};

  String emoji(String first) {
    if (first == "Very Positive") return '😄'; // very happy, big smile
    if (first == "Positive") return '😊'; // happy, gentle smile
    if (first == "Neutral") return '😐'; // neutral face
    if (first == "Negative") return '😟'; // worried, concerned
    if (first == "Very Negative") return '😞'; // disappointed, sad
    return '😶'; // default to neutral face if no match
  }

  @override
  void initState() {
    super.initState();
    movecontroller = ScrollController();

    movecontroller.addListener(() {
      if (movecontroller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isFabVisible) setState(() => _isFabVisible = false);
      } else if (movecontroller.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isFabVisible) setState(() => _isFabVisible = true);
      }
    });
  }

  @override
  void dispose() {
    movecontroller.dispose();
    super.dispose();
  }

  Color _getSentimentColor(double score) {
    if (score > 0.75) return Colors.green.shade700;
    if (score > 0.5) return Colors.green.shade400;
    if (score > 0.25) return Colors.orange.shade400;
    return Colors.red.shade400;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //  backgroundColor: Colors.teal[50],
      appBar: AppBar(
        actions: [
          Icon(Icons.light_mode, color: Colors.white),
          Consumer<ThemeProvider>(
            builder: (context, themepro, child) {
              return Switch(
                value: themepro.isDarkMode,
                onChanged: (value) {
                  themepro.changeTheme(value);
                },
              );
            },
          ),
          Icon(Icons.dark_mode, color: Colors.white),
        ],

        elevation: 5,

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
        ),
        centerTitle: true,
        title: const Text(
          "MoodTrack AI",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:
                Theme.of(context).brightness == Brightness.dark
                    ? [
                      Colors.grey.shade900,
                      Colors.grey.shade800,
                      const Color.fromARGB(255, 122, 150, 146),
                    ]
                    : [
                      const Color.fromARGB(255, 223, 255, 252),
                      const Color.fromARGB(255, 157, 203, 198),
                      Colors.teal.shade300,
                    ],
          ),
        ),
        child: SafeArea(
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
                      const SizedBox(height: 16),
                      Text(
                        "Something went wrong!",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red.shade400,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Please try again later",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red.shade300,
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
                      const SizedBox(height: 16),
                      Text(
                        "No Moods Added Yet",
                        style: TextStyle(
                          fontSize: 18,
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.indigo.shade400,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Tap + to add your first mood",
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.indigo.shade400,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                controller: movecontroller,
                padding: const EdgeInsets.only(top: 20, bottom: 50),
                itemCount: snap.data!.docs.length,
                itemBuilder: (context, index) {
                  final doc = snap.data!.docs[index];
                  final sentiment = doc["Sentiment"];
                  final fullText = doc["MoodFeeling"];
                  final isExpanded = expandedItems.contains(index);
                  final isLong = fullText.length > 50;

                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 8,
                          offset: const Offset(5, 2),
                        ),
                      ],
                    ),
                    child: Card(
                      elevation: 0,
                      color: Theme.of(context).cardTheme.color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isExpanded || !isLong
                                  ? fullText
                                  : "${fullText.substring(0, 50)}...",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.indigo,
                              ),
                            ),
                            if (isLong)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isExpanded) {
                                      expandedItems.remove(index);
                                    } else {
                                      expandedItems.add(index);
                                    }
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    isExpanded ? "See less" : "See more",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.blue.shade700,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  "Time: ${doc["Date"].toDate().toString().substring(11, 16)} Date: ${doc["Date"].toDate().toString().substring(0, 10)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.grey.shade800
                                        : Colors.teal[50],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Sentiment Analysis: ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.indigo,
                                        ),
                                      ),
                                      Text(
                                        emoji(sentiment[0]["label"]),
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.indigo,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  ...List.generate(sentiment.length, (i) {
                                    final label = sentiment[i]["label"];
                                    final score =
                                        sentiment[i]["score"] as double;
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              label,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color:
                                                    Theme.of(
                                                              context,
                                                            ).brightness ==
                                                            Brightness.dark
                                                        ? Colors.white
                                                        : Colors.grey.shade700,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: LinearProgressIndicator(
                                              value: score,
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                    _getSentimentColor(score),
                                                  ),
                                              minHeight: 12,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            (score * 100).toStringAsFixed(2),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: _getSentimentColor(score),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: _isFabVisible ? 1.0 : 0.0,
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const MoodDailog(),
            );
          },
          backgroundColor:
              Theme.of(context).floatingActionButtonTheme.backgroundColor,
          elevation: 4,
          child: const Icon(Icons.edit_note, size: 30),
        ),
      ),
    );
  }
}
