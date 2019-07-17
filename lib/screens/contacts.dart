import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mechat_app/model/contact_model.dart';
import 'dart:convert';
import 'package:lpinyin/lpinyin.dart';
import 'package:flutter/services.dart';
import 'package:azlistview/azlistview.dart';
import 'package:mechat_app/widgets/search_bar.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<ContactInfo> _contacts = List();

  int _suspensionHeight = 40;
  int _itemHeight = 60;
  String _hitTag = "";
  String _suspensionTag = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
//      appBar: AppBar(
//        title: const Text('AzListView example app'),
//      ),
//      navigationBar: PreferredSize(child: CupertinoNavigationBar(middle: Text('联系人'), preferredSize: Size.fromHeight(50.0))),
      navigationBar: CupertinoNavigationBar(middle: Text('联系人')),
      child: Material(
          child: Container(
            padding: EdgeInsets.only(top: 80.0, bottom: 80.0),
            child: AzListView(
              data: _contacts,
              itemBuilder: (context, model) => _buildListItem(model),
              isUseRealIndex: true,
              itemHeight: _itemHeight,
              suspensionHeight: _suspensionHeight,
              suspensionWidget: _buildSusWidget(_suspensionTag),
              header: AzListViewHeader(
              height: 253,
              builder: (context) {
                return Container(
                  color: Colors.white,
                  child: _builderHead2(),
                );
              }),

//          indexBarBuilder: (BuildContext context, List<String> tags,
//              IndexBarTouchCallback onTouch) {
//            return Container(
//              margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
//              decoration: BoxDecoration(
//                  color: Colors.grey[50],
//                  borderRadius: BorderRadius.circular(20.0),
//                  border: Border.all(color: Colors.grey[300], width: .5)),
//              child: ClipRRect(
//                borderRadius: BorderRadius.circular(20.0),
//                child: IndexBar(
//                    data: tags,
//                    itemHeight: 20,
//                    onTouch: (detail) {
//                      onTouch(detail);
//                    }),
//              ),
//            );
//          },

//          indexHintBuilder: (context, hint) {
//            return Container(
//              alignment: Alignment.center,
//              width: 60.0,
//              height: 60.0,
//              decoration: BoxDecoration(
//                color: Colors.blue[700].withAlpha(200),
//                shape: BoxShape.circle,
//              ),
//              child: Text(hint,
//                  style: TextStyle(color: Colors.white, fontSize: 30.0)),
//            );
//          },
        ),
      )),
    );
  }

  void loadData() async {
    rootBundle.loadString('assets/data/contacts.json').then((value) {
      List list = json.decode(value);
      list.forEach((value) {
        _contacts
            .add(ContactInfo(name: value['name'], avartar: value['avartar']));
      });
      _handleList(_contacts);

      setState(() {
        _suspensionTag = _contacts[0].getSuspensionTag();
      });
    });
  }

  void _handleList(List<ContactInfo> contacts) {
    if (contacts == null || contacts.isEmpty) return;
    for (int i = 0; i < contacts.length; i++) {
      String pinyin = PinyinHelper.getPinyin(contacts[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      contacts[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        contacts[i].tagIndex = tag;
      } else {
        contacts[i].tagIndex = "#";
      }
    }
    //根据A-Z排序
    SuspensionUtil.sortListBySuspensionTag(_contacts);
  }

  Widget _buildSusWidget(String susTag) {
    susTag = (susTag == "★" ? "热门城市" : susTag);
    return Container(
      height: _suspensionHeight.toDouble(),
      padding: const EdgeInsets.only(left: 15.0),
      // color: Color(0xfff3f4f5),
      color: Colors.grey[200],
      alignment: Alignment.centerLeft,
      child: Text(
        '$susTag',
        softWrap: false,
        style: TextStyle(fontSize: 14.0, color: Color(0xff999999)),
      ),
    );
  }

  Widget _builderHead2() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: SearchBar(
              controller: TextEditingController(),
              focusNode: FocusNode(),
            ),
          ),
          new Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.only(top: 10.0),
            child: new Container(
              child: new ListTile(
                title: new Text("新的朋友"),
                leading: ClipRRect(
                  child: Image.asset(
                    'assets/images/ic_new_friend.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              height: 50.0,
              color: Colors.white,
            ),
          ),
          new Container(
            child: new ListTile(
              title: new Text("群聊"),
              leading: ClipRRect(
                child: Image.asset(
                  'assets/images/ic_group_chat.png',
                  width: 40.0,
                  height: 40.0,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            height: 50.0,
            color: Colors.white,
          ),
          new Container(
            child: new ListTile(
              title: new Text("标签"),
              leading: ClipRRect(
                child: Image.asset(
                  'assets/images/ic_tag.png',
                  width: 40.0,
                  height: 40.0,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            height: 50.0,
            color: Colors.white,
          ),
          new Container(
            child: new ListTile(
              title: new Text("公众号"),
              leading: ClipRRect(
                child: Image.asset(
                  'assets/images/ic_official_account.png',
                  width: 40.0,
                  height: 40.0,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            height: 50.0,
            color: Colors.white,
          ),
          new Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Center(),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
              child: Image.asset(
            "assets/images/pi.jpg",
            width: 80.0,
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "远行",
              textScaleFactor: 1.2,
            ),
          ),
          Text("+86 182-286-44678"),
        ],
      ),
    );
  }

//  Widget _buildSusWidget(String susTag) {
//    return Container(
//      padding: EdgeInsets.symmetric(horizontal: 15.0),
//      height: _suspensionHeight.toDouble(),
//      width: double.infinity,
//      alignment: Alignment.centerLeft,
//      child: Row(
//        children: <Widget>[
//          Text(
//            '$susTag',
//            textScaleFactor: 1.2,
//          ),
//          Expanded(
//              child: Divider(
//            height: .0,
//            indent: 10.0,
//          ))
//        ],
//      ),
//    );
//  }

  Widget _buildListItem(ContactInfo model) {
    String susTag = model.getSuspensionTag();
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        SizedBox(
            height: _itemHeight.toDouble(),
            child: Column(
              children: <Widget>[
                ListTile(
//                  leading: CircleAvatar(child: Text(model.name[0]),),
//                  leading: Image.asset('assets/avartar/' + model.avartar, width: 35.0, height: 35.0,),
                  leading: ClipRRect(
                    child: Image.asset(
                      'assets/avartar/' + model.avartar,
                      width: 40.0,
                      height: 40.0,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  title: Text(model.name),
                  onTap: () {
                    print("OnItemClick: $model");
//              Navigator.pop(context, model);
                  },
                ),
                new Center(
                  child: new Container(
                    margin:
                        new EdgeInsetsDirectional.only(start: 75.0, end: 1.0),
                    height: 1.0,
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
