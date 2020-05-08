import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queestudiar/screen_question.dart';

class InstructionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Instrucciones',
                style: TextStyle(
                    fontFamily: 'Merienda',
                    fontSize: 40.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum ',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Convergence',
                    color: Colors.black54),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
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
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Icon(Icons.arrow_forward),
              )
            ],
          ),
        ),
      ),
    );
  }
}
