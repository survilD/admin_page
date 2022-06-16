import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_training_1/dbhelper/dbhelper.dart';
import 'package:flutter_training_1/model/tabel_model.dart';

class DataGet {
  Future<List<dynamic>> getData() async {
    await Future.delayed(Duration(milliseconds: 1000));

    final dbHelper = DatabaseHelper.instance;
    var _items = [];

    Map<String, dynamic> row = {
      dbHelper.columName: "Survil",
      dbHelper.columnPosition: 'Network engg',
      dbHelper.columnjobtype: " Full-Time",
      dbHelper.columngender: "male",
      dbHelper.columnPostedDate: "12-01-2021",
      dbHelper.columnLastdDate: "25-01-2021",
      dbHelper.columnCloseDate: "30-01-2021",
      dbHelper.status: "Active"
    };

    // _items = await dbHelper.insert(row) as List;
    _items = await dbHelper.queryAllRows();


    return _items;
  }
}
