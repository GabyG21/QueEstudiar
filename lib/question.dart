class Question {
  String questionText;
  int questionAnswer;
  int inteligencia;

  Question(String q, int a, int i) {
    questionText = q;
    questionAnswer = a;
    inteligencia = i;
  }
}

Question newQuestion = Question('text', 1, 1);