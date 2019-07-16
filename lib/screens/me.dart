import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          camera,
          meInfo,
          wallet,
          setting
        ],
      ),
    );
  }

  var camera = Container(
    padding: EdgeInsets.only(top: 20),
    child: Container(
      color: Colors.white,
      height: 30,
      child:  Icon(Icons.camera_alt, color: Colors.black, size: 25.0,))
  );

  var meInfo = Container(
    padding: EdgeInsets.only(top: 40.0),
    color: Colors.white,
    child: Container(
      color: Colors.white,
      height: 80.0,
      child: ListTile(
        leading: Image.asset('assets/images/pi.jpg', width: 50.0, height: 50.0,),
        title: Text('皮智慧'),
        subtitle: Text('微信号: pizhihui000'),
        trailing: Icon(Icons.fullscreen),
        onTap: (){
          print('点开我的头像');
        },
      ),
    ),
  );


  var wallet = Container(
    color: Colors.grey[200],
    padding: EdgeInsets.only(top: 20.0),
    child: Container(
      color: Colors.white,
      height: 50.0,
      child: ListTile(
        leading: new Icon(Icons.call_to_action, color: Colors.green),
        title: Text('钱包'),
        onTap: () {
          print('点击钱包 跳转到钱包页面');
        },
      ),
    ),
  );

  var setting = Container(
    color: Colors.grey[200],
    padding: EdgeInsets.only(top: 20.0),
    child: Container(
      color: Colors.white,
      height: 50.0,
      child: ListTile(
        leading: Icon(Icons.settings, color: Colors.blue,),
        title: Text('设置'),
        onTap: () {
          print('设置....');
        },
      ),
    ),
  );
}
