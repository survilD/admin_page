import 'package:hive/hive.dart';

import '../model/hive_databse.dart';




class Boxes {
  
 final bool isloding=false;
  static Box<Model> getModel() {
    

    return Hive.box<Model>("model");
  }
}
