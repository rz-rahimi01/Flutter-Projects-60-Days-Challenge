import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesapp/models/theme_change.dart';
import 'package:quotesapp/screens/short_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List category = [
    "Based on Mood",
    "Hard Times",
    "Personal Growth",
    "Love and Relationships",
    "Depressed",
    "Work and Productivity",
  ];

  List image = [
    "assets/mood.png",
    "assets/hard_times.png",
    "assets/personal_growth.png",
    "assets/love_relationship.png",
    "assets/depressed.png",
    "assets/work_productivity.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Category Selection',
          style: TextStyle(
            //color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(Icons.light_mode),
          Consumer<ThemeChange>(
            builder: (context, themeProvider, child) {
              return Switch(
                value: themeProvider.isDark,
                onChanged: (value) {
                  themeProvider.change(value);
                },
              );
            },
          ),
          Icon(Icons.dark_mode),
        ],

        //backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: category.length,
              separatorBuilder: (context, index) {
                return Divider(indent: 10, endIndent: 10, thickness: 2);
              },
              itemBuilder:
                  (context, index) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ListTile(
                      title: Row(
                        children: [
                          Consumer<ThemeChange>(
                            builder: (context, value, child) {
                              return Image.asset(
                                "${image[index]}",
                                height: 70,
                                width: 70,
                                color:
                                    value.isDark ? Colors.white : Colors.black,
                              );
                            },
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: Text(
                              category[index] + index.toString(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShortScreen(ch: index),
                          ),
                        );
                      },
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
