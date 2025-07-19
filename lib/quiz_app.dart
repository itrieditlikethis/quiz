import 'package:flutter/material.dart';
import 'package:quiz/data/questions_local.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/start_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final List<String> _selectedAnswers = [];
  String _activeScreen = "start-screen";

  void changeScreenState(String nextScreen) {
    setState(() {
      _activeScreen = nextScreen;
    });
  }

  void selectAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'start-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget setScreen() {
      switch (_activeScreen) {
        case "start-screen":
          return StartScreen(changeScreenState);
        case "questions-screen":
          return QuestionsScreen(selectAnswer);
        default:
          return StartScreen(changeScreenState);
      }
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.yellow,
          ),
          child: setScreen(),
        ),
      ),
    );
  }
}
