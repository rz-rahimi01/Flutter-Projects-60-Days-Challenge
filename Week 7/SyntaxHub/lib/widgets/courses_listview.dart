import 'package:flutter/material.dart';
import 'package:syntaxhub/screens/video_selection.dart';

class CoursesListview extends StatefulWidget {
  List<Map<String, dynamic>> datainfo;

  CoursesListview({super.key, required this.datainfo});

  @override
  State<CoursesListview> createState() => _CoursesListviewState();
}

class _CoursesListviewState extends State<CoursesListview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Add fixed height for horizontal ListView

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.datainfo.length,
        itemBuilder: (context, index) {
          final info = widget.datainfo[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoSelection(title: info["name"]),
                ),
              );
            },
            child: Container(
              width: 180, // Add fixed width for each item
              height: 140,
              margin: const EdgeInsets.only(
                right: 5,
                top: 10,
                bottom: 10,
                left: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: Theme.of(context).brightness == Brightness.dark
                      ? [Color(0xFF1a1a2e), Color(0xFF0f3460)]
                      : [const Color(0xFF667eea), const Color(0xFF764ba2)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white24
                        : Colors.black38,
                    spreadRadius: 3,
                    blurRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? info['lightColor'].withOpacity(0.3)
                          : info['darkColor'].withOpacity(0.3),

                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? info['lightColor']
                            : info['darkColor'],
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      info["icon"],
                      size: 40,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? info['lightColor']
                          : info['darkColor'],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    info["name"],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
        // shrinkWrap: true,
      ),
    );
  }
}

class Texty extends StatelessWidget {
  String textdata;
  Texty({super.key, required this.textdata});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "$textdata:",
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.deepPurpleAccent
              : Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
