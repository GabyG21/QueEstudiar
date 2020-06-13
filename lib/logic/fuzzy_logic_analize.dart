import 'package:fuzzylogic/fuzzylogic.dart';
import 'package:queestudiar/logic/IntelligenceSet.dart';
import 'package:queestudiar/logic/ScoreSet.dart';
import 'package:queestudiar/quiz_brain.dart';

class FuzzyLogicApply {
  var _scoreSet = new ScoreSet();
  var _intelligenceSet = new IntelligenceSet();

  var ruleB = new FuzzyRuleBase();
  var varOutput;

  void ruleDefine() {
    ruleB.addRules([
      (_scoreSet.malo) >> (_intelligenceSet.baja),
      (_scoreSet.regular) >> (_intelligenceSet.baja),
      (_scoreSet.bueno) >> (_intelligenceSet.media),
      (_scoreSet.muybueno) >> (_intelligenceSet.media),
      (_scoreSet.excelente) >> (_intelligenceSet.alta)
    ]);
    varOutput = _intelligenceSet.createOutputPlaceholder();
  }

  int workIntelligence(int j) {
    ruleDefine();
    ruleB.resolve(inputs: [_scoreSet.assign(j)],
        outputs: [varOutput = _intelligenceSet.createOutputPlaceholder()]);
    return varOutput.crispValue;
  }

  void calculateIntelligence(List valor, List salida, List pos) {

    for (int i = 0; i < valor.length; i++) {
      salida[i] = workIntelligence(valor[i]);
    }
//ordenacion
    int position;
    int extra;
    for (int i = 0; i < valor.length; i++) {
      if (valor[i] > valor[i + 1]) {
        extra = valor[i + 1];
        valor[i + 1] = valor[i];
        valor[i] = extra;
        position = pos[i + 1];
        pos[i + 1] = pos[i];
        pos[i] = position;
      }
    }
    //get max position


  }
}
