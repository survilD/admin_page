import 'package:mobx/mobx.dart';

import '../dbhelper/dbhelper.dart';
import '../model/tabel_model.dart';

part 'table_mobx.g.dart';

class MxTable = MxTablebase with _$MxTable;

abstract class MxTablebase with Store {
  
  final dbHelper = DatabaseHelper.instance;

  @observable
  List<Map<String, dynamic>>? jobnew;
 @observable
  Map<String, dynamic>? table;

  @observable
  bool loading = false;

  @computed
  getPostdata() async {
    loading = true;

    jobnew = await getDataLocal();

    loading = false;
  }

  @computed
  onAdd(context, Job job) async {
    loading = true;
    
    table = job.toMap();

    await dbHelper.insert(table!);
    await getPostdata();

    loading = false;
  }

  @computed
  onUpdate(context, Job job, Map<String, dynamic> map) async {
    loading = true;
    Map<String, dynamic> table = job.toMap();
    table["Id"] = map["Id"];

    await dbHelper.update(table);

    await getPostdata();
    loading = false;
  }
@action
  Future<List<Map<String, dynamic>>> getDataLocal() async {
    List<Map<String, dynamic>>? _items;
    final dbHelper = DatabaseHelper.instance;

    _items = await dbHelper.queryAllRows();

    return _items;
  }
}
