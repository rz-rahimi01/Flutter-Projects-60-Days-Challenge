import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensetracker/providers/expense_provider.dart';
import 'package:expensetracker/widgets/modalsheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  final firestoreData =
      FirebaseFirestore.instance.collection("Entries").snapshots();
  List dummyexpenses = [
    {"Food": 40},
    {"Transportation": 25},
    {"Rent": 1200},
    {"Utilities": 150},
    {"Entertainment": 60},
    {"Clothing": 75},
    {"Healthcare": 45},
    {"Education": 200},
    {"Groceries": 85},
    {"Phone Bill": 50},
    {"Internet": 65},
    {"Gym Membership": 30},
    {"Coffee": 35},
    {"Books": 55},
    {"Gifts": 100},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expenses",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(),
        child: StreamBuilder<QuerySnapshot>(
          stream: firestoreData,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snap.hasData) {
              return Center(child: Text("No Data Availible"));
            }
            if (snap.hasError) {
              return Center(child: Text("Unknown Error Occured"));
            }
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(indent: 20, endIndent: 20, color: Colors.black);
              },
              itemCount: snap.data!.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snap.data!.docs[index]["title"],
                    style: TextStyle(fontSize: 25),
                  ),
                  subtitle: Text(snap.data!.docs[index]["date"]),
                  trailing: Text("\$ ${snap.data!.docs[index]["amount"]}"),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: Consumer<ExpensePro>(
        builder: (context, value, child) {
          return FloatingActionButton(
            onPressed: () {
              // value.add(
              //   Expenses(
              //     title: "Dummy",
              //     amount: 2,
              //     date: DateTime.now(),
              //     id: "Dummy",
              //   ),
              // );

              showModalBottomSheet(
                backgroundColor: Colors.deepOrange[100],
                context: context,
                builder: (context) => Modalsheet(parentContext: context),
              );
            },
            backgroundColor: Colors.deepOrange,
            child: Icon(Icons.add, color: Colors.white, size: 30),
          );
        },
      ),
    );
  }
}
