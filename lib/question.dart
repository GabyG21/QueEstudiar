class Question {
  String questionText;
  int questionAnswer;

  Question(String q, int a) {
    questionText = q;
    questionAnswer = a;
  }
}

Question newQuestion = Question('text', 1);