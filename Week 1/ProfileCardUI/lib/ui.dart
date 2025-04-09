import 'package:flutter/material.dart';

class MyUi extends StatelessWidget {
  const MyUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            height: 350,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  foregroundImage: AssetImage("assets/profile.jpg"),
                  radius: 80,
                  child: Text("Profile Photo"),
                  //we usded the foreground because if incase the image is not found the text will be shown
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Github Account :"), Text("@johndoe")],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
