import 'package:drift/drift.dart';

import 'package:flutter/foundation.dart';

part 'drift_databse.g.dart';

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

@DriftDatabase(tables: [UserTable])
class AppDataBase extends _$AppDataBase with ChangeNotifier {
  AppDataBase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
  bool loading = false;
  List<UserTableData> data = [];

  Future<List<UserTableData>> getuserlist() async {
    loading = true;
    data = await select(userTable).get();
    print("get");

    loading = false;
    notifyListeners();
    return data;
  }

  insertData(UserTableCompanion userTableCompanion) async {
    await into(userTable)
        .insert(userTableCompanion)
        .whenComplete(() => getuserlist());
  }

  updateData(UserTableCompanion tableCompanion) async {
    await update(userTable)
        .replace(tableCompanion)
        .whenComplete(() => getuserlist());
  }

  deleteData(int id) async =>
      await (delete(userTable)..where((tbl) => tbl.id.equals(id)))
          .go()
          .whenComplete(() => getuserlist());
}

// LazyDatabase _opeConnection() => LazyDatabase((() async {
//       final dbFolder = await getApplicationDocumentsDirectory();
//       final file = File(p.join(dbFolder.path, "db.sqlite"));
//       return NativeDatabase(file);
//     }));
