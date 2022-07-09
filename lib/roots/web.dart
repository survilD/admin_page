import 'package:drift/web.dart';

import '../data/model/drift_databse.dart';




AppDataBase constructDb() {
  return AppDataBase(WebDatabase("db"));
}
