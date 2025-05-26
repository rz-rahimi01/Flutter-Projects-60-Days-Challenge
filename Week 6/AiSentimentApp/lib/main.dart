import 'package:aisentimentpp/providers/firebase_post.dart';
import 'package:aisentimentpp/providers/sentiment_api.dart';
import 'package:aisentimentpp/screens/first.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebasePost()),
        ChangeNotifierProvider(create: (_) => SentimentApi()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: First()),
    ),
  );
}
