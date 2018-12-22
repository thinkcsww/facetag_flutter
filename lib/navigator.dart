import 'package:flutter/material.dart';
import 'setting.dart';
import 'profile.dart';
import 'chat_list.dart';
import 'matching.dart';
import 'colors.dart';


class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {


  String schoolName;
  int currentTab = 0;
  SettingPage settingPage;
  ProfilePage profilePage;
  ChatListPage chatListPage;
  MatchingPage matchingPage;
  Widget currentPage;

  List<Widget> pages;
  List<String> pageTitles;

  @override
  void initState() {
    super.initState();

    settingPage = SettingPage();
    profilePage = ProfilePage();
    chatListPage = ChatListPage();
    matchingPage = MatchingPage();

    pages = [chatListPage, matchingPage, profilePage, settingPage];
    pageTitles = ["Home", "Calendar", "Like", "Chat", "MyPage"];
    currentPage = chatListPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: faceTagPink,
          primaryColor: Colors.white,
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption:TextStyle(color: faceTagPinkDark))
        ),
        child: BottomNavigationBar(

          currentIndex: currentTab,
          onTap: (int index) {
            setState(() {
              currentTab = index;
              currentPage = pages[index];
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text("채팅", style: TextStyle(fontSize: 12.0))),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text("매칭", style: TextStyle(fontSize: 12.0))),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("프로필", style: TextStyle(fontSize: 12.0))),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text("설정", style: TextStyle(fontSize: 12.0))),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
