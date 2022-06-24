import 'package:hive/hive.dart';

import 'hive.dart';

class Boxes {
  static Box<Model> getModel() => Hive.box<Model>("model");
}
