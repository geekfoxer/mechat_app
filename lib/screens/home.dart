import 'package:flutter/cupertino.dart';
import 'package:mechat_app/screens/chat.dart';

class HomeScreen extends StatelessWidget {

  static double itemwidth = 25.0;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: Color.fromRGBO(26, 173, 26, 100.0),
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('assets/icon/tabbar_mainframe@3x.png', width: itemwidth, height: itemwidth,),
                activeIcon: Image.asset('assets/icon/tabbar_mainframeHL@3x.png', width: itemwidth, height: itemwidth,),
                title: Text('微信')),
            BottomNavigationBarItem(
                icon: new Image.asset('assets/icon/tabbar_contacts@3x.png', width: itemwidth, height: itemwidth,),
                activeIcon: new Image.asset('assets/icon/tabbar_contactsHL@3x.png', width: itemwidth, height: itemwidth,),
                title: Text('通讯录')),
            BottomNavigationBarItem(
                icon: new Image.asset('assets/icon/tabbar_discover@3x.png', width: itemwidth, height: itemwidth,),
                activeIcon: new Image.asset('assets/icon/tabbar_discoverHL@3x.png', width: itemwidth, height: itemwidth,),
                title: Text('发现')),
            BottomNavigationBarItem(
                icon: new Image.asset('assets/icon/tabbar_me@3x.png', width: itemwidth, height: itemwidth,),
                activeIcon: new Image.asset('assets/icon/tabbar_meHL@3x.png', width: itemwidth, height: itemwidth,),
                title: Text('我')),
          ],
        ),
        tabBuilder: (context, index) {
          if (index == 0) {
            return ChatScreen();
          } else {
            return ChatScreen();
          }
        });
  }
}
