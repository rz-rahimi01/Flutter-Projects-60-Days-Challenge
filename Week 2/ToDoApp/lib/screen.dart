import 'package:flutter/material.dart';

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  List itemValues = [];
  List itemdone = [];
  bool isdone = false;

  TextEditingController mycontroller = TextEditingController();

  void clearing() {
    mycontroller.clear(); //clears the text in the textfield
  }

  void checkbox() {
    setState(() {});
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
        itemValues.add(mycontroller.text);
        itemdone.add(false);
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
              maxLines:
                  2, // tell that the textfield can show up to 2 lines and then it will scroll
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
              elevation: 4,
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
                  (context, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(color: Colors.deepPurple),
                  ),
              itemCount: itemValues.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(itemValues[index]),
                  background: Container(
                    color: Colors.green,
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.archive, color: Colors.white),
                    ),
                  ),

                  secondaryBackground: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                  direction: DismissDirection.horizontal,
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.startToEnd) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Added to archieve"),
                          duration: Duration(milliseconds: 200),
                        ),
                      );

                      //Temproray removing the items to show output as archived
                      setState(() {
                        itemValues.removeAt(index);
                        itemdone.removeAt(index);
                      });
                    } else {
                      setState(() {
                        itemValues.removeAt(index);
                        itemdone.removeAt(index);
                      });
                    }
                  },
                  //  child: ListTile(title: Text(itemValues[index])), that was simple listtile now we will use the listtile with the checkbox
                  child: CheckboxListTile(
                    title: Text(
                      itemValues[index],
                      style: TextStyle(
                        fontSize: 30,
                        decoration:
                            itemdone[index]
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                        decorationColor: Colors.red,
                        decorationThickness: 2,
                      ),
                    ),
                    value: itemdone[index],
                    onChanged: (bool? newValue) {
                      setState(() {
                        itemdone[index] = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
