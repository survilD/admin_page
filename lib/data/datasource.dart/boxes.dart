import 'package:flutter_training_1/data/datasource.dart/hive_databse.dart';
import 'package:hive/hive.dart';




class Boxes {
  
 final bool isloding=false;
  static Box<Model> getModel() {
    

    return Hive.box<Model>("model");
  }
}
