import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queestudiar/screens/screen_question.dart';

class InstructionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
          child: Center(
            child: Column(
              children: <Widget>[
                FittedBox(
                  fit:BoxFit.contain,
                  child: Text(
                    'Instrucciones',
                    style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 50.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                FittedBox(
                  fit:BoxFit.contain,
                  child:Text(
                    "Ten en cuenta que este cuestionario te ayudará a elegir tu carrera profesional, por lo tanto, te rogamos seas sincero al responder las preguntas.\n\n"
                        "Por pregunta elegir solo una opción.\n\n"
                        "Inmediatamente podrás conocer el resultado de tu test vocacional. \n\n"
                        "Esperamos que al finalizar hayamos podido ayudarte a elegir tu profesión",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Convergence',
                        color: Colors.black54),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                FittedBox(
                  fit:BoxFit.contain,
                  child:Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Image.asset(
                                'images/1.png',
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  'Estoy muy\nde acuerdo',
                                  style: TextStyle(fontSize: 12.0),
                                )),
                            Container(
                              padding: EdgeInsets.fromLTRB(8, 5, 5, 5),
                              child: Image.asset(
                                'images/2.png',
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                'Estoy de\nacuerdo',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Image.asset(
                                'images/3.png',
                                height: 50.0,
                                fit: BoxFit.cover, ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                'No estoy \nde acuerdo',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(8, 5, 5, 5),
                              child: Image.asset(
                                'images/4.png',
                                fit: BoxFit.cover,
                                height: 50.0,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  'No estoy nada\nde acuerdo',
                                  style: TextStyle(fontSize: 12.0),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
              Padding(
                  padding: EdgeInsets.all(25.0),
                  child:Container(
                      width: double.infinity,
                      height: 60.0,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return QuizPage();
                            }),
                          );
                        },
                        child: Text(
                          'EMPEZAR TEST',
                          style: TextStyle(
                              fontFamily: 'Convergence',
                              color: Colors.black54,
                              fontSize: 25.0,
                              letterSpacing: 1.5),
                        ),
                        color: Colors.redAccent,
                      ),
                    ),
                  )

              ],
            ),
          ),
        ),
      )),
    );
  }
}
