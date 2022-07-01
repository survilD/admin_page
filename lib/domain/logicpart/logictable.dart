import 'package:flutter/material.dart';

import '../../data/constants.dart';
import '../../data/datasource.dart/drift_database.dart';
import '../../data/model/jobmdoel.dart';
import '../../presentation/responsive.dart';

import 'row_clumngenerator.dart';

class TableGanrate {
  static tableFetch(tabledata, BuildContext context, Size size) {
    if (Responsive.isDesktop(context)) {
      List<ModelData> data = tabledata;
      // final data = tabledata.values.toList().cast<AppDatabse>();
      return DataTable(
          columnSpacing: size.width * 0.048,
          dataRowHeight: 70,
          dividerThickness: 1,
          columns: Data.getcolume(data, context),
          rows: []
          //  Data.getrow(data, context),
          );
    } else {
      List<ModelData> data = tabledata;

      return DataTable(
        columnSpacing: size.width * 0.05,
        // Responsive.isMobile(context) ? size.width * 0.05 : size.width * 0.1,
        dataRowHeight: 70,
        dividerThickness: 5,
        columns: Data.getcolume(data, context),
        rows: Data.getrow(
          data,
          context,
        ),
      );
    }
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

// class ButtonResponce {
//   static void onEdit(
//       Model model, GlobalKey<FormState> _key, BuildContext context) {
//     model.save();

//     _key.currentState!.reset();
//     Navigator.of(context).pop();
//   }

//   static void newEntries(
//       Model model, GlobalKey<FormState> _key, BuildContext context) async {
//     if (_key.currentState!.validate()) {
//       final box = Boxes.getModel();
//       await box.add(model);
//       _key.currentState!.reset();
//       Navigator.of(context).pop();
//     }
//   }
// }
