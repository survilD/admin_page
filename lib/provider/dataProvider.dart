import 'package:flutter/material.dart';
import 'package:flutter_training_1/model/tabel_model.dart';

import '../dbhelper/dbhelper.dart';

class DataProvider with ChangeNotifier {
  final dbHelper = DatabaseHelper.instance;

  List<Map<String, dynamic>>? jobnew;
  bool loading = false;

  getPostdata() async {
    loading = true;

    jobnew = await getDataLocal();
    loading = false;
    notifyListeners();
  }

  onAdd(context, Job job) async {
    loading = true;
    Map<String, dynamic> table = job.toMap();

    await dbHelper.insert(table);
    await getPostdata();
  }

  onUpdate(context, Job job, Map<String, dynamic> map) async {
    loading = true;
    Map<String, dynamic> table = job.toMap();
    table["Id"] = map["Id"];

    await dbHelper.update(table);

    await getPostdata();
  }

  Future<List<Map<String, dynamic>>> getDataLocal() async {
    List<Map<String, dynamic>>? _items;
    final dbHelper = DatabaseHelper.instance;

    _items = await dbHelper.queryAllRows();

    return _items;
  }
}
