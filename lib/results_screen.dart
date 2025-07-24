import 'package:flutter/material.dart';
import 'package:quiz/data/questions_local.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.listOfAnswers});

  final List<String> listOfAnswers;

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
            ...listOfAnswers.map((answer) {
              final idx = listOfAnswers.indexOf(answer);

              if (questions[idx].answers[0] == answer) {
                return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      answer,
                      style: TextStyle(color: Colors.white),
                    ));
              } else {
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    spacing: 5,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.lightGreen,
                            size: 36,
                          ),
                          Text(
                            questions[idx].answers[0],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36.0,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        answer,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
