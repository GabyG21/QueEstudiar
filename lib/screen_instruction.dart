import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queestudiar/screen_question.dart';

class InstructionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Instrucciones',
                style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 50.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Ten en cuenta que este cuestionario te ayudará a elegir tu carrera profesional, por lo tanto, te rogamos seas sincero al responder las preguntas.\n\n"
                    "Por pregunta elegir solo una opción.\n\n"
                    "Inmediatamente podrás conocer el resultado de tu test vocacional. \n\n"
                    "Esperamos que al finalizar hayamos podido ayudarte a elegir tu profesión",
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Convergence',
                    color: Colors.black54),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Container(
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
    )
      ),
    );
  }
}
