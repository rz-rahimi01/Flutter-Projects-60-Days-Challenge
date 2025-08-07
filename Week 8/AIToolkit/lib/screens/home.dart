import 'package:aitoolkit/screens/image_generation.dart';
import 'package:aitoolkit/screens/image_generator.dart';
import 'package:aitoolkit/screens/settings.dart';
import 'package:aitoolkit/screens/textwriter.dart';
import 'package:aitoolkit/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1; // Default to Text Writer tab

  List<Widget> screens = [ImageGenerator(), Textwriter(), Settings()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _currentIndex == 0
            ? Text("Image Generator")
            : _currentIndex == 1
            ? Text("Text Writer")
            : Text("Settings"),
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: Bottombar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
