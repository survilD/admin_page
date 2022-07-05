import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/hive_databse.dart';

class Boxes extends ChangeNotifier {
  bool isloding = false;
  List<Model> data = [];

  List<Model> getBoxList() {
    data = Hive.box<Model>("model").values.toList().cast<Model>();

    return data;
  }



  addmodel(
    Model model,
  ) async {
    isloding = true;
    final box = Hive.box<Model>("model");
    await box.add(model);
  
    data = getBoxList();
    notifyListeners();
    isloding = false;
  }

  deletemodel(
    Model m,
  ) async {
    isloding = true;
    await m.delete();
    data = getBoxList();

  
    notifyListeners();

    isloding = false;
  }
}
