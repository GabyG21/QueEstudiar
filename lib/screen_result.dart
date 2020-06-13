import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queestudiar/logic/fuzzy_logic_analize.dart';
import 'package:queestudiar/quiz_brain.dart';
import 'globals.Dart' as globals;


FuzzyLogicApply _fuzzyLogicApply = new FuzzyLogicApply();
QuizBrain quizBrain = new QuizBrain();

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  int valor = 0;
  //final db = Firestore.instance;
  //conection to firestore
  /*List<DocumentSnapshot> documentList;
  documentList = (await Firestore.instance
      .collection("cases")
      .document(await firestoreProvider.getUid())
      .collection(caseCategory)
      .where("caseNumber", isEqualTo: query)
      .getDouments())
      .documents;*/
  /*void getIntelligences(int i) async {
    final intevalor = await db
        .collection('InteligenciaID')
        .where("valor", isEqualTo: i.toString())
        .snapshots()
        .listen((data) => data.documents.forEach(
            (doc) => print(doc['tipo'] + ' ' + doc['caracteristicas'])));
    print(intevalor);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
            child: Column(children: <Widget>[
          Text(
            'Resultados',
            style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 40.0,
                color: Colors.red,
                fontWeight: FontWeight.bold),
          ),
          FlatButton(onPressed: () {
            _fuzzyLogicApply.calculateIntelligence(globals.valores, globals.salida, globals.pos);
            for (int i = 0; i < globals.salida.length; i++) {
             // getIntelligences(globals.pos[i]);
            }
          }, child: Text('Generar'))
/*
              ListView(
                children: <Widget>[
                  ListTile(
                    title: new Text(valor.toString()),
                  ),
                  ListTile(
                    title: Text('linguistica'),
                    onTap: () {
                      setState(() {
                        valor =_fuzzyLogicApply.workIntelligence(globals.valores[0]);
                        print(valor);
                        print(globals.valores);
                      });

                },
                  ),
                  ListTile(
                    title: Text('MAtematica'),
                    onTap: () {
                      setState(() {
                        valor =_fuzzyLogicApply.workIntelligence(globals.valores[1]);
                        print(valor);
                        print(globals.valores);
                      });
                      },
                  )
                ],
              ),*/
        ])),
      ),
    );
  }
}
