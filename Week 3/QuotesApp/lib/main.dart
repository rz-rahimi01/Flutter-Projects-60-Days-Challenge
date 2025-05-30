import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quotesapp/data/theme_data.dart';
import 'package:quotesapp/models/favorite_change.dart';
import 'package:quotesapp/models/theme_change.dart';
import 'package:quotesapp/providers/quotes.dart';
import 'package:quotesapp/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('favorites');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChange()),
        ChangeNotifierProvider(create: (context) => QuotesModel()),
        ChangeNotifierProvider(create: (context) => Favorite()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChange>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: theme.current,
      theme: light,
      darkTheme: dark,
      home: MainScreen(),
    );
  }
}
