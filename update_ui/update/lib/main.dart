import 'package:flutter/material.dart';
import 'package:update/todos/todos.dart';
import 'package:update/ui_updates_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Internals!'),
        ),
        // body: const UiUpdatesDemo(),
        body: const Todos(),
        ),
    );
  }
}