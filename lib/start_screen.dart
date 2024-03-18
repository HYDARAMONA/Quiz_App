import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const SizedBox(height: 100),
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 350,
            color: const Color.fromARGB(164, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter The Fun Way',
            style: GoogleFonts.lato(
              color: Color.fromARGB(255, 233, 160, 233),
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 233, 160, 233),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
          // ElevatedButton(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(
          //       backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
          //   child: const Text(
          //     'Start Quiz',
          //     style: TextStyle(
          //       color: Color.fromARGB(255, 233, 160, 233),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
