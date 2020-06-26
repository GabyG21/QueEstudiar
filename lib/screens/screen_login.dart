import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:queestudiar/screens/screen_instruction.dart';
import 'package:queestudiar/screens/screen_register.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import '../globals.Dart' as globals;

final GoogleSignIn _googleSignIn = new GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
final FacebookLogin facebookSignIn = new FacebookLogin();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  String _message = 'Log in/out by pressing the buttons below.';


  @override
  void initState() {
    // TODO: implement initState
    globals.isLoggedIn = false;
  }

  showAlertWrong(BuildContext context) {
    //set up the button
    Widget okButton = FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    //Set up the Alertdialog
    AlertDialog alert = AlertDialog(
      title: Text('Error en Inicio de Sesion'),
      content: Text('Verifique que su email o password sean correctos'),
      actions: <Widget>[okButton],
    );

    //show the dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  void _signInGoogle() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user =authResult.user;
    if (user != null && user.isAnonymous == false) {
      print('google login success');
        globals.isLoggedIn= true;
        globals.typo='G';
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return InstructionPage();
          }),
        );
    } else {
      print('google login fails');
      setState(() {
        globals.isLoggedIn=false;
      });
    }
  }

  void signInWithEmail(email, password) async {
    FirebaseUser user;
    try {
      AuthResult result =await _auth.signInWithEmailAndPassword(email: email, password: password);
    user = result.user;

    } catch (e) {
      print(e.toString());
    } finally {
      if (user != null) {
        print('login succesfull');
          globals.isLoggedIn=true;
          globals.typo='E';
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return InstructionPage();
            }),
          );
      } else {
        print(user);
        print('login fails');
        globals.isLoggedIn=false;
        showAlertWrong(context);
      }
    }
  }

  Future<Null> LoginFacebook() async {
    final FacebookLoginResult result =
    await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _message= ('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
         print(_message);
         globals.isLoggedIn=true;
         globals.typo='F';
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return InstructionPage();
          }),
        );
        break;
      case FacebookLoginStatus.cancelledByUser:
        _message=('Login cancelled by the user.');
        print(_message);
        globals.isLoggedIn=false;
        break;
      case FacebookLoginStatus.error:
        _message=('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        print(_message);
        globals.isLoggedIn=false;
        break;
    }
  }

  void getUserInfoFacebook(FacebookLoginResult result) async{
   final token = result.accessToken.token;
    final graphResponse = await http.get(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
    final profile = json.decode(graphResponse.body);
    print(profile['email']);
  }

  void onLoginStatusChange(bool isLoggedIn){
  setState(() {
    globals.isLoggedIn=isLoggedIn;
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Image.asset('images/que_estudio.png',),
                height: 160.0,
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 0.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 200,
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
                          ]),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'INICIO DE SESION',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'Convergence',
                                        letterSpacing: .6),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (val) => val.isEmpty ? 'Ingrese su email' : (globals.validateEmail(val)) ,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'email',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15.0)),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  validator: (val) => val.isEmpty ? 'Ingrese su contraseña': null,
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'contraseña',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15.0)),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ),
                    //login button
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Material(
                        elevation: 5.0,
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(30.0),
                        child: MaterialButton(
                          onPressed: () async {
                            if(_formKey.currentState.validate()){
                              signInWithEmail(email, password);
                            }
                          },
                          minWidth: double.infinity,
                          height: 42.0,
                          child: Text(
                            'Iniciar Sesion',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              //register button
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Material(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      //Go to registration screen.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return RegisterPage();
                        }),
                      );
                    },
                    minWidth: double.infinity,
                    height: 42.0,
                    child: Text(
                      'Registro',
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
                      onTap: () {
                        LoginFacebook();
                      },
                      child: Container(
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
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _signInGoogle();
                      },
                      child: Container(
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
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
