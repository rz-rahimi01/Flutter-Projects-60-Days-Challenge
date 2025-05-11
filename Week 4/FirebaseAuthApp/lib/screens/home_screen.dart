import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  late String email;
  late String name;
  @override
  void initState() {
    super.initState();
    email = user?.email ?? "No Email";
    final rawName = user?.displayName;
    name =
        (rawName == null || rawName.trim().isEmpty)
            ? "No Name Provided"
            : rawName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Warning !"),
                    content: Text("Do you really want to logout?"),
                    elevation: 5,

                    shadowColor: Colors.deepPurpleAccent[200],
                    actions: [
                      TextButton.icon(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        icon: Icon(Icons.logout),
                        label: Text("Logout"),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.logout, color: Colors.black),
            label: Text("Logout", style: TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              side: BorderSide(color: Colors.black, width: 2),
              backgroundColor: Colors.deepPurpleAccent[100],
            ),
          ),
        ],
        centerTitle: false,

        automaticallyImplyLeading: true,
        title: Text(
          "Home Screen",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome to the Home Screen!", style: TextStyle(fontSize: 24)),
            Text("\nUser Name : $name", style: TextStyle(fontSize: 20)),
            Text("User Email : $email", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
