import 'package:mobx/mobx.dart';

import '../dbhelper/dbhelper.dart';
import '../model/tabel_model.dart';

part 'table_mobx.g.dart';

class MxTable = MxTablebase with _$MxTable;

abstract class MxTablebase with Store {
  DatabaseHelper dbHelper = DatabaseHelper.instance;

  @observable
  List<Map<String, dynamic>> jobnew = [];

  @observable
  bool loading = false;

  @action
  Future getPostdata() async {
    loading = true;

    final candiadts = await getLocal();
    jobnew = candiadts;

    loading = false;
  }
  @action
  Future onAdd(context, Job job) async {
    loading = true;
    Map<String, dynamic>? table;

    table = job.toMap();

    await dbHelper.insert(table);

    final candiadts = await getLocal();
    jobnew = candiadts;



    loading = false;
  }


 Future onUpdate(context, Job job, Map<String, dynamic> map) async {
    loading = true;
    Map<String, dynamic> table = job.toMap();
    table["Id"] = map["Id"];

    await dbHelper.update(table);

    final candiadts = await getLocal();
    jobnew = candiadts;


    loading = false;
  }


  Future<List<Map<String, dynamic>>> getLocal() async {
    final dbHelper = DatabaseHelper.instance;

    final items = await dbHelper.queryAllRows();

    return items;
  }
}
