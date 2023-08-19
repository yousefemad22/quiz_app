import 'package:flutter/material.dart';
import 'package:quiz_app/firstPage.dart';
import 'package:quiz_app/vars&funs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:bodyColor,
        appBar: AppBar(
          backgroundColor: barColor,
          title: const Text('Quiz App'),
          centerTitle: true,
        ),
        body: QuizPage(),
      ),
    );
  }
}



