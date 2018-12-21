import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<FirebaseUser> _gSignIn(String email, String password) async {

    FirebaseUser user = await _auth.signInWithEmailAndPassword(email: email, password: password);


  }
}
