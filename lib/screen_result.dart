import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Resultados',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
