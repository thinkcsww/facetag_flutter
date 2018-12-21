import 'package:flutter/material.dart';
import 'colors.dart';

class AnalyzePage extends StatefulWidget {
  @override
  _AnalyzePageState createState() => _AnalyzePageState();
}

class _AnalyzePageState extends State<AnalyzePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: faceTagBackground,
      body: ListView(
        children: <Widget>[
          _buildImageView(),
          SizedBox(height: 100.0,),
          _buildExplanationView()
        ],
      ),
    );
  }

  Widget _buildImageView() {
    return GestureDetector(
      onTap: (){
        print('hi');
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Image.asset('images/profile_default.png', height: 100.0,),
      ),
    );
  }

  Widget _buildExplanationView() {
    return Column(
      children: <Widget>[
        Text(
          '당신을 분석해드립니다.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        SizedBox(height: 10.0,),
        Text(
          '이제까지 진부한 미팅 어플에 질리셨나요?'
        ),
        SizedBox(height: 10.0,),
        Text(
          '저희는 최첨단 기술을 사용하여 매칭을 이루어 드립니다.'
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            InkWell(
              child: Text('더 알아보기' ,style: TextStyle(color: faceTagPink, fontSize: 10.0),),
            ),
            Icon(Icons.search, color: faceTagPink, size: 13.0,),
          ],
        ),
        SizedBox(height: 50.0,),
        Container(
          width: 100.0,
          child: FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            color: faceTagPink,
            child: Text('분석하기', style: TextStyle(color: Colors.white),),
            onPressed: (){
              Navigator.pushNamed(context, '/analyze_result');
            },
          ),
        )
      ],
    );
  }
}
