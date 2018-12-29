import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facetag/resource/colors.dart';

class ChooseSexPage extends StatefulWidget {
  @override
  _ChooseSexPageState createState() => _ChooseSexPageState();
}

class _ChooseSexPageState extends State<ChooseSexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onTap: (){
            _doubleCheckDialog();
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Image.asset('images/men.png'),
          ),
        ),
        GestureDetector(
          onTap: (){

          },
          child: Image.asset('images/women.png'),
        )
      ],
    );
  }

  void _doubleCheckDialog() {
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
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/analyze');
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
