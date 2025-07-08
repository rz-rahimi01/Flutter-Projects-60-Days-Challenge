import 'package:flutter/material.dart';

class Bottombar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const Bottombar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blueGrey,
      type: BottomNavigationBarType.shifting, // Required!
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.image, color: Colors.white),
          label: "Image Generator",
          backgroundColor: Colors.deepPurpleAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.text_fields, color: Colors.white),
          label: "Text Writer",
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: Colors.white),
          label: "Settings",
          backgroundColor: Colors.indigo,
        ),
      ],
    );
  }
}
