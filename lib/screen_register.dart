import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queestudiar/screen_home.dart';
import 'package:queestudiar/screen_login.dart';
import 'package:queestudiar/globals.Dart' as global;


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  String email='';
  String password ='';
  String registervalue;
  dynamic snackBar;

  Future registerWithEmailPassword(String email, String password) async{
    FirebaseUser user;
    try{
      user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      print(e.toString());
    } finally{
      if(user != null){
        registervalue= 'Registro exitoso';
        global.register=true;
        snackBar = SnackBar(
            content: Text('Usuario Registrado'),);
        print(registervalue);
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }),
          );
        });
      }else{
        snackBar = SnackBar(
            content: Text('Hubo un error, vuelve a intentarlo'),);
        print(registervalue);
        global.register=false;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Image.asset('images/que_estudio.png'),
                  height: 200.0,
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
                          height: 330,
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
                          child:
                          Form(key: _formKey,
                            child: Padding(
                                padding:
                                EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                                child:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        'REGISTRO',
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
                                      validator: (val) => val.isEmpty ? 'Ingrese su usuario' : null,
                                      onChanged: (val){
                                        setState(() => email = val);
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: 'usuario',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 15.0)),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    TextFormField(
                                      validator: (val) => val.isEmpty ? 'Ingrese su email' : (global.validateEmail(val)),
                                      onChanged: (val){
                                        setState(() => email = val);
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          hintText: 'email',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 15.0)),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    TextFormField(
                                      validator: (val) => val.length < 6 ? 'Ingrese una contraseña con al menos 6 caracteres o mas' : null,
                                      onChanged: (val){
                                        setState(() => password = val);
                                      },
                                      obscureText: true,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: 'password',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 15.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 20.0),
                                      child: Material(
                                        elevation: 5.0,
                                        color: Colors.greenAccent,
                                        borderRadius: BorderRadius.circular(30.0),
                                        child: MaterialButton(
                                          onPressed: () async{
                                            if(_formKey.currentState.validate()){
                                              registerWithEmailPassword(email, password);
                                            }
                                          },
                                          minWidth: double.infinity,
                                          height: 42.0,
                                          child: Text(
                                            'Registrar Usuario',
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontSize: 18.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],)
                            ),
                          ),
                        )
                      ]),
                ),
              ]),
        )
        )
        
        );
        Scaffold.of(context).showSnackBar(snackBar);
  }
}
