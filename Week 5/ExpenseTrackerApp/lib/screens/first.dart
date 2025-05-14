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
        child: Consumer<ExpensePro>(
          builder: (context, value, child) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(indent: 20, endIndent: 20, color: Colors.black);
              },
              itemCount: value.myexpense.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    value.myexpense[index].title,
                    style: TextStyle(fontSize: 25),
                  ),
                  subtitle: Text(
                    value.myexpense[index].date.toString().split(' ')[0],
                  ), // 👈 access date
                  trailing: Text(
                    '\$${value.myexpense[index].amount}',
                  ), // 👈 access amount
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
                builder: (context) => Modalsheet(),
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
