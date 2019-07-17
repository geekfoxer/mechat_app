import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('发现')),
        child: Center(
          child: Text('我是发现页面'),
        ));
  }
}
