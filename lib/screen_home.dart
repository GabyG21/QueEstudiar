import 'package:flutter/material.dart';
import 'package:queestudiar/screen_login.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
          child:Center(
          child: Column(
            children: <Widget>[
              Text(
                'Bienvenidos',
                style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 50.0,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold),
              ),
               SizedBox(
              height: 20.0,
            ),
              Expanded(
                child: Image.asset('images/que_estudio.png'),
              ),
              SizedBox(
                height: 20.0,
              ),
            Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }),
                            );
                          },
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child:Padding(padding: EdgeInsets.fromLTRB(0,0,0,0),
                          child:  Text(
                            'EMPEZAR',
                            style: TextStyle(
                                fontFamily: 'Convergence',
                                color: Colors.black54,
                                fontSize: 25.0,
                                letterSpacing: 1.5),
                          ),),
                          color: Color.fromRGBO(127, 255, 210, 1.0),
                        )
                    )
                  )
            ],
          ),
        ),)
      ),
    );
  }
}
