import 'package:facetag/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facetag/resource/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChooseSexPage extends StatefulWidget {

  @override
  _ChooseSexPageState createState() => _ChooseSexPageState();
}

class _ChooseSexPageState extends State<ChooseSexPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String uid;

  _ChooseSexPageState() {
    FirebaseAuth.instance.currentUser().then((user){
      uid = user.uid;
    }).catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: faceTagBackground,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        children: <Widget>[
          _buildExplanationView(),
          SizedBox(height: 70.0,),
          _buildChoiceView()
        ],
      ),
    );
  }

  Widget _buildExplanationView() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Image.asset(
            'images/logo.png',
            height: 100.0,
          ),
        ),
        SizedBox(
          height: 45.0,
        ),
        Text(
          '당신의 성별을 선택해주세요',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        )
      ],
    );
  }

  Widget _buildChoiceView() {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () => _doubleCheckDialog('m'),
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Image.asset('images/men.png'),
          ),
        ),
        GestureDetector(
          onTap: () => _doubleCheckDialog('w'),
          child: Image.asset('images/women.png'),
        )
      ],
    );
  }

  Future<void> _sexTransaction(String sex) async {
    final DocumentReference ref = Firestore.instance.collection("User").document(uid);
    Firestore.instance.runTransaction((tx) async{
      await tx.update(ref, <String,dynamic>{'sex': sex});
    });
  }

  void _doubleCheckDialog(String sex) {
    showDialog(
        context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('알림'),
          content: Text('한번 선택하면 바꿀 수 없습니다. 계속하시겠습니까?'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('확인'),
              onPressed: () {
                _sexTransaction(sex).then((_){
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/analyze');
                }).catchError((e) => toastWithKey(_scaffoldKey,'에러발생!'));
              },
            ),
            CupertinoDialogAction(
              child: Text("취소"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      }
    );

  }
}
