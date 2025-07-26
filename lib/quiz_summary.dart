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
                  color:
                      data["result"] as bool ? Colors.green : Colors.pink[400]),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text(
                        (data["question_index"] as int).toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                        ),
                      ),
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
                  Row(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          data["right_answer"] as String,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  if (data["result"] as bool == false)
                    Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            data["user_answer"] as String,
                            softWrap: true,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
