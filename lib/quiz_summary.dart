import 'package:flutter/material.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary({super.key, required this.resultsData});

  final List<Map<String, Object>> resultsData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 25,
          children: resultsData.map((data) {
            return Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: data["result"] as bool ? Colors.green : Colors.pink),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text((data["question_index"] as int).toString()),
                      Expanded(
                        child: Text(
                          data["question"] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(data["right_answer"] as String),
                  if (data["right_answer"] != data["user_answer"])
                    Text(data["user_answer"] as String),
                  Text(data["result"].toString()),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
