// import 'dart:io';

// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
// part 'moor_database.g.dart';

// class Model extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get name => text()();
//   TextColumn get position => text()();
//   TextColumn get type => text()();
//   TextColumn get gender => text()();
//   TextColumn get postedDate => text()();
//   TextColumn get lastDateApply => text()();
//   TextColumn get CloseDate => text()();
//   TextColumn get Status => text()();
// }

// LazyDatabase _openConnection() {
//   // the LazyDatabase util lets us find the right location for the file async.
//   return LazyDatabase(() async {
//     // put the database file, called db.sqlite here, into the documents folder
//     // for your app.
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return NativeDatabase(file);
//   });
// }

// @DriftDatabase(tables: [Model])
// class AppDatabse extends _$AppDatabse {
//   AppDatabse() : super(_openConnection());

//   @override
//   int get schemaVersion => 1;

//   Future<List<ModelData>> get getdatalist async {
//     return await select(model).get();
//   }

//   Future<int> insert(ModelCompanion modelCompanion) async {
//     return await into(model).insert(modelCompanion);
//   }

//   // emit new items whenever the underlying data changes.

// }
