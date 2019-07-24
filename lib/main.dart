import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mechat_app/screens/home.dart';

import 'loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: _defaultCupertinoThemeData,
      color: Color(0xffd0d0d0),
      home: LoadingPage(),
    );
  }
}


final CupertinoThemeData _defaultCupertinoThemeData = new CupertinoThemeData(
  primaryColor: Color(0xff303030),
  scaffoldBackgroundColor: Color(0xffebebeb),
);


final ThemeData _defaultThemeData = new ThemeData(
  primaryColor: Color(0xff303030),
  scaffoldBackgroundColor: Color(0xffebebeb),
  cardColor: Color(0xff393a3f)
);


