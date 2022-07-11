

import 'package:drift/drift.dart';

class UserTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get position => text()();
  TextColumn get type => text()();
  TextColumn get gender => text()();
  TextColumn get postedDate => text()();
  TextColumn get lastDateApply => text()();

  TextColumn get closeDate => text()();
  TextColumn get status => text()();
}
