import 'package:flutter/material.dart';
import 'package:facetag/resource/colors.dart';
import 'page_chat_room.dart';

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
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
                '채팅',
                style:
                TextStyle(color: faceTagPink, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: ListTile(
              leading: Image.asset('images/logo.png', width: 40.0,),
              title: Text('#Paper', style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text('안녕하세요', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),),
              trailing: Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: Text('오후 4:33', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.grey.shade500)),
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage()));},
            ),
          )
        ],
      ),
    );
  }
}
