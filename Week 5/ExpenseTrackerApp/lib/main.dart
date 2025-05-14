import 'package:expensetracker/providers/expense_provider.dart';
import 'package:expensetracker/providers/modalsheet_viewer.dart';
import 'package:expensetracker/screens/first.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  Firebase.initializeApp;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExpensePro()),

        ChangeNotifierProvider(create: (context) => ModalsheetViewer()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: First());
  }
}
