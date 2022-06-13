import 'package:flutter/material.dart';
import 'package:flutter_training_1/screens/utils/constants.dart';

class Data {
  static List<DataColumn> getcolume(List<dynamic> list) {
    return List.generate(
        list[0].keys.toList().length,
        (index) => DataColumn(
                label: Text(
              list[0].keys.toList()[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ))).toList();
  }

  static List<DataRow> getrow(List<dynamic> getrow) {
    return getrow.map((m) => DataRow(cells: _createCell(m))).toList();
  }

  static List<DataCell> _createCell(Map m) {
    return List.generate(
        m.values.toList().length,
        (index) => DataCell(m.keys.toList()[index].toString() == "Action"
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
                      child: Icon(
                        Icons.delete,
                        color: kpink,
                      )),
                ],
              )
            : (m.values.toList()[index].toString() == "Active" ||
                    m.values.toList()[index].toString() == "InActive")
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (m.values.toList()[index].toString() == "Active")
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
                                    "Active")
                                ? kpop
                                : kpink),
                      ),
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
