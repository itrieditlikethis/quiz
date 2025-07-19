import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions_local.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.selectAnswer, {super.key});

  final void Function(String answer) selectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var _currentQuestionIndex = 0;

  void _answerQuestion(String selectedAnswer) {
    widget.selectAnswer(selectedAnswer);

    setState(() {
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_currentQuestionIndex];

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
              style: const TextStyle(
                fontSize: 54,
              ),
              textAlign: TextAlign.center,
            ),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onSelectQuestion: () => _answerQuestion(answer),
              );
            }),
          ],
        ),
      ),
    );
  }
}
