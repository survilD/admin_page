// import 'dart:io';

// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;

// import '../../data/model/jobmdoel.dart';
// part 'drift_database.g.dart';



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

//   Stream<List<ModelData>>  getdatalist () {
//     return ( select(model)).watch();
//   }

//   Future<int> insert(ModelCompanion modelCompanion) async {
//     return await into(model).insert(modelCompanion);
//   }

//   Future updateTodo(ModelCompanion modelData) async {
//     return await update(model).replace(modelData);
//   }

//   Future<void> deleteUSer(ModelCompanion modelCompanion) async{
//     // delete the oldest nine tasks
//      await (delete(model)..where((tbl) => tbl.id.equals(modelCompanion.id.value))).go();
//   }

//   // emit new items whenever the underlying data changes.

// }
