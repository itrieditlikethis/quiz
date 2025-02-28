import 'package:flutter/material.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/start_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizApp();
  }
}

class _QuizApp extends State<QuizApp> {
  late String activeScreen;
  Widget? nextScreenWidget;

  @override
  void initState() {
    activeScreen = "start_screen";
    nextScreenWidget = StartScreen(changeScreenState);
    super.initState();
  }

  void changeScreenState(String nextScreen) {
    setState(() {
      activeScreen = nextScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget setScreen() {
      switch (activeScreen) {
        case "start_screen":
          return StartScreen(changeScreenState);
        case "questions_screen":
          return QuestionsScreen(changeScreenState);
        default:
          return StartScreen(changeScreenState);
      }
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.yellow,
          ),
          child: setScreen(),
        ),
      ),
    );
  }
}
