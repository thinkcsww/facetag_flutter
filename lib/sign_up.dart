import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'colors.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailTextFieldController = TextEditingController();
  final TextEditingController _passwordTextFieldController = TextEditingController();

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: faceTagBackground,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 60.0),
        children: <Widget>[
          _buildLogoImageView(),
          SizedBox(height: 50.0,),
          _buildTextFieldGroup(),

        ],
      ),
    );
  }
  Widget _buildLogoImageView() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Image.asset('images/logo.png', height: 100.0,),
    );
  }

  Widget _buildTextFieldGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: TextField(
            autofocus: true,
            controller: _emailTextFieldController,
            decoration: InputDecoration(
              hintText: '이메일',
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              border: UnderlineInputBorder(borderSide: BorderSide.none),

            ),
          ),
        ),
        SizedBox(height: 10.0,),
        Container(
          padding: const EdgeInsets.only(left: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: TextField(
            autofocus: true,
            controller: _passwordTextFieldController,
            decoration: InputDecoration(
              hintText: '비밀번호',
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              border: UnderlineInputBorder(borderSide: BorderSide.none),

            ),
          ),
        ),
        SizedBox(height: 5.0,),
        Container(
          width: 500.0,
          child: FlatButton(
            color: faceTagPink,
            child: Text(
              '로그인',style: TextStyle(color: Colors.white),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/choose_sex');
            },
          ),
        ),
      ],
    );
  }

  Future<FirebaseUser> _gSignIn(String email, String password) async {

    FirebaseUser user = await _auth.signInWithEmailAndPassword(email: email, password: password);

    return user;
  }
}
