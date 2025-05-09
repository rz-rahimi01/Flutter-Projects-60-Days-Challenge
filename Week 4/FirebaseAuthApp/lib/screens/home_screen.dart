import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            },
            child: Icon(Icons.logout_outlined, color: Colors.white, size: 30),
          ),
        ],

        automaticallyImplyLeading: true,
        title: Text(
          "Home Screen",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          "Welcome to the Home Screen!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
