import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syntaxhub/widgets/bottom_navigator.dart';
import 'package:syntaxhub/widgets/drawer.dart';
import 'package:syntaxhub/screens/video_selection.dart';
import 'package:syntaxhub/widgets/feature_carousel.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  final Map<String, List<Color>> itemGradients = {
    "Python": [Colors.blue, Colors.yellow],
    "Java": [Colors.orange, Colors.red],
    "C++": [Colors.indigo, Colors.blueGrey],
    "JavaScript": [Colors.yellow, Colors.orange],
    "Dart": [Colors.lightBlue, Colors.blue],
    "Ruby": [Colors.red, Colors.pink],
    "PHP": [Colors.purple, Colors.deepPurple],
    "Swift": [Colors.deepOrange, Colors.orangeAccent],
    "Flutter": [Colors.cyan, Colors.blueAccent],
  };

  final List items = [
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

  final List icons = [
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

  final Color primaryColor = const Color(0xFF1a1a2e);
  final Color secondaryColor = const Color(0xFF16213e);
  final Color accentColor = const Color(0xFF0f3460);
  final Color textColor = Colors.white;

  // Pre-calculated colors with opacity
  final Color primaryWithOpacity = const Color.fromRGBO(26, 26, 46, 0.8);
  final Color accentWithOpacity = const Color.fromRGBO(15, 52, 96, 0.9);
  final Color borderColor = const Color.fromRGBO(255, 255, 255, 0.1);
  final Color shadowColor = const Color.fromRGBO(0, 0, 0, 0.3);
  final Color textColorWithOpacity = const Color.fromRGBO(255, 255, 255, 0.9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'SyntaxHub',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: textColor,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {
              // Notification logic
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Search logic
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [primaryColor, secondaryColor],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [primaryColor, secondaryColor],
                    ),
                  ),
                  child: const FeatureCarousel(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  child: Text(
                    "All Categories:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColorWithOpacity,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 1.0,
                        ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  VideoSelection(title: items[index]),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [primaryWithOpacity, accentWithOpacity],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: shadowColor,
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            border: Border.all(color: borderColor, width: 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors:
                                      itemGradients[items[index]] ??
                                      [Colors.grey, Colors.black],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(bounds),
                                child: Icon(
                                  icons[index],
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                items[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigatorData(),
      drawer: DrawerData(),
    );
  }
}
