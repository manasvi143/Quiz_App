import 'package:flutter/material.dart';
import 'package:prac3/data/question_data.dart';
import 'package:prac3/new_screen.dart';
import 'package:prac3/result_screen.dart';
import 'package:prac3/start_screen.dart';

class PreScreen extends StatefulWidget {
  const PreScreen({super.key});
  @override
  State<PreScreen> createState() {
    return _PreScreenState();
  }
}

class _PreScreenState extends State<PreScreen> {
  var activescreen = 1;
  List<String> choosenAnswer = [];

  void screenChanger() {
    setState(() {
      activescreen = 2;
      choosenAnswer = [];
    });
  }

  void myChoosen(String ansss) {
    setState(() {
      choosenAnswer.add(ansss);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currScreen = StartScreen(screenChanger);
    if (activescreen == 2) {
      currScreen = NewScreen(myChoosen);
    }
    if (choosenAnswer.length == questions.length) {
      currScreen = ResultScreen(choosenAnswer, screenChanger);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 75, 78, 77)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: currScreen,
        ),
      ),
    );
  }
}
