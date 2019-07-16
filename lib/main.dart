import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mechat_app/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      color: Color(0xffd0d0d0),
      home: HomeScreen(),
    );
  }
}

