import 'dart:async';
import 'dart:convert';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/material.dart';
import 'globals.Dart' as globals;

class LoginTypes{
  static final FacebookLogin facebookSignIn = new FacebookLogin();

  String _message = 'Log in/out by pressing the buttons below.';

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

  Future<Null> logOutFacebook() async {
    await facebookSignIn.logOut();
    _message=('Logged out.');
  }

  /*void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }*/
}