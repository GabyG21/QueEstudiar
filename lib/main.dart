import 'package:flutter/material.dart';
import 'screens/screen_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
        home: Scaffold(
          backgroundColor: Color.fromRGBO(255, 192, 77, 1),
   /*       appBar: AppBar(
            title: Text('¿Que estudio?'),
            backgroundColor: Colors.orangeAccent,
          ),
     */     body: HomePage(),
          //body: LoginScreen(),
        ),
      );
  }


}