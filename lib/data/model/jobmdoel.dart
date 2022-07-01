import 'package:drift/drift.dart';

class Model extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get position => text()();
  TextColumn get type => text()();
  TextColumn get gender => text()();
  TextColumn get postedDate => text()();
  TextColumn get lastDateApply => text()();
  // ignore: non_constant_identifier_names
  TextColumn get CloseDate => text()();
  TextColumn get Status => text()();
}