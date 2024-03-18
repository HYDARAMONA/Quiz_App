class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> get ShuffledAnswer {
    final shuffeldAnswers = List.of(answers);
    shuffeldAnswers.shuffle();
    return shuffeldAnswers;
  }
}
