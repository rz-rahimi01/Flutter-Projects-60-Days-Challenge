import 'package:flutter/material.dart';

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  int itemnbr = 0;
  List itemValues = [];

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
      setState(() {
        itemnbr++;
        itemValues.add(mycontroller.text);
        mycontroller.clear();
      });
    }
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
            label: Text("Add "),
            icon: Icon(Icons.add),
          ),
          Expanded(
            child: ListView.separated(
              key: ValueKey(itemValues.length), // Add a key to track changes
              // the benefit of the separated is that it gives a space between the list
              // the listview.separated is used to create a listview with a separator between each item
              separatorBuilder:
                  (context, index) => Divider(color: Colors.purpleAccent),
              itemCount: itemValues.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(itemValues[index]),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      itemValues.removeAt(index);
                    });
                  },
                  child: ListTile(title: Text(itemValues[index])),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
