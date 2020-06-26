import 'package:fuzzylogic/fuzzylogic.dart';

class ScoreSet extends FuzzyVariable<int>{
  var malo= new FuzzySet.Trapezoid(-1,0, 10, 12);
  var regular= new FuzzySet.Triangle(9, 12, 15);
  var bueno= new FuzzySet.Triangle(12, 16, 20);
  var muybueno= new FuzzySet.Triangle(17, 20, 23);
  var excelente = new FuzzySet.Trapezoid(20, 24,27, 28);

  ScoreSet(){
    sets = [malo, regular,bueno,muybueno, excelente];
    init();
  }
}