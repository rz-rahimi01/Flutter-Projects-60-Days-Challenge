import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:syntaxhub/screens/first.dart';
import 'package:syntaxhub/screens/player_screen.dart';
import 'package:syntaxhub/screens/splash_screen.dart';
import 'package:syntaxhub/screens/video_selection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const Start());
}

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: PlayerScreen());
  }
}
