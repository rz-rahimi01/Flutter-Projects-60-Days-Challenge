import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/task_provider.dart';
import 'package:todoapp/screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Tasks(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Todoapp()),
    ),
  );
}
