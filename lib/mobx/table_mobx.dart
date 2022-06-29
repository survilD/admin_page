// import 'package:mobx/mobx.dart';

// import '../dbhelper/dbhelper.dart';
// import '../model/tabel_model.dart';

// part 'table_mobx.g.dart';

// class MxTable = MxTablebase with _$MxTable;

// abstract class MxTablebase with Store {
//   @observable
//   List<Map<String, dynamic>>? _items;
//   @observable
//   DatabaseHelper dbHelper = DatabaseHelper.instance;

//   @observable
//    List<Map<String, dynamic>>? jobnew = [];
//   @observable
//   Map<String, dynamic>? table;

//   @observable
//   bool loading = false;

//   @action
//   getPostdata() async {
//     loading = true;

//     jobnew = await getDataLocal();

//     loading = false;
//   }

//   onAdd(context, Job job) async {
//     loading = true;

//     table = job.toMap();

//     await dbHelper.insert(table!);
//     // jobnew!.clear();
//     await getPostdata();

//     loading = false;
//   }

//   onUpdate(context, Job job, Map<String, dynamic> map) async {
//     loading = true;
//     Map<String, dynamic> table = job.toMap();
//     table["Id"] = map["Id"];
//     print(jobnew);
//     await dbHelper.update(table);
//     // jobnew!.clear();

//     await getPostdata();
//         print(jobnew);
//     loading = false;
//   }

//   Future<List<Map<String, dynamic>>?> getDataLocal() async {
//     final dbHelper = DatabaseHelper.instance;

//     _items = await dbHelper.queryAllRows();

//     return _items;
//   }
// }
