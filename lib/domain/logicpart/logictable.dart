import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../data/constants.dart';
import '../../data/datasource.dart/boxes.dart';
import '../../data/model/hive_databse.dart';
import '../../presentation/responsive.dart';
import 'row_clumngenerator.dart';

class TableGanrate {
  static tableFetch(List<Model> tabledata, BuildContext context, Size size) {
    return DataTable(
      columnSpacing: Responsive.isDesktop(context)
          ? size.width * 0.047
          : Responsive.isMobile(context)
              ? size.width * 0.07
              : size.width * 0.15,
      dataRowHeight: 70,
      dividerThickness: Responsive.isDesktop(context) ? 1 : 5,
      columns: Data.getcolume(tabledata, context),
      rows: Data.getrow(tabledata, context),
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
      Model model, GlobalKey<FormState> _key, BuildContext context) async {
    await model.save();
  
    _key.currentState!.reset();
     categoryDropdownValue = null;
    genderDropdownValue = null;
    Navigator.pushNamed(context, '/');
  }

  static void newEntries(
      Model model, GlobalKey<FormState> _key, BuildContext context) async {
    if (_key.currentState!.validate()) {
      await Provider.of<Boxes>(context, listen: false).addmodel(model);
      _key.currentState!.reset();
         Navigator.pushNamed(context, '/');
    }
  }
}
