import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queestudiar/logic/fuzzy_logic_analize.dart';
import 'package:queestudiar/quiz_brain.dart';
import 'package:queestudiar/screens/screen_detail_result.dart';
import 'package:queestudiar/screens/screen_login.dart';
import 'package:queestudiar/screens/screen_question.dart';
import 'package:queestudiar/sigOut.dart';
import '../globals.Dart' as globals;

FuzzyLogicApply _fuzzyLogicApply = new FuzzyLogicApply();
QuizBrain quizBrain = new QuizBrain();
signOut sigouto = new signOut();

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final db = Firestore.instance;
  int valor = 0;
  String id;
  String name;
  var result = '';
  Stream<QuerySnapshot> _queryi;
  Stream<QuerySnapshot> _querya;

  getAreas(int i) async {
    var result = await db
        .collection('AreaID')
        .where("inteligencia", arrayContains: i)
        .getDocuments();
    result.documents.forEach((area) {
      print(area.data);
    });
  }

  getInteligence(int i) async {
    var result = await db
        .collection('InteligenciaID')
        .where('valor', isEqualTo: i)
        .getDocuments();
    result.documents.forEach((res) {
      print(res.data);
    });
  }

  @override
  void initState() {
    _fuzzyLogicApply.calculateIntelligence(
        globals.valores, globals.salida, globals.pos);
    Map<int, int> mapSal = Map.fromIterables(globals.pos, globals.salida);
    Map mapSort = globals.sortmap(mapSal);
    var entryList = mapSort.entries.toList();
    getInteligence(entryList[7].key);
    getAreas(entryList[7].key);
    int v = entryList[7].key;
    _queryi = Firestore.instance
        .collection('InteligenciaID')
        .where('valor', isEqualTo: v)
        .snapshots();
    _querya = Firestore.instance
        .collection('AreaID')
        .where("inteligencia", arrayContains: v)
        .snapshots();
    //Firestore.instance.collection('InteligenciaID').where('valor', isEqualTo: v).snapshots().listen((data)=> data.documents.forEach((doc)=> print(doc['tipo'])));
  }

  Widget cardbuildi(List<DocumentSnapshot> documentsi) {
    Map<String, String> inteligencia;
    inteligencia = documentsi.fold({}, (Map<String, String> map, documentsi) {
      if (!map.containsKey(documentsi['tipo'])) {
        map[documentsi['tipo']] = documentsi['tipo'];
        map[documentsi['caracteristicas']] = documentsi['caracteristicas'];
      }
      map[documentsi['tipo']] = documentsi['tipo'];
      map[documentsi['caracteristicas']] = documentsi['caracteristicas'];

      return map;
    });
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'name',
                //'name: '+documentsi['tipo'].toString(),
                style: TextStyle(fontSize: 25, color: Colors.orange[300]),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 8, 5, 10),
                child: Text(
                  globals.description[6],
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 12),
            ],
          )),
    );
  }

  Widget cardbuilda(List<DocumentSnapshot> documentsa) {
    String areas = documentsa
        .map((doc) => doc['nombre'])
        .fold('', (a, b) => a + '\n  ' + b);
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
                child: Text(
                  'Carreras sugeridas',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
                child: Text(
                  areas,
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
              ),
              SizedBox(height: 12),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    _fuzzyLogicApply.calculateIntelligence(
        globals.valores, globals.salida, globals.pos);
    Map<int, int> mapSal = Map.fromIterables(globals.pos, globals.salida);
    Map mapSort = globals.sortmap(mapSal);
    var entryList = mapSort.entries.toList();
    getInteligence(entryList[7].key);
    getAreas(entryList[7].key);
    int v = entryList[7].key;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: SafeArea(
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
          Card(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Tipo: ' + globals.nomInte[entryList[7].key-1],
                      style: TextStyle(fontSize: 25, color: Colors.orange[300]),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 8, 5, 10),
                      child: Text(
                        globals.description[entryList[7].key-1],
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                )),
          ),
          /*
          StreamBuilder<QuerySnapshot>(
              stream: _queryi,
              builder:
                  (BuildContext context, AsyncSnapshot<QuerySnapshot> data) {
                if (data.hasData) {
                  return cardbuildi(data.data.documents);
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),*/
          SizedBox(
            height: 15,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: _querya,
              builder:
                  (BuildContext context, AsyncSnapshot<QuerySnapshot> data) {
                if (data.hasData) {
                  return cardbuilda(data.data.documents);
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),

          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 40.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return DetailResultPage();
                        }),
                      );
                    },
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text(
                        'Mostrar Datos',
                        style: TextStyle(
                          fontFamily: 'Convergence',
                          color: Colors.black54,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                    color: Color.fromRGBO(155, 232, 178, 1.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 40.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    onPressed: () {
                      //sigouto.sigOutTypo();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return QuizPage();
                        }),
                      );
                    },
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text(
                        'REPETIR TEST',
                        style: TextStyle(
                          fontFamily: 'Convergence',
                          color: Colors.black54,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                    color: Color.fromRGBO(251, 200, 68, 1.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 40.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    onPressed: () {
                      print(globals.pos);
                    },
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text(
                        'DESCARGA',
                        style: TextStyle(
                          fontFamily: 'Convergence',
                          color: Colors.black54,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                    color: Color.fromRGBO(155, 232, 178, 1.0),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      height: 40.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        onPressed: () {
                          sigouto.sigOutTypo();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }),
                          );
                        },
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Text(
                            'CERRAR SESION',
                            style: TextStyle(
                              fontFamily: 'Convergence',
                              color: Colors.white60,
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                        color: Colors.red[400],
                      )))
            ],
          ),
        ])))));
  }
}
