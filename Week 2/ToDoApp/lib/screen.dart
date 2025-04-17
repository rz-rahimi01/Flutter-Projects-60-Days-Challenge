import 'package:flutter/material.dart';

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  TextEditingController mycontroller = TextEditingController();

  void clearing() {
    mycontroller.clear(); //clears the text in the textfield
  }

  void myprintftn() {
    if (mycontroller.text == '') {
      //if the textfield is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter a task"),
          backgroundColor: Colors.black,
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      // ignore: avoid_print
      print(mycontroller.text);
    } //takes text from the controller and prints it
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Todo App")),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: TextField(
              controller: mycontroller,
              minLines: 1, // tell the starting  size of the line
              maxLines: 2, // tell that the size of the line
              keyboardType:
                  TextInputType
                      .text, // tells which keyboard to show while user click on textfield
              decoration: InputDecoration(
                prefixIcon: InkWell(
                  onTap: () {
                    clearing();
                  },
                  child: Icon(Icons.close),
                ),
                labelText: "Add a new task",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),

          ElevatedButton.icon(
            onPressed: () {
              myprintftn();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.black),
              ),
            ),
            label: Text("Print"),
            icon: Icon(Icons.print),
          ),
        ],
      ),
    );
  }
}
