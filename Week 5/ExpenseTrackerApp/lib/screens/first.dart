import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
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
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(indent: 20, endIndent: 20, color: Colors.black);
          },
          itemCount: dummyexpenses.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                " ${dummyexpenses[index].keys.first} : ${dummyexpenses[index].values.first.toString()}",
                style: TextStyle(fontSize: 25),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
