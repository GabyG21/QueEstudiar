class Question {
  String questionText;
  int questionAnswer;
  String questionInt;

  Question(String q, int a, String i) {
    this.questionText = q;
    this.questionAnswer = a;
    this.questionInt = i;

  }
  Question.map(dynamic obj){
    this.questionText = obj['descripcion'];
    this.questionInt = obj['inteID'];
  }
  String get _questionText => questionText;
}