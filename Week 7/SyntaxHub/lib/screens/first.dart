import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  List items = [
    "Python",
    "Java",
    "C++",
    "JavaScript",
    "Dart",
    "Ruby",
    "PHP",
    "Swift",
    "Flutter",
  ];

  List icons = [
    FontAwesomeIcons.python,
    FontAwesomeIcons.java,
    FontAwesomeIcons.cuttlefish,
    FontAwesomeIcons.js,
    FontAwesomeIcons.dartLang,
    FontAwesomeIcons.diamond,
    FontAwesomeIcons.php,
    FontAwesomeIcons.swift,
    FontAwesomeIcons.flutter,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Main Menu"),
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        elevation: 3,
      ),
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All Categories :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),

                SizedBox(height: 10),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Creates 3 columns in a vertical grid
                      mainAxisSpacing: 30, // Spacing between items vertically
                      crossAxisSpacing:
                          25.0, // Spacing between items horizontally
                      childAspectRatio:
                          1.0, // Ratio of width to height of each item
                    ),
                    itemCount:
                        items.length, // Total number of items in the grid
                    itemBuilder: (context, index) {
                      return GridTile(
                        child: GestureDetector(
                          onTap: () {
                            // Handle item tap
                            print("Tapped on ${items[index]}");
                          },
                          child: Card(
                            elevation: 5,
                            shadowColor: Colors.black,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  icons[index], // Display the icon for each item
                                  size: 50,
                                  color: Colors.indigo,
                                ),
                                SizedBox(height: 15),
                                Text(
                                  items[index], // Display the item name
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },

                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
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
