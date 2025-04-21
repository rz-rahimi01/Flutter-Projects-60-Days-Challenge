import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/task_provider.dart';

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
    Provider.of<Tasks>(
      context,
      listen: false,
    ).taskadd(mycontroller.text, context);
    mycontroller.clear(); //clears the text in the textfield
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
          Consumer<Tasks>(
            builder: (context, value, child) {
              return Expanded(
                child: ListView.separated(
                  key: ValueKey(
                    value.itemValues.length,
                  ), // Add a key to track changes
                  // the benefit of the separated is that it gives a space between the list
                  // the listview.separated is used to create a listview with a separator between each item
                  separatorBuilder:
                      (context, index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(color: Colors.deepPurple),
                      ),
                  itemCount: value.itemValues.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: ValueKey(value.itemValues[index]),
                      // the key is used to identify the item in the list
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
                          value.taskdelete(index);
                        } else {
                          value.taskdelete(index);
                        }
                      },
                      //  child: ListTile(title: Text(itemValues[index])), that was simple listtile now we will use the listtile with the checkbox
                      child: CheckboxListTile(
                        title: Text(
                          value.itemValues[index],
                          style: TextStyle(
                            fontSize: 30,
                            decoration:
                                value.itemdone[index]
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                            decorationColor: Colors.red,
                            decorationThickness: 2,
                          ),
                        ),

                        value: value.itemdone[index],
                        onChanged: (bool? newValue) {
                          value.taskdone(index);
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
