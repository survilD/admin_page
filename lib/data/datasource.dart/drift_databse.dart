import 'package:drift/drift.dart';

import '../model/userModel.dart';



part 'drift_databse.g.dart';


@DriftDatabase(tables: [UserTable])
class AppDataBase extends _$AppDataBase  {
  AppDataBase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;




  Future<List<UserTableData>>  get getuserlist async=>await
     select(userTable).get();

Stream<List<UserTableData>> getUserstreamList(){
    return  select(userTable).watch();
}


 Future insertData(UserTableCompanion userTableCompanion) async {
    await into(userTable)
        .insert(userTableCompanion);

  }

 Future updateData(UserTableCompanion tableCompanion) async {
    await update(userTable)
        .replace(tableCompanion)
        ;
  }

Future<int>  deleteData(int id) async =>
      await (delete(userTable)..where((tbl) => tbl.id.equals(id)))
          .go()
         ;
}


