import 'package:flutter/material.dart';

class MyUi extends StatefulWidget {
  const MyUi({super.key});

  @override
  State<MyUi> createState() => _MyUiState();
}

class _MyUiState extends State<MyUi> {
  String btntext =
      "Follow"; // This is initail value means runs only for the first time and after that it will not run
  void btntxtFtn() {
    setState(() {
      btntext =
          btntext == "Follow"
              ? "Unfollow"
              : "Follow"; // here we are seeing is the current value of variable btntext is equal to Follow or not if it is then we will change the value to Unfollow and if it is not then we will change the value to Follow
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30),

            // padding: EdgeInsets.symmetric(
            //   vertical: 20,
            //   horizontal: 20,
            // ),  this will add padding to the top and bottom
            padding: EdgeInsets.all(20),
            color: Colors.lightBlue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),

                      child: CircleAvatar(
                        foregroundImage: AssetImage("assets/profile.jpg"),
                        radius: 50,
                        child: Text("Profile Photo"),
                        //we usded the foreground because if incase the image is not found the text will be shown
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "John Doe",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "This is a sample of Bio in Profile  This is the text of next line",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  maxLines:
                      1, // i have set the max lines to 1 to it will show only the text of one line
                  overflow:
                      TextOverflow
                          .ellipsis, // adds the dots when the max lines limits reaches
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    btntxtFtn();
                  }, // this is the function that will be called when the button is pressed
                  child: Text(
                    btntext,
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight:
                          FontWeight.w900, //used for the boldness of the text
                    ),
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
