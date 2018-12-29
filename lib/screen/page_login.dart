import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:facetag/resource/colors.dart';
import 'package:facetag/widgets/toast.dart';
import 'package:facetag/widgets/progressBar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailTextFieldController = TextEditingController();
  final TextEditingController _passwordTextFieldController = TextEditingController();
  final ProgressHUD _progressHUD = makeProgressBar("Loading...", faceTagPink);

  String email;
  String password;

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
              Builder(builder: (BuildContext context) {
                return _buildTextFieldGroup(context);
              })
            ],
          ),
          _progressHUD,
        ],
      ),
    );
  }
  Widget _buildLogoImageView() {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Image.asset('images/logo.png', height: 100.0,),
    );
  }

  Widget _buildTextFieldGroup(BuildContext context) {
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
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '로그인',style: TextStyle(color: Colors.white),
            ),
            onPressed: (){
              _progressHUD.state.show();
              var email = _emailTextFieldController.text;
              var password = _passwordTextFieldController.text;
              FocusScope.of(context).requestFocus(FocusNode());
              _signIn(email, password).then((FirebaseUser user) {
                _progressHUD.state.dismiss();
                Navigator.pushReplacementNamed(context, '/choose_sex');
              }).catchError((error) {
                if (error.toString().contains('17011')) {
	                showToast(context, "존재하지 않는 계정입니다.");
                } else {
	                showToast(context, "아이디 혹은 비밀번호를 확인하세요");
                }
                _progressHUD.state.dismiss();
              });

            },
          ),
        ),
        InkWell(
          child: Text('계정이 없으신가요?', style: TextStyle(color: Colors.grey, fontSize: 12.0),),
          onTap: () {
            Navigator.pushNamed(context, '/sign_up');
          },
        )
      ],
    );
  }


  Future<FirebaseUser> _signIn(String email, String password) async {
    FirebaseUser user = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return user;
  }
}
