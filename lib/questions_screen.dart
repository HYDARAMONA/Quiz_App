import 'package:flutter/material.dart';
import 'package:quiz_app2/answer_button.dart';
import 'package:quiz_app2/Data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      // height: double.infinity,
      child: Container(
        margin: EdgeInsets.all(30),
        // padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 233, 160, 233),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.ShuffledAnswer.map((answer) {
              return AnswerButton(
                  theAnswer: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            })

            // AnswerButton(
            //   theAnswer: currentQuestion[0].answers[0],
            //   onTap: () {},
            // ),
            // const SizedBox(height: 10),
            // AnswerButton(
            //   theAnswer: currentQuestion[0].answers[1],
            //   onTap: () {},
            // ),
            // const SizedBox(height: 10),
            // AnswerButton(
            //   theAnswer: currentQuestion[0].answers[2],
            //   onTap: () {},
            // ),
            // const SizedBox(height: 10),
            // AnswerButton(
            //   theAnswer: currentQuestion[0].answers[3],
            //   onTap: () {},
            // )
          ],
        ),
      ),
    );
  }
}
