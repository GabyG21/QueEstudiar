import 'package:fuzzylogic/fuzzylogic.dart';

class ScoreSet extends FuzzyVariable<int>{
  var malo= new FuzzySet.Triangle(9, 10, 20);
  var regular= new FuzzySet.Triangle(10, 20, 30);
  var bueno= new FuzzySet.Triangle(20, 30, 40);
  var muybueno= new FuzzySet.Triangle(30, 40, 50);
  var excelente = new FuzzySet.Triangle(40, 50, 51);

  ScoreSet(){
    sets = [malo, regular,bueno,muybueno, excelente];
    init();
  }
}