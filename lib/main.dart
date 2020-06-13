import 'package:flutter/material.dart';
import 'package:queestudiar/screen_login.dart';

import 'screen_home.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Color.fromRGBO(255, 192, 77, 1),
   /*       appBar: AppBar(
            title: Text('¿Que estudio?'),
            backgroundColor: Colors.orangeAccent,
          ),
     */     body: HomePage(),
          //body: LoginScreen(),
        ),
      ),
    );
