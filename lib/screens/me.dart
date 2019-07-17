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
          weChatPay,
          favritoes,
          divider,
          myPosts,
          divider,
          cards,
          divider,
          stickers,
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

  var weChatPay = Container(
    color: Colors.grey[200],
    padding: EdgeInsets.only(top: 20.0),
    child: Container(
      color: Colors.white,
      height: 50.0,
      child: ListTile(
        leading: Image.asset('assets/images/wechat-pay-line.png', color: Colors.green, width: 23.0, height: 23.0,),
        title: Text('微信支付'),
        trailing: Icon(Icons.arrow_forward_ios, size: 15,),
        onTap: () {
          print('点击钱包 跳转到钱包页面');
        },
      ),
    ),
  );


  var favritoes = Container(
    color: Colors.grey[200],
    padding: EdgeInsets.only(top: 20.0),
    child: Container(
      color: Colors.white,
      height: 50.0,
      child: ListTile(
        leading: Image.asset('assets/images/ic_collections.png', width: 22.0, height: 22.0,),
        title: Text('收藏'),
        trailing: Icon(Icons.arrow_forward_ios, size: 15),
      ),
    ),
  );

  var myPosts = Container(
//    decoration: BoxDecoration(
//        color: Colors.grey[300],
//        border: Border(top: BorderSide(width: 1, color: Colors.grey[200]))
//    ),
    child: Container(
      color: Colors.white,
      height: 50.0,
      child: ListTile(
        leading: Image.asset('assets/images/ic_album.png', width: 22.0, height: 22.0,),
        title: Text('相册'),
        trailing: Icon(Icons.arrow_forward_ios, size: 15,),
      ),
    ),
  );

  var cards = Container(
//    decoration: UnderlineTabIndicator(
//      borderSide: BorderSide(width: 10, color: Colors.grey[200]),
//      insets: EdgeInsets.only(left: 1.0)
//    ),
    child: Container(
      color: Colors.white,
      height: 50.0,
      child: ListTile(
        leading: Icon(Icons.credit_card, color: Colors.green[200],),
        trailing: Icon(Icons.arrow_forward_ios, size: 15,),
        title: Text('卡包'),
      ),
    ),
  );


  var stickers = Container(
//    decoration: BoxDecoration(
//      color: Colors.grey[300],
//      border: Border(top: BorderSide(width: 1, color: Colors.grey[200]))
//    ),
    child: Container(
      color: Colors.white,
      height: 50.0,
      child: ListTile(
        leading: new Icon(Icons.tag_faces, color: Colors.amber[200]),
        trailing: Icon(Icons.arrow_forward_ios, size: 15,),
        title: Text('表情'),
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
        leading: Image.asset('assets/images/ic_settings.png', width: 22.0, height: 22.0,),
        title: Text('设置'),
        trailing: Icon(Icons.arrow_forward_ios, size: 15,),
        onTap: () {
          print('设置....');
        },
      ),
    ),
  );


  var divider = Container(
    child: new SizedBox(
      height: 1.0,
      child: new Center(
        child: new Container(
          margin: new EdgeInsetsDirectional.only(start: 75.0, end: 1.0),
          height: 1.0,
          color: Colors.grey[200],
        ),
      ),
    ),
  );

}
