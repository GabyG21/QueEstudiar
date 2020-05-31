import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:queestudiar/screen_home.dart';

final GoogleSignIn _googleSignIn = new GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _status;

  @override
  void initState() {
    // TODO: implement initState
    _status = 'Not authenticated';
  }

  void _signInGoogle() async{
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    if(user != null && user.isAnonymous == false) {
      print('google login success');
      setState(() {
        _status = 'Google Signin success';
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return HomePage();
          }),
        );

      });
    }else{
      print('google login fails');
      setState(() {
        _status = 'google fails';

      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Image.asset('images/que_estudio.png'),
              height: 160.0,
            ),
            SizedBox(
              height: 25.0,
            ),
         Padding(padding: EdgeInsets.only(left: 28.0,right: 28.0,top: 0.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 15.0),
                        blurRadius: 15.0),
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, -10.0),
                            blurRadius: 10.0),
                      ]
                    ),
                    child: Padding(padding:
                    EdgeInsets.only(left:16.0, right: 16.0, top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child:Text('LOGIN',style:
                        TextStyle(
                            fontSize: 25,
                            fontFamily: 'Convergence',
                            letterSpacing: .6
                        ),),),
                        SizedBox(height: 5.0,),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'username',
                            hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 15.0
                            )
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'password',
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 15.0
                              )
                          ),
                        )
                      ],
                    ),),
                  )
                ],
              ),),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Material(
                elevation: 5.0,
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //Go to login screen.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Material(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                  onTap: (){

            },child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                            image: AssetImage('logos/facebook.jpg'))),
                  ), ),
                  GestureDetector(
                    onTap: (){
                      _signInGoogle();
                    },child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                            image: AssetImage('logos/google.jpg'))),
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
