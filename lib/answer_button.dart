import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onSelectQuestion,
  });

  final String answerText;
  final void Function() onSelectQuestion;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onSelectQuestion,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 15,
            bottom: 15,
          ),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black87,
        ),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ));
  }
}
