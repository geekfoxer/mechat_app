import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('聊天')),
        child: Center(
      child: Text('我是聊天页面'),
    ));
  }
}



