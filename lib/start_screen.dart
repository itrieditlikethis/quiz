import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function(String) startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 30,
        children: [
          const Text(
            'Quiz',
            style: TextStyle(
              fontSize: 100,
            ),
          ),
          OutlinedButton.icon(
            onPressed: () => startQuiz("questions-screen"),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 15,
                bottom: 15,
              ),
              foregroundColor: Colors.white,
              backgroundColor: Colors.black87,
            ),
            icon: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.yellow,
              size: 50.0,
            ),
            label: const Text(
              'Start',
              style: TextStyle(
                fontSize: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
