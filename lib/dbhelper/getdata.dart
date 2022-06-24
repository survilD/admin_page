import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataGet extends ChangeNotifier {
  Future<List<dynamic>?> getData() async {
    await Future.delayed(Duration(milliseconds: 1000));
    var items = [];
    final String response =
        await rootBundle.loadString('assets/Json/demo.json');
    items = await json.decode(response);

    return items;
  }
}
