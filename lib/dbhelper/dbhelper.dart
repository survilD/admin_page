import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  final _databaseName = "MyDatabse,db";
  final _databaseversio = 1;

  final table = 'my_table';

  late final columnId = "id";
  final columName = "name";
  final columnPosition = "position";
  final columnjobtype = "jobtype";
  final columngender = "gender";
  final columnPostedDate = "postedDate";
  final columnLastdDate = "lastdate";
  final columnCloseDate = "closedate";
  final status = "status";

  late Database _database;

  DatabaseHelper.privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper.privateConstructor();

  Future<Database> get database async {
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseversio,
      onCreate: _oncreate,
    );
  }

  Future _oncreate(Database db, int vers) async {
    try {
      await db
          .execute('''CREATE TABLE $table ($columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,$columName TEXT NOT NULL,$columnPosition TEXT NOT NULL,$columnjobtype TEXT NOT NULL,$columngender TEXT NOT NULL,$columnPostedDate TEXT NOT NULL,$columnLastdDate TEXT NOT NULL,$columnCloseDate TEXT NOT NULL,$status TEXT NOT NULL)''').whenComplete(
              () => print("Created"));
    } on Exception catch (e) {
      print(e);
    }
    ;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;

    return await db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int?> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database? db = await instance.database;

    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
