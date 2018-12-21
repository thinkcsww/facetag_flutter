import 'package:flutter/material.dart';
import 'colors.dart';

class AnalyzeResultPage extends StatefulWidget {
  @override
  _AnalyzeResultPageState createState() => _AnalyzeResultPageState();
}

class _AnalyzeResultPageState extends State<AnalyzeResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: faceTagBackground,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  child: Image.asset('images/login.png',
                      width: 600.0, height: 300.0, fit: BoxFit.fill)),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
                margin: const EdgeInsets.fromLTRB(20.0, 250.0, 20.0, 20.0),
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow> [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 6.0),
                          blurRadius: 5.0
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '분석 결과',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ),
                        Text('#행복형 #행복지수 #78.5', style: TextStyle(color: Colors.grey.shade600, fontSize: 11.0),)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: Text(
                        '당신은 행복형입니다. 당신의 앨범을 인공지능이 분석한 결과 여러 유형들 중에 행복이 가장 높은 지수로 파악되었습니다.',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 11.0),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                margin: const EdgeInsets.fromLTRB(20.0, 365.0, 20.0, 20.0),
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow> [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 6.0),
                          blurRadius: 5.0
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Top 3',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ),
                        InkWell(onTap:(){},child: Text('more', style: TextStyle(color: faceTagPink, fontSize: 11.0),))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: Container(
                        width: 250.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: faceTagChartBar
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '#Tree',
                                  style: TextStyle(color: Colors.grey.shade600, fontSize: 11.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Text('154', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.0),),
                              ),
                              Icon(Icons.favorite, size: 15.0, color: Colors.red,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: Container(
                        width: 200.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                            color: faceTagChartBar
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '#Tree',
                                  style: TextStyle(color: Colors.grey.shade600, fontSize: 11.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Text('154', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.0),),
                              ),
                              Icon(Icons.favorite, size: 15.0, color: Colors.red,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: Container(
                        width: 150.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                            color: faceTagChartBar
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '#Tree',
                                  style: TextStyle(color: Colors.grey.shade600, fontSize: 11.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Text('154', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.0),),
                              ),
                              Icon(Icons.favorite, size: 15.0, color: Colors.red,)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120.0),
            child: RaisedButton(
              elevation: 5.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              color: faceTagPink,
              child: Text('시작하기', style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.pushNamed(context, '/navigator');
              },
            ),
          )
        ],
      ),
    );
  }
}
