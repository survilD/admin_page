import 'dart:convert';

import 'package:flutter/services.dart';

class DataGet {
  Future<List<dynamic>> getData() async {
    await Future.delayed(Duration(milliseconds: 1000));
    var _items = [];

    var jsonText = await rootBundle.loadString('assets/Json/demo.json');

    _items = json.decode(jsonText);

    return _items;
  }

  //  Future<List<dynamic>> insertdata() async {
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   var _items = [];

  //   var jsonText = await rootBundle.loadString('assets/Json/demo.json');

  //   _items = json.decode(jsonText);

  //   return _items;
  // }
}
