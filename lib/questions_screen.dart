import 'package:flutter/material.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen(this.backToStart, {super.key});

  final void Function(String) backToStart;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 30,
        children: [
          Text("QUESTION"),
          Column(
            spacing: 20,
            children: [
              Text("q 1"),
              Text("q 2"),
              Text("q 3"),
              Text("q 4"),
            ],
          ),
          OutlinedButton(
            onPressed: () => backToStart("start_screen"),
            child: Text("View results"),
          ),
        ],
      ),
    );
  }
}
