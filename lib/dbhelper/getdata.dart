import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_training_1/dbhelper/dbhelper.dart';
import 'package:flutter_training_1/model/tabel_model.dart';

class DataGet extends ChangeNotifier {
  
//   Future<List<dynamic>?> getDataLocal() async {
//     await Future.delayed(Duration(milliseconds: 1000));
// var _items = [];
//     final dbHelper = DatabaseHelper.instance;

//     _items = await dbHelper.queryAllRows();
//     notifyListeners();

//     return _items;
//   }

  Future<List<dynamic>?> getData() async {
    await Future.delayed(Duration(milliseconds: 1000));
    var items = [];
    final String response =
        await rootBundle.loadString('assets/Json/demo.json');
    items = await json.decode(response);
    notifyListeners();

    return items;
  }
}
