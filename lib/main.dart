import 'package:app_alura/data/task_inherited.dart';
import 'package:flutter/material.dart';
import 'screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicativos de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: TaskInherited(
        child: const InitialScreen(),
      ),
    );
  }
}
