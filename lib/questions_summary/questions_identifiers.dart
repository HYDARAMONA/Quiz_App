import 'package:flutter/material.dart';

class QuestionsIdentifiers extends StatelessWidget {
  QuestionsIdentifiers(
      {super.key, required this.isCorrectAnswer, required this.questionIndex});

  final bool isCorrectAnswer;
  final int questionIndex;
  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      // alignment: ,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? Color.fromARGB(255, 150, 198, 241)
            : Color.fromARGB(255, 249, 133, 241),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
