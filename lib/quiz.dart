import 'package:flutter/material.dart';
import 'package:quiz_app2/questions_screen.dart';
import 'package:quiz_app2/start_screen.dart';
import 'package:quiz_app2/Data/questions.dart';
import 'package:quiz_app2/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // _QuizState({super.key});
  List<String> selectedAnswers = [];
  var activeScreen = 'start_screen';
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      // selectedAnswers = [];
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  void restartQuiz() {
    selectedAnswers = [];

    setState(() {
      activeScreen = 'start_screen';
    });
  }

  // void setState((){});
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question_screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results_screen') {
      screenWidget = ResultsScreen(
        choosenAnswers: selectedAnswers,
        restarter: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 73, 7, 126),
                Color.fromARGB(255, 97, 10, 168),
                Color.fromARGB(255, 110, 12, 190),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
