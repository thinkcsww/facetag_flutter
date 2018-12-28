import 'package:flutter/material.dart';
import 'package:facetag/resource/colors.dart';

class MatchingPage extends StatefulWidget {
  @override
  _MatchingPageState createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: faceTagBackground,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 100.0,),
          _buildTagMatchingView(),
          SizedBox(height: 30.0,),
          _buildMoodMatchingView(),
        ],
      ),
    );
  }

  Widget _buildTagMatchingView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.grey, offset: Offset(0.0, 6.0), blurRadius: 5.0)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('태그 매칭', style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text('랜덤 선택된 태그로 매칭하는 방식으로 동일 태그 상대방과 임의로 매칭됩니다.'),
          )
        ],
      ),
    );
  }

  Widget _buildMoodMatchingView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.grey, offset: Offset(0.0, 6.0), blurRadius: 5.0)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('기분 매칭', style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text('분석 결과로 나온 기분 유형을 기반으로 비슷한 유형의 사람과 매칭됩니다.'),
          )
        ],
      ),
    );
  }
}
