import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_training_1/dbhelper/dbhelper.dart';
import 'package:flutter_training_1/model/tabel_model.dart';

class DataGet {
  Future<List<dynamic>?> getDataLocal() async {
    await Future.delayed(Duration(milliseconds: 1000));

    final dbHelper = DatabaseHelper.instance;
    var _items = [];

    _items = await dbHelper.queryAllRows();

    return _items;
  }

  Future<List<dynamic>?> getData() async {
    await Future.delayed(Duration(milliseconds: 1000));

    var _items = [];
    final String response =
        await rootBundle.loadString('assets/Json/demo.json');
    _items = await json.decode(response);

    return _items;
  }
}
