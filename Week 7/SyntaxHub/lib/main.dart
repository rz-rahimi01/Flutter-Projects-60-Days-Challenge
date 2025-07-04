import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syntaxhub/providers/bookmark_provider.dart';
import 'package:syntaxhub/providers/theme_provider.dart';
import 'package:syntaxhub/screens/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:syntaxhub/models/theme_data.dart'; // <-- change if file name differs

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox('bookmarks');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => Bookmark()),
      ],
      child: const Start(),
    ),
  );
}

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: light,
      darkTheme: dark,
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
