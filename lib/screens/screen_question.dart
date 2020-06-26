import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:queestudiar/SizeScreen.dart';
import 'package:queestudiar/screens/screen_result.dart';
import '../quiz_brain.dart';
import '../globals.Dart' as globals;

QuizBrain quizBrain = new QuizBrain();
SizeConfig sizeConfig = new SizeConfig();

class QuizPage extends StatefulWidget {
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int answer = 0;
  int limit = 71;

  List getInteligencia(int inteligencia, int respuesta, List valores) {
    int valor = valores[inteligencia - 1];
    valores[inteligencia - 1] = valor + respuesta;
    return valores;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 50, 15, 50),
                  child: Center(
                    child: Container(
                        child: Text(
                      quizBrain.questionBank[answer].questionText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 23.0,
                        color: Colors.black54,
                      ),
                    )),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              if (answer < limit) {
                                answer++;
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return ResultPage();
                                  }),
                                );
                              }
                              quizBrain.questionBank[answer].questionAnswer = 3;
                              getInteligencia(
                                  quizBrain.questionBank[answer].inteligencia,
                                  3,
                                  globals.valores);
                            });
                          },
                          child: Container(
                            child: Image.asset(
                              'images/1.png',
                              height: 145.0,
                              fit: BoxFit.cover,
                            ),
                            padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                          )),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            if (answer < limit) {
                              answer++;
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return ResultPage();
                                }),
                              );
                            }
                            quizBrain.questionBank[answer].questionAnswer = 2;
                            getInteligencia(
                                quizBrain.questionBank[answer].inteligencia,
                                2,
                                globals.valores);
                          });
                        },
                        child: Container(
                          child: Image.asset(
                            'images/2.png',
                            height: 145.0,
                            fit: BoxFit.cover,
                          ),
                          padding: EdgeInsets.fromLTRB(0, 10, 8, 10),
                        ),
                      ),
                    ],
                  ),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              if (answer < limit) {
                                answer++;
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return ResultPage();
                                  }),
                                );
                              }
                              quizBrain.questionBank[answer].questionAnswer = 1;
                              getInteligencia(
                                  quizBrain.questionBank[answer].inteligencia,
                                  1,
                                  globals.valores);
                            });
                          },
                          child: Container(
                            child: Image.asset(
                              'images/3.png',
                              height: 145.0,
                              fit: BoxFit.cover,
                            ),
                            padding: EdgeInsets.fromLTRB(15, 10, 0, 25),
                          )),
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              if (answer < limit) {
                                answer++;
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return ResultPage();
                                  }),
                                );
                              }
                              quizBrain.questionBank[answer].questionAnswer = 0;
                              getInteligencia(
                                  quizBrain.questionBank[answer].inteligencia,
                                  0,
                                  globals.valores);
                            });
                          },
                          child: Container(
                            child: Image.asset(
                              'images/4.png',
                              height: 145.0,
                              fit: BoxFit.cover,
                            ),
                            padding: EdgeInsets.fromLTRB(0, 10, 8, 25),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          //TODO: button me gusto mucho
          /*Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.deepOrange,
                  onPressed: () {
                    //level 5
                    setState(() {
                      if (answer < limit) {
                        answer++;
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ResultPage();
                          }),
                        );
                      }
                      quizBrain.questionBank[answer].questionAnswer = 3;
                      getInteligencia(
                          quizBrain.questionBank[answer].inteligencia,
                          3,
                          globals.valores);
                    });
                  },
                  child: Text(
                    'Totalmente de acuerdo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            //TODO: button me gusta
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () {
                    //level 4
                    setState(() {
                      if (answer < limit) {
                        answer++;
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ResultPage();
                          }),
                        );
                      }
                    });
                    quizBrain.questionBank[answer].questionAnswer = 2;
                    //print(quizBrain.questionBank[answer].questionText+ ' ' + quizBrain.questionBank[answer].questionAnswer.toString() );
                    getInteligencia(quizBrain.questionBank[answer].inteligencia,
                        2, globals.valores);
                  },
                  child: Text(
                    'De acuerdo ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            //TODO: button me gusto algo
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                  onPressed: () {
                    //level 3
                    setState(() {
                      if (answer < limit) {
                        answer++;
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ResultPage();
                          }),
                        );
                      }
                    });
                    quizBrain.questionBank[answer].questionAnswer = 1;
                    //print(quizBrain.questionBank[answer].questionText+ ' ' + quizBrain.questionBank[answer].questionAnswer.toString() );
                    getInteligencia(quizBrain.questionBank[answer].inteligencia,
                        1, globals.valores);
                  },
                  child: Text(
                    'Me gusta algo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            //TODO: button me gusto poco
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    //level 2
                    setState(() {
                      if (answer < limit) {
                        answer++;
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ResultPage();
                          }),
                        );
                      }
                    });
                    quizBrain.questionBank[answer].questionAnswer = 0;
                    //getInteligencia(quizBrain.questionBank[answer].inteligencia, 0, globals.valores);
                  },
                  child: Text(
                    'Me gusta poco',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),*/
        ));
  }
}
