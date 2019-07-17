import 'package:azlistview/azlistview.dart';


class ContactInfo extends ISuspensionBean {
  String name;
  String avartar;
  String tagIndex;
  String namePinyin;


  ContactInfo({this.name, this.avartar, this.tagIndex, this.namePinyin});

  ContactInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'] == null ? "" : json['name'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'tagIndex': tagIndex,
    'namePinyin': namePinyin,
    'isShowSuspension': isShowSuspension
  };

  @override
  String getSuspensionTag() => this.tagIndex;

  @override
  String toString() => "ContactInfo: name: ${this.name}";

}

