import 'package:aisentimentpp/models/theme.dart';
import 'package:aisentimentpp/providers/firebase_post.dart';
import 'package:aisentimentpp/providers/sentiment_api.dart';
import 'package:aisentimentpp/providers/theme_provider.dart';
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
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: thememode.current,
      theme: light,
      darkTheme: dark,

      home: First(),
    );
  }
}
