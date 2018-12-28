import 'package:flutter/material.dart';
import 'package:facetag/resource/colors.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: faceTagBackground,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '설정',
                style:
                TextStyle(color: faceTagPink, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 30.0,),
          _buildNoticeView(),
          _buildVersionInfoView(),
          _buildPrivateView(),
          _buildAlarmView(),
          _buildTermOfUseView(),
          _buildSignOutView(),
        ],
      ),
    );
  }

  Widget _buildNoticeView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.grey, offset: Offset(0.0, 6.0), blurRadius: 5.0)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        leading: Icon(Icons.flag, color: faceTagPink,),
        title: Text('공지사항', style: TextStyle(color: faceTagPink, fontWeight: FontWeight.bold, fontSize: 14.0,),),
        onTap: (){},
      )
    );
  }

  Widget _buildVersionInfoView() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.grey, offset: Offset(0.0, 6.0), blurRadius: 5.0)
        ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: ListTile(
          leading: Icon(Icons.flag, color: faceTagPinkDark),
          title: Text('버전정보', style: TextStyle(color: faceTagPinkDark, fontWeight: FontWeight.bold, fontSize: 14.0,),),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text('1.0', style: TextStyle(color: faceTagPinkDark, fontWeight: FontWeight.bold, fontSize: 12.0),),
          ),
          onTap: (){},
        )
    );
  }

  Widget _buildPrivateView() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.grey, offset: Offset(0.0, 6.0), blurRadius: 5.0)
        ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: ListTile(
          leading: Icon(Icons.flag, color: faceTagPinkDark),
          title: Text('개인', style: TextStyle(color: faceTagPinkDark, fontWeight: FontWeight.bold, fontSize: 14.0,),),
          onTap: (){},
        )
    );
  }

  Widget _buildAlarmView() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.grey, offset: Offset(0.0, 6.0), blurRadius: 5.0)
        ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: ListTile(
          leading: Icon(Icons.flag, color: faceTagPinkDark),
          title: Text('알림', style: TextStyle(color: faceTagPinkDark, fontWeight: FontWeight.bold, fontSize: 14.0,),),
          onTap: (){},
        )
    );
  }

  Widget _buildTermOfUseView() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.grey, offset: Offset(0.0, 6.0), blurRadius: 5.0)
        ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: ListTile(
          leading: Icon(Icons.flag, color: faceTagPinkDark),
          title: Text('서비스 이용약관', style: TextStyle(color: faceTagPinkDark, fontWeight: FontWeight.bold, fontSize: 14.0,),),
          onTap: (){},
        )
    );
  }

  Widget _buildSignOutView() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.grey, offset: Offset(0.0, 6.0), blurRadius: 5.0)
        ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: ListTile(
          leading: Icon(Icons.flag, color: faceTagPinkDark),
          title: Text('로그아웃', style: TextStyle(color: faceTagPinkDark, fontWeight: FontWeight.bold, fontSize: 14.0,),),
          onTap: (){},
        )
    );
  }
}
