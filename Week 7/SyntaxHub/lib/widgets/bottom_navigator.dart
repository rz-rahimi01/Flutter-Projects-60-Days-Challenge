import 'package:flutter/material.dart';
import 'package:syntaxhub/screens/bookmarked.dart';
import 'package:syntaxhub/screens/first.dart';

class BottomNavigatorData extends StatelessWidget {
  const BottomNavigatorData({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SizedBox(
        height: 56, // Standard height for bottom navigation
        child: BottomAppBar(
          color: Colors.indigo,
          child: Container(
            padding: EdgeInsets.zero, // Remove any default padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center vertically
              children: [
                IconButton(
                  padding: EdgeInsets.zero, // Remove button padding
                  icon: Icon(Icons.home, color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => First()),
                    );
                  },
                ),
                IconButton(
                  padding: EdgeInsets.zero, // Remove button padding
                  icon: Icon(Icons.bookmark, color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                            Bookmarked(title: "Bookmarked Videos"),
                      ),
                    );
                  },
                ),
                IconButton(
                  padding: EdgeInsets.zero, // Remove button padding
                  icon: Icon(Icons.settings, color: Colors.white, size: 28),
                  onPressed: () {
                    // Handle settings button press
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
