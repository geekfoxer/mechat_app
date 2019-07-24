import 'package:flutter/material.dart';
import 'dart:async';

/// 这是app进入后的loading页面。。。

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {


  @override
  void initState() {
    super.initState();
    // 异步加载3s
    new Future.delayed(Duration(seconds: 3), (){
      print("Flutter聊天程序启动...");
      // 导航器，就是跳转到app的页面
      // Navigator.of(context).pushReplacementNamed("app");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/images/loading.jpg", fit: BoxFit.fill,),
    );
  }
}


