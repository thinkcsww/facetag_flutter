import 'package:flutter/material.dart';
import 'colors.dart';

class ChatRoomPage extends StatefulWidget {
  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('태그 채팅'),
      ),
      endDrawer: Drawer(
        elevation: 20.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Hammad Tariq'),
              accountEmail: Text('developine.com@gmail.com'),
              currentAccountPicture:
              Image.asset('images/face_red.png'),
              decoration: BoxDecoration(color: faceTagPink),
            ),
            Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: ListTile(
                      leading: Icon(Icons.exit_to_app, color: faceTagPink,),
                      trailing: Icon(Icons.alarm_off, color: faceTagPink,),
                      onTap: () {
                        // This line code will close drawer programatically....
                        Navigator.pop(context);
                      },
                    ),
                )
            ),
          ],
        ),
      ),
      backgroundColor: faceTagBackground,
      body: ListView(
        children: <Widget>[
          //Mine
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  width: 300.0,
                  child: ListTile(
                    leading: Image.asset('images/face_red.png', width: 45.0,),
                    title: Container(
                      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white
                      ),
                      child: Text('안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요'),
                    )
                  ),
                ),
              ),
              Text('오후 3:33', style: TextStyle(color: Colors.grey.shade600, fontSize: 12.0),)
            ],
          ),
          //Yours
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('오후 3:33', style: TextStyle(color: Colors.grey.shade600, fontSize: 12.0),),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  width: 300.0,
                  child: ListTile(
                      trailing: Image.asset('images/face_red.png', width: 45.0,),
                      title: Container(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white
                        ),
                        child: Text('안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요'),
                      )
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
