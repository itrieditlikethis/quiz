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
  List<String> selectedAnswers = [];
  late String activeScreen;
  Widget? nextScreenWidget;

  @override
  void initState() {
    activeScreen = "start-screen";
    nextScreenWidget = StartScreen(changeScreenState);
    super.initState();
  }

  void changeScreenState(String nextScreen) {
    setState(() {
      activeScreen = nextScreen;
    });
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      print(selectedAnswers);
      setState(() {
        activeScreen = 'start-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget setScreen() {
      switch (activeScreen) {
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
          decoration: BoxDecoration(
            color: Colors.yellow,
          ),
          child: setScreen(),
        ),
      ),
    );
  }
}
