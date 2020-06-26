
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'globals.Dart' as globals;

final GoogleSignIn _googleSignIn = new GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
final FacebookLogin facebookSignIn = new FacebookLogin();

class signOut{
  Future<Null> logOutFacebook() async {
    await facebookSignIn.logOut();
    globals.isLoggedIn = false;
  }

  Future<Null> logOutEmail() async {
    await _auth.signOut();
    globals.isLoggedIn = false;
  }

  Future<Null> logOutGoogle() async {
    await _googleSignIn.signOut();
    globals.isLoggedIn = false;
  }
  void sigOutTypo() {
    if (globals.typo == 'F') {
      logOutFacebook();
      print('logout FAce');
    }
    if (globals.typo == 'G') {
      logOutGoogle();
      print('logout Google');
    }
    if (globals.typo == 'E') {
      logOutEmail();
      print('logout email');
    }
  }
}