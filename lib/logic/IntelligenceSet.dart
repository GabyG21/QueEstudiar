import 'package:fuzzylogic/fuzzylogic.dart';

class IntelligenceSet extends FuzzyVariable<int>{
  var baja= new FuzzySet.Trapezoid(-1,0, 12, 15);
  var media= new FuzzySet.Triangle(12,17,22);
  var alta= new FuzzySet.Trapezoid(17, 23, 27,28);

  IntelligenceSet(){
    sets = [baja, media,alta];
    init();
  }
}
