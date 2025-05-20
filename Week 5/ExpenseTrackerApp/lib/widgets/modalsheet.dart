import 'package:expensetracker/models/expenses.dart';
import 'package:expensetracker/providers/expense_provider.dart';
import 'package:expensetracker/providers/firebase_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Modalsheet extends StatefulWidget {
  final BuildContext parentContext;
  const Modalsheet({super.key, required this.parentContext});

  @override
  State<Modalsheet> createState() => _ModalsheetState();
}

class _ModalsheetState extends State<Modalsheet> {
  DateTime selecteddate = DateTime.now();
  bool isloading = false;

  @override
  void initState() {
    super.initState();
    datecontroller.text = "${selecteddate.toLocal()}".split(' ')[0];
  }

  final formkey = GlobalKey<FormState>();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();

  Future selectdate(BuildContext context) async {
    DateTime? pickdate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );

    if (pickdate != null) {
      selecteddate = pickdate;

      setState(() {
        datecontroller.text =
            "${selecteddate.toLocal()}".split(' ')[0]; // Format as YYYY-MM-DD
      });
    }
  }

  Future<void> firebasepush() async {
    double amount = double.tryParse(amountcontroller.text) ?? 0;
    setState(() => isloading = true); // Start loading
    final povi = Provider.of<FirebaseAdd>(context, listen: false);

    String result = await povi.add(
      titlecontroller.text,
      amount,
      datecontroller.text,
    );

    if (result == "success") {
      valueAdd();
      setState(() => isloading = false);
      Navigator.pop(context);
    } else {
      setState(() => isloading = false);
      switch (result) {
        case "permission-denied":
          Fluttertoast.showToast(
            msg: "You do not have permission to add data.",
          );
          break;
        case "unavailable":
          Fluttertoast.showToast(
            msg: "Service is temporarily unavailable. Try again later.",
          );
          break;
        case "unknown-error":
          Fluttertoast.showToast(
            msg: "An unexpected error occurred. Please try again.",
          );
          break;
        default:
          Fluttertoast.showToast(
            msg: "Error: $result",
          ); // fallback if new error codes show up
      }

      // Fluttertoast.showToast(msg: result);
    }
  }

  void valueAdd() {
    final pov = Provider.of<ExpensePro>(context, listen: false);
    double amount = double.tryParse(amountcontroller.text) ?? 0;

    pov.add(
      Expenses(
        id: "2",
        title: titlecontroller.text,
        amount: amount,
        date: selecteddate,
      ),
    );
  }

  @override
  void dispose() {
    titlecontroller.dispose();
    amountcontroller.dispose();
    datecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Ensures taps on empty (transparent) space are still detected
      // Without this, onTap won't trigger when tapping non-widget areas
      //behavior: HitTestBehavior.deferToChild  ← This is the default
      behavior: HitTestBehavior.opaque,

      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: titlecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Title can't be empty";
                    }
                    return null; // No error
                  },
                  decoration: InputDecoration(
                    label: Text("Title", style: TextStyle(color: Colors.black)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: amountcontroller,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter an amount';
                    } else if (!RegExp(r'^\d+(\.\d*)?$').hasMatch(value)) {
                      return 'Invalid number format';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      "Amount",
                      style: TextStyle(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                TextField(
                  controller: datecontroller,
                  readOnly: true,

                  decoration: InputDecoration(
                    label: Text("Date", style: TextStyle(color: Colors.black)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  onTap: () => selectdate(context),
                ),

                SizedBox(height: 40),
                Center(
                  child:
                      isloading
                          ? CircularProgressIndicator()
                          : ElevatedButton.icon(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                firebasepush();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(80, 40), // width, height
                              backgroundColor: Colors.orangeAccent[200],
                              side: BorderSide(color: Colors.orange, width: 2),
                              elevation: 2,
                            ),
                            label: Text(
                              "Add",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
