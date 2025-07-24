import 'package:flutter/material.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary({super.key, required this.resultsData});

  final List<Map<String, Object>> resultsData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...resultsData.map((data) {
          return Row(
            children: [
              Text((data["question_index"] as int).toString()),
              Expanded(
                child: Column(
                  children: [
                    Text('${data["question"]}'),
                    Text('${data["right_answer"]}'),
                    if (data["right_answer"] != data["user_answer"])
                      Text('${data["user_answer"]}'),
                    Text('$data["result"]'),
                  ],
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}
