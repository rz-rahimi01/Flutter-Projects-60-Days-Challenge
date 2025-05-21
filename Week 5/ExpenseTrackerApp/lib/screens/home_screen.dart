import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensetracker/widgets/modalsheet.dart';
import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  final firestoreData =
      FirebaseFirestore.instance.collection("Entries").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Tracker",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white38, Colors.indigo.shade100],
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: firestoreData,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.indigo,
                  strokeWidth: 3,
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
                      "No Expenses Added Yet",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.indigo.shade400,
                      ),
                    ),
                    Text(
                      "Tap + to add your first expense",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
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
            return Scrollbar(
              thumbVisibility: true,
              thickness: 8,
              radius: Radius.circular(10),
              interactive: true,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    indent: 20,
                    endIndent: 20,
                    color: Colors.indigo.shade100,
                    height: 1,
                  );
                },
                itemCount: snap.data!.docs.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(snap.data!.docs[index].id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      padding: EdgeInsets.only(right: 25),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: Colors.red.shade400,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    confirmDismiss: (direction) async {
                      final bool confirmed = await showDialog(
                        context: context,
                        builder: (BuildContext dialog) {
                          return AlertDialog(
                            title: Text("Confirm Deletion"),
                            content: Text(
                              "Are you sure you want to delete this expense?",
                            ),
                            icon: Icon(
                              Icons.warning,
                              color: Colors.red,
                              size: 40,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            actions: [
                              TextButton(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.indigo),
                                ),
                                onPressed: () {
                                  Navigator.of(dialog).pop(false);
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  Navigator.of(dialog).pop(true);
                                },
                              ),
                            ],
                          );
                        },
                      );
                      return confirmed;
                    },
                    onDismissed: (direction) async {
                      final myScaffoldMessenger = ScaffoldMessenger.of(
                        context,
                      ); // ✅ Capture before await
                      await FirebaseFirestore.instance
                          .collection("Entries")
                          .doc(snap.data!.docs[index].id)
                          .delete();

                      myScaffoldMessenger.showSnackBar(
                        SnackBar(
                          content: Text("Expense removed successfully!"),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.fixed,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        title: Text(
                          snap.data!.docs[index]["title"],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo.shade800,
                          ),
                        ),
                        subtitle: Text(
                          snap.data!.docs[index]["date"],
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        trailing: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade50,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "\$${snap.data!.docs[index]["amount"]}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo.shade700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,

            context: context,
            builder: (context) => Modalsheet(),
          );
        },
        backgroundColor: Colors.indigo,
        elevation: 8,
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
