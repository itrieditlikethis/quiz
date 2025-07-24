import 'package:flutter/material.dart';
import 'package:quiz/data/questions_local.dart';
import 'package:quiz/quiz_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.listOfAnswers});

  final List<String> listOfAnswers;

  List<Map<String, Object>> getQuizResults() {
    List<Map<String, Object>> listOfResults = [];

    for (var i = 0; i < listOfAnswers.length; i++) {
      listOfResults.add({
        "question_index": i + 1,
        "question": questions[i].text,
        "right_answer": questions[i].answers[0],
        "user_answer": listOfAnswers[i],
        "result": questions[i].answers[0] == listOfAnswers[i],
      });
    }

    return listOfResults;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('X righ answers from Y'),
            QuizSummary(resultsData: getQuizResults()),
          ],
        ),
      ),
    );
  }
}
