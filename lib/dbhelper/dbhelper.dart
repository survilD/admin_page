
// import 'dart:io';

// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';

// class DatabaseHelper {
//   final _databaseName = "MyDatabse.db";
//   final _databaseversio = 1;

//   final table = 'my_table';

//   late final columnId = "Id";
//   final columName = "Name";
//   final columnPosition = "Position";
//   final columnjobtype = "Type";
//   final columngender = "Gender";
//   final columnPostedDate = "PostedDate";
//   final columnLastdDate = "LastDateApply";
//   final columnCloseDate = "CloseDate";
//   final status = "Status";

//   late Database _database;

//   DatabaseHelper.privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper.privateConstructor();

//   Future<Database> get database async {
//     _database = await _initDatabase();
//     return _database;
//   }

//   _initDatabase() async {
//     Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, _databaseName);
//     return await openDatabase(
//       path,
//       version: _databaseversio,
//       onCreate: _oncreate,
//     );
//   }

//   Future _oncreate(Database db, int vers) async {
//     try {
//       await db
//           .execute('''CREATE TABLE $table ($columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,$columName TEXT NOT NULL,$columnPosition TEXT NOT NULL,$columnjobtype TEXT NOT NULL,$columngender TEXT NOT NULL,$columnPostedDate TEXT NOT NULL,$columnLastdDate TEXT NOT NULL,$columnCloseDate TEXT NOT NULL,$status TEXT NOT NULL)''').whenComplete(
//               () => print("Created"));
//     } on Exception catch (e) {
//       print(e);
//     }
//   }

//   Future<int?> insert(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     return await db.insert(table, row);
//   }

//   Future<List<Map<String, dynamic>>> queryAllRows() async {
//     Database? db = await instance.database;

//     return await db.query(table);
//   }

//   Future<int?> queryRowCount() async {
//     Database? db = await instance.database;
//     return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
//   }

//   Future<int?> update(Map<String, dynamic> row) async {
//     Database? db = await instance.database;
//     int id = row[columnId];
//     return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
//   }

//   Future<int> delete(int id) async {
//     Database? db = await instance.database;

//     return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
//   }
// }
