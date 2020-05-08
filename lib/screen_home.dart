import 'package:flutter/material.dart';
import 'package:queestudiar/screen_instruction.dart';
import 'package:queestudiar/screen_question.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Bienvenidos',
              style: TextStyle(
                  fontFamily: 'Merienda',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            /* SizedBox(
              height: 10.0,
            ),*/
            Expanded(
              child: Image.asset('images/diamond.jpg'),
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
                      return InstructionPage();
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
                color: Color.fromRGBO(127, 255, 210, 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
