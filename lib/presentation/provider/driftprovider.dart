
import 'package:flutter/cupertino.dart';

import '../../data/datasource.dart/drift_databse.dart';
import 'package:flutter_training_1/roots/shared.dart';

class DataProvider with ChangeNotifier
{
  AppDataBase appDataBase =constructDb();
  List<UserTableData> listDataUser = [] ;


  bool loading = false;
   getUserFuture() {
     loading = true;
     appDataBase.getuserlist.then((value) {
       listDataUser = value;
       loading = false;
       notifyListeners();
     });
   }


     insertUser(UserTableCompanion userTableCompanion) async {
       await appDataBase.insertData(userTableCompanion).whenComplete(() => getUserFuture());
     }

     updateData(UserTableCompanion tableCompanion) {
       appDataBase.updateData(tableCompanion).whenComplete(() => getUserFuture());
     }

     deleteData(int id) {
       appDataBase.deleteData(id).whenComplete(() => getUserFuture());
     }
   }

