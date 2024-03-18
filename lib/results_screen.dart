import 'package:flutter/material.dart';
import 'package:quiz_app2/Data/questions.dart';
import 'package:quiz_app2/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.choosenAnswers, required this.restarter});
  final List<String> choosenAnswers;
  final void Function() restarter;
  List<Map<String, Object>> getSummaryAnswers() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryAnswers();
    final numTotalQuestion = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        // alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You have answered $numCorrectQuestions out of $numTotalQuestion correctly',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 243, 192, 243),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: restarter,
              style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 233, 160, 233)),
              icon: Icon(Icons.refresh_outlined),
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
