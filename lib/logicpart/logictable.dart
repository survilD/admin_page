import 'package:flutter/material.dart';
import 'package:flutter_training_1/screens/utils/row_clumngenerator.dart';
import 'package:hive/hive.dart';

import '../../../dbhelper/database/boxes.dart';

import '../../../model/hive.dart';
import '../screens/utils/constants.dart';



class TableGanrate {
  static tableFetch(Box<Model> box, BuildContext context, Size size) {
    final data = box.values.toList().cast<Model>();

    return DataTable(
      // sortColumnIndex: 1,
      columnSpacing: size.width * 0.048,
      dataRowHeight: 70,
      dividerThickness: 1,
      columns: Data.getcolume(data, context),
      rows: Data.getrow(data, context),
    );
  }
}

class DatePick {
  static date(BuildContext buildContext, TextEditingController controller,
      Model model, DateTime dateTime) async {
    final date = await showDatePicker(
        builder: (BuildContext context, child) {
          return Theme(
              data: ThemeData.dark().copyWith(
                primaryColor: Color(0xFFFF3661),
              ),
              child: child!);
        },
        context: buildContext,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (date == null) {
      return;
    } else {
      if (date.compareTo(postedDate!) > 0) {
        dateTime = date;
        controller.text = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
        return controller.text;
      } else {
        controller.clear();
      }
    }
  }


}

class ButtonResponce{


   static void  onEdit(Model model, GlobalKey<FormState> _key,BuildContext context)  {
    model.save();

    _key.currentState!.reset();
    Navigator.of(context).pop();
  }

 static void  newEntries(Model model, GlobalKey<FormState> _key, BuildContext context) async {
    if (_key.currentState!.validate()) {
      final box = Boxes.getModel();
      await box.add(model);
      _key.currentState!.reset();
      Navigator.of(context).pop();
    }
  }

}
