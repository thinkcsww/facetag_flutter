import 'package:flutter/material.dart';
import 'package:facetag/resource/colors.dart';

class TechInfoPage extends StatefulWidget {
  @override
  _TechInfoPageState createState() => _TechInfoPageState();
}

class _TechInfoPageState extends State<TechInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('더 알아보기', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      backgroundColor: faceTagBackground,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          _buildFaceDetectionView(),
          SizedBox(
            height: 40.0,
          ),
          _buildImageLabelingView(),
        ],
      ),
    );
  }

  Widget _buildFaceDetectionView() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey, offset: Offset(0.0, 6.0), blurRadius: 5.0)
        ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Face Detection',
                    style: TextStyle(
                      color: faceTagPink,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                '당신의 셀카를 사용해서 행복지수를 측정해보세요. 인공지능이 당신의 얼굴 표정을 분석해줍니다.',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Image.asset(
                      'images/face_purple.png',
                      width: 50.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Image.asset(
                      'images/face_orange.png',
                      width: 45.0,
                    ),
                  ),
                  Image.asset(
                    'images/face_red.png',
                    width: 55.0,
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildImageLabelingView() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey, offset: Offset(0.0, 6.0), blurRadius: 5.0)
        ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Image Labeling',
                    style: TextStyle(
                      color: faceTagPink,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                '당신의 셀카를 사용해서 행복지수를 측정해보세요. 인공지능이 당신의 얼굴 표정을 분석해줍니다.',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/labeling.png', width: 150.0,),
                ],
              ),
            )
          ],
        ));
  }
}
