import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    runApp(const MainApp(title: "true"));
  } catch (e) {
    runApp(const MainApp(title: "false"));
  }
}

class MainApp extends StatelessWidget {
  final String title;
  const MainApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text('Firebase initialized: $title'))),
    );
  }
}
