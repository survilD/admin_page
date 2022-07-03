import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/constants.dart';
import '../../data/datasource.dart/boxes.dart';
import '../../data/datasource.dart/hive_databse.dart';
import '../../presentation/responsive.dart';

import 'row_clumngenerator.dart';

class TableGanrate {
  static tableFetch(Box<Model> tabledata, BuildContext context, Size size) {
    final data = tabledata.values.toList().cast<Model>();
    return DataTable(
      columnSpacing: Responsive.isDesktop(context)
          ? size.width * 0.048
          : size.width * 0.07,
      dataRowHeight: 70,
      dividerThickness: Responsive.isDesktop(context) ? 1 : 5,
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
      if (date.compareTo(postedDate) > 0) {
        dateTime = date;
        controller.text = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
        return controller.text;
      } else {
        controller.clear();
      }
    }
  }
}

class ButtonResponce {
  static void onEdit(
      Model model, GlobalKey<FormState> _key, BuildContext context) {
    model.save();

    _key.currentState!.reset();
    Navigator.of(context).pop();
  }

  static void newEntries(
      Model model, GlobalKey<FormState> _key, BuildContext context) async {
    if (_key.currentState!.validate()) {
      final box = Boxes.getModel();
      await box.add(model);
      _key.currentState!.reset();
      Navigator.of(context).pop();
    }
  }
}
