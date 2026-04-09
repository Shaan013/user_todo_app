import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:user_app/data/model/User_model.dart';
String strResponse = '''{
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {
      "lat": "-37.3159",
      "lng": "81.1496"
    }
  },
  "phone": "1-770-736-8031 x56442",
  "website": "hildegard.org",
  "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
  }
}''';

UserModel getDemoUse() {
  final mapdemo = jsonDecode(strResponse);
  debugPrint("user moap ${mapdemo.runtimeType}  ${mapdemo}");
  UserModel demoUserModel = UserModel.fromJson(mapdemo);
  return demoUserModel;
}
