import 'package:flutter/material.dart';
import 'package:flutter_training_1/dbhelper/dbhelper.dart';
import 'package:flutter_training_1/screens/utils/constants.dart';

class Data {
  static List<DataColumn?> getcolume(List<dynamic> list) {
    return List.generate(
        list[0].keys.toList().length + 1,
        (index) => DataColumn(
            label: (list[0].keys.toList().length > index)
                ? Text(
                    list[0].keys.toList()[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  )
                : Text(
                    "Action",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ))).toList();
  }

  // static List<DataRow> getrow(List<dynamic> getrow) {
  //   return getrow
  //       .map((m) => DataRow(
  //             cells: _createCell(m, getrow.length),
  //           ))
  //       .toList();
  // }

  static List<DataRow> getrow(List<dynamic> getrow) {
    return List.generate(
        getrow.length,
        (index1) => DataRow(
              cells: _createCell(getrow[index1], index1 + 1),
            )).toList();

    //  getrow
    //     .map((m) => DataRow(
    //           cells: _createCell(m, getrow.length),
    //         ))
    //     .toList();
  }

  static List<DataCell> _createCell(Map m, int index1) {
    return List.generate(
        m.values.toList().length + 1,
        (index) => DataCell((m.keys.toList().length == index)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      backgroundColor: kpop.withAlpha(30),
                      child: Icon(Icons.remove_red_eye, color: kpop),
                      radius: 20),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                      backgroundColor: kpen,
                      child: Icon(Icons.edit_sharp, color: kGreen)),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                      backgroundColor: kpink.withAlpha(50),
                      child: GestureDetector(
                        onTap: () {
                          final dbHelper = DatabaseHelper.instance;
                          dbHelper.delete(m["Id"]);
                        },
                        child: Icon(
                          Icons.delete,
                          color: kpink,
                        ),
                      )),
                ],
              )
            : (m.values.toList()[index].toString() == "ACTIVE" ||
                    m.values.toList()[index].toString() == "INACTIVE")
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (m.values.toList()[index].toString() == "ACTIVE")
                          ? kpop.withAlpha(30)
                          : kpink.withAlpha(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        m.values.toList()[index].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: (m.values.toList()[index].toString() ==
                                    "ACTIVE")
                                ? kpop
                                : kpink),
                      ),
                    ),
                  )
                : (index == 0)
                    ? Text(
                        (index1).toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )
                    : Text(
                        m.values.toList()[index].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[800]),
                      ))).toList();
  }
}
