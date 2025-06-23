import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoSelection extends StatefulWidget {
  final String title;
  const VideoSelection({super.key, required this.title});

  @override
  State<VideoSelection> createState() => _VideoSelectionState();
}

class _VideoSelectionState extends State<VideoSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.title),
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        elevation: 3,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                elevation: 3,
                child: ListTile(
                  leading: Icon(Icons.video_library, size: 40),
                  title: Text("Video Title ${index + 1}"),
                  subtitle: Text("Duration: 12:34"),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.play, size: 20),
                      SizedBox(height: 10),
                      Icon(FontAwesomeIcons.bookmark, size: 20),
                    ],
                  ),
                ),
              );
            },
            itemCount: 10, // Example count, replace with actual data length
          ),
        ),
      ),
    );
  }
}
