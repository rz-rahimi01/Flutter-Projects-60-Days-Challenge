import 'package:expensetracker/models/expenses.dart';
import 'package:expensetracker/providers/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Modalsheet extends StatefulWidget {
  const Modalsheet({super.key});

  @override
  State<Modalsheet> createState() => _ModalsheetState();
}

class _ModalsheetState extends State<Modalsheet> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();

  DateTime? selecteddate;
  Future selectdate(BuildContext context) async {
    DateTime? pickdate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );

    if (pickdate != null) {
      selecteddate = pickdate;
    } else {
      selecteddate = DateTime.now();
    }

    setState(() {
      datecontroller.text =
          "${selecteddate!.toLocal()}".split(' ')[0]; // Format as YYYY-MM-DD
    });
  }

  void valueAdd() {
    final pov = Provider.of<ExpensePro>(context, listen: false);

    double? amount = double.tryParse(amountcontroller.text);

    if (amount == null) {
      return;
    }

    pov.add(
      Expenses(
        id: "2",
        title: titlecontroller.text,
        amount: amount,
        date: selecteddate!,
      ),
    );
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
          child: Column(
            children: [
              TextField(
                controller: titlecontroller,
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
              SizedBox(height: 50),
              TextField(
                controller: amountcontroller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d*)?$')),
                ],
                decoration: InputDecoration(
                  label: Text("Amount", style: TextStyle(color: Colors.black)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),

              SizedBox(height: 50),
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

              SizedBox(height: 50),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    valueAdd();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(80, 40), // width, height
                    backgroundColor: Colors.orangeAccent[200],
                    side: BorderSide(color: Colors.orange, width: 2),
                    elevation: 2,
                  ),
                  label: Text(
                    "Add",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
