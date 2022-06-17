import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_training_1/dbhelper/dbhelper.dart';
import 'package:flutter_training_1/model/tabel_model.dart';

class DataGet {
  Future<List<dynamic>?> getData() async {
    await Future.delayed(Duration(milliseconds: 1000));

    final dbHelper = DatabaseHelper.instance;
    var _items = [];

    _items = await dbHelper.queryAllRows();

    return _items;
  }
}
