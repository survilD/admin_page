import 'package:drift/web.dart';

import '../data/datasource.dart/drift_databse.dart';




AppDataBase constructDb() {
  return AppDataBase(WebDatabase("db"));
}
