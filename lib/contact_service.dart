import 'dart:convert';

import 'package:flutterappday2/contact.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ContactService {
  static const _serviceUrl = "http://rezashamdani.com/echo.php";
  static final _header = {"Content-Type": "application/x-www-form-urlencoded"};

  Future<Contact> createAccount(Contact contact) async {
    try {
      Map<dynamic, dynamic> json = _toJson(contact);
      final response =
          await http.post(_serviceUrl, headers: _header, body: json);
      var jsonString = response.body;
      var c = _fromJson(jsonString);
      return c;
    } catch (e) {
      print("Server Exception");
      print(e);
      return null;
    }
  }

  Contact _fromJson(String jsonContact) {
    Map<dynamic, dynamic> map = jsonDecode(jsonContact);
    var contact = new Contact();
    contact.name = map["name"];
    contact.dob = new DateFormat.yMd().parseStrict(map["dob"]);
    contact.email = map["email"];
    contact.favoriteColor = map["favoriteColor"];
    return contact;
  }

  Map<dynamic, dynamic> _toJson(Contact contact) {
    var mapData = new Map();
    mapData["name"] = contact.name;
    mapData["dob"] = new DateFormat.yMd().format(contact.dob);
    mapData["email"] = contact.email;
    mapData["favoritColor"] = contact.favoriteColor;
    print(mapData);
    return mapData;
  }
}
