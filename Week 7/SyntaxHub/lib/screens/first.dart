import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syntaxhub/models/languages.dart';
import 'package:syntaxhub/providers/theme_provider.dart';
import 'package:syntaxhub/screens/notifications.dart';
import 'package:syntaxhub/widgets/courses_listview.dart';
import 'package:syntaxhub/widgets/drawer.dart';
import 'package:syntaxhub/widgets/feature_carousel.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        elevation: 0,
        title: Text(
          'SyntaxHub',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsScreen()),
              );
            },
          ),
          Icon(
            Icons.light_mode_outlined,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
          Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
          Icon(
            Icons.dark_mode_outlined,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ],
        scrolledUnderElevation: 0,
      ),
      drawer: DrawerData(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Feature Carousel
            Container(
              height: 250,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: const FeatureCarousel(),
            ),

            const SizedBox(height: 5),

            // All Categories Section
            Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: Theme.of(context).brightness == Brightness.dark
                      ? [
                          Color.fromARGB(255, 29, 72, 124),
                          Color.fromARGB(255, 29, 72, 124),
                        ]
                      : [Colors.white, Colors.white],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white24
                        : Colors.black26,
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Texty(textdata: "Programming Languages"),
                  CoursesListview(datainfo: programmingLanguages),
                  Texty(textdata: "Graphics Designing"),
                  CoursesListview(datainfo: graphicsDesigning),
                  Texty(textdata: "Machine Learning"),
                  CoursesListview(datainfo: machineLearningAI),
                  Texty(textdata: "Web Development"),
                  CoursesListview(datainfo: webDevelopment),
                  Texty(textdata: "Mobile Development"),
                  CoursesListview(datainfo: mobileDevelopment),
                  Texty(textdata: "Cloud Computing"),
                  CoursesListview(datainfo: cloudComputing),
                  Texty(textdata: "DevOps Tools"),
                  CoursesListview(datainfo: devOpsTools),
                  Texty(textdata: "Database Backend"),
                  CoursesListview(datainfo: databaseBackend),
                  Texty(textdata: "Cyber Security"),
                  CoursesListview(datainfo: cybersecurity),
                  Texty(textdata: "DataScience Analytics"),
                  CoursesListview(datainfo: dataScienceAnalytics),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
