import 'package:expensetracker/providers/firebase_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Modalsheet extends StatefulWidget {
  const Modalsheet({super.key});

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
        datecontroller.text = "${selecteddate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> firebasepush() async {
    double amount = double.tryParse(amountcontroller.text) ?? 0;
    setState(() => isloading = true);
    final povi = Provider.of<FirebaseAdd>(context, listen: false);

    String result = await povi.add(
      titlecontroller.text,
      amount,
      datecontroller.text,
    );

    if (result == "success") {
      setState(() => isloading = false);
      // ignore: use_build_context_synchronously
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
    }
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ), // Adjust for keyboard
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 100)],
        ),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  //That small line type
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Text(
                  "Add New Expense",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titlecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Title can't be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Title",
                          labelStyle: TextStyle(color: Colors.grey[600]),
                          filled: true,
                          fillColor: Colors.grey[50],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          prefixIcon: Icon(Icons.title, color: Colors.indigo),
                        ),
                        style: TextStyle(color: Colors.black87),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: amountcontroller,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*'),
                          ),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter an amount';
                          } else if (!RegExp(
                            r'^\d+(\.\d*)?$',
                          ).hasMatch(value)) {
                            return 'Invalid number format';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Amount",
                          labelStyle: TextStyle(color: Colors.grey[600]),
                          filled: true,
                          fillColor: Colors.grey[50],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),

                          prefixIcon: Icon(
                            Icons.attach_money,
                            color: Colors.indigo,
                          ),
                        ),
                        style: TextStyle(color: Colors.black87),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: datecontroller,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: "Date",
                          labelStyle: TextStyle(color: Colors.grey[600]),
                          filled: true,
                          fillColor: Colors.grey[50],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: Colors.indigo,
                          ),
                        ),
                        onTap: () => selectdate(context),
                        style: TextStyle(color: Colors.black87),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              firebasepush();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 2,
                          ),
                          child:
                              isloading
                                  ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                  : Text(
                                    "ADD EXPENSE",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                        ),
                      ),
                    ],
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
