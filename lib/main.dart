import 'package:flutter/material.dart';

import 'screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Tasks App'),
          actions: const [
             Icon(Icons.add),
          ],
        ),
        body: const TasksScreen(),
      )
    );
  }
}