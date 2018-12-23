import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'colors.dart';
import 'package:progress_hud/progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  ProgressHUD _progressHUD;

  @override
  void initState() {
    super.initState();

    _progressHUD = ProgressHUD(
      backgroundColor: Colors.black12,
      color: faceTagPink,
      containerColor: Colors.white,
      borderRadius: 5.0,
      text: 'Loading...',
      loading: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: faceTagBackground,
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 60.0),
            children: <Widget>[
              _buildLogoImageView(),
              SizedBox(height: 50.0,),
              _buildTextFieldGroup(),
            ],
          ),
          _progressHUD,
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
            obscureText: true,
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
              '회원가입',style: TextStyle(color: Colors.white),
            ),
            onPressed: (){
              var email = _emailTextFieldController.text;
              var password = _passwordTextFieldController.text;
              FocusScope.of(context).requestFocus(new FocusNode());
              // Sign Up with Email and password
              _progressHUD.state.show();
              _signUp(email, password).then((FirebaseUser user) {
                _progressHUD.state.dismiss();
                alertDialog(context);
              }).catchError((error) {

                print(error);
                if (error.toString().contains('17007')) {
                  Fluttertoast.showToast(
                      msg: "이미 사용중인 이메일입니다",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: faceTagPinkDark,
                      textColor: Colors.white
                  );
                } else {
                  Fluttertoast.showToast(
                      msg: "6자리 이상의 비밀번호를 사용해주세요",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: faceTagPinkDark,
                      textColor: Colors.white
                  );
                }

                _progressHUD.state.dismiss();
              });
            },
          ),
        ),

      ],
    );
  }

  void alertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('알림'),
            content: Text('회원가입이 완료되었습니다'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('확인'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }


  Future<FirebaseUser> _signUp(String email, String password) async {

    FirebaseUser user = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    return user;
  }
}
