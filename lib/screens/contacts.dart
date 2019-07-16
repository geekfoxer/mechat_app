import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('通讯录')),
        child: Center(
      child: Text('我是通讯录页面'),
    ));
  }
}



