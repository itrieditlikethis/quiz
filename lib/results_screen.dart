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
    final summaryData = getQuizResults();
    final numOfQuestions = questions.length;
    final int numOfRightAnswers =
        summaryData.where((data) => data["result"] as bool).length;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black87,
              ),
              child: Text(
                '$numOfRightAnswers righ answers from $numOfQuestions',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 34, color: Colors.white),
              ),
            ),
            QuizSummary(resultsData: summaryData),
          ],
        ),
      ),
    );
  }
}
