import 'package:fuzzylogic/fuzzylogic.dart';

class IntelligenceSet extends FuzzyVariable<int>{
  var baja= new FuzzySet.Trapezoid(9, 10, 18, 26);
  var media= new FuzzySet.Trapezoid(18, 26, 34, 42);
  var alta= new FuzzySet.Trapezoid(34, 42, 50, 51);

  IntelligenceSet(){
    sets = [baja, media,alta];
    init();
  }
}
