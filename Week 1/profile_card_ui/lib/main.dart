import 'package:flutter/material.dart';
import 'package:profile_card_ui/maincopy.dart';

void main() {
  runApp(MyApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
