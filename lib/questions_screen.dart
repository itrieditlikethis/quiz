import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions_local.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.backToStart, {super.key});

  final void Function(String) backToStart;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 30,
          children: [
            Text(
              currentQuestion.text,
              style: TextStyle(
                fontSize: 54,
              ),
              textAlign: TextAlign.center,
            ),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onSelect: () {},
              );
            }),
          ],
        ),
      ),
    );
  }
}
