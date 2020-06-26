import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'globals.Dart' as globals;

class ResultChart extends StatefulWidget {
  @override
  _ResultChartState createState() => _ResultChartState();
}

class _ResultChartState extends State<ResultChart> {
  List<inteligenciaC> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [
      inteligenciaC(inteligencia: globals.nomInte[0], valor: globals.valores[0], barColor: charts.ColorUtil.fromDartColor(Colors.red),),
      inteligenciaC(inteligencia: globals.nomInte[1], valor: globals.valores[1], barColor: charts.ColorUtil.fromDartColor(Colors.blue),),
      inteligenciaC(inteligencia: globals.nomInte[2], valor: globals.valores[2], barColor: charts.ColorUtil.fromDartColor(Colors.green),),
      inteligenciaC(inteligencia: globals.nomInte[3], valor: globals.valores[3], barColor: charts.ColorUtil.fromDartColor(Colors.orange),),
      inteligenciaC(inteligencia: globals.nomInte[4], valor: globals.valores[4], barColor: charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent),),
      inteligenciaC(inteligencia: globals.nomInte[5], valor: globals.valores[5], barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),),
      inteligenciaC(inteligencia: globals.nomInte[6], valor: globals.valores[6], barColor: charts.ColorUtil.fromDartColor(Colors.teal),),
      inteligenciaC(inteligencia: globals.nomInte[7], valor: globals.valores[7], barColor: charts.ColorUtil.fromDartColor(Colors.lightGreenAccent),)
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 200,
            width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Card(child: MyBarChart(data),),
        ),
        Padding(padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text('Inteligencias',
          textAlign: TextAlign.center,
          ),
        ),
        ),
      ],
    );

  }
}
class inteligenciaC {
final String inteligencia;
final int valor;
final charts.Color barColor;

inteligenciaC({
  @required this.inteligencia,
  @required this.valor,
  @required this.barColor,
});
}
class MyBarChart extends StatelessWidget {
  final List<inteligenciaC> data;

  MyBarChart(this.data);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<inteligenciaC, String>> series = [
      charts.Series(
          id: 'Inteligencias',
          data: data,
          domainFn: (inteligenciaC downloads, _) => downloads.inteligencia,
          measureFn: (inteligenciaC downloads, _) => downloads.valor,
          colorFn: (inteligenciaC downloads, _) => downloads.barColor)
    ];

    return charts.BarChart(
      series,
      animate: true,
      barGroupingType: charts.BarGroupingType.groupedStacked,
    );
  }
}