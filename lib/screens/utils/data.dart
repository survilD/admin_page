import 'package:flutter/material.dart';
import 'package:flutter_training_1/dbhelper/database/hive.dart';
import 'package:flutter_training_1/dbhelper/dbhelper.dart';

import 'package:flutter_training_1/responsive.dart';
import 'package:flutter_training_1/screens/desktop/desktop_adddata.dart';

import 'package:flutter_training_1/screens/mobile/mobile_adddata.dart';

import 'package:flutter_training_1/screens/utils/constants.dart';

import '../../dbhelper/database/boxes.dart';
import '../../provider/dataProvider.dart';

class Data {
  // static final dbHelper = DatabaseHelper.instance;
  static List<DataColumn> getcolume(
    List<dynamic> list,
    BuildContext context,
  ) {
    if (Responsive.isDesktop(context)) {
      List<Model>? webclmname = list as List<Model>;
      Map map = webclmname[0].toMap();
      print(map.keys);
      return List.generate(
          map.length + 2,
          (index) => DataColumn(
              label: (map.keys.toList().length + 1 > index)
                  ? (index == 0)
                      ? Text(
                          "ID",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        )
                      : Text(
                          map.keys.toList()[index - 1],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        )
                  : const Text(
                      "Action",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ))).toList();
    } else {
      return List.generate(
          4,
          (index) => DataColumn(
              label: ((3 > index)
                  ? Text(
                      list[0].keys.toList()[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    )
                  : const Text(
                      "Action",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    )))).toList();
    }
  }

  static List<DataRow> getrow(List<dynamic> getrow, BuildContext context,
      {DataProvider? postMdl}) {
    if (Responsive.isDesktop(context)) {
      List<Model>? webclmname = getrow as List<Model>;
      List<Map> newmap = getrow.map((e) => e.toMap()).toList();
      print(newmap);
      // Map map = webclmname[0].toMap();
      // print(map.keys);

      return List.generate(
          newmap.length,
          (index1) => DataRow(
                cells: _createCell(newmap[index1], index1 + 1, context,
                    postMdl: postMdl),
              )).toList();
    } else {
      return List.generate(
          getrow.length,
          (index1) => DataRow(
                cells: _createCell(getrow[index1], index1 + 1, context,
                    postMdl: postMdl),
              )).toList();
    }
  }

  static List<DataCell> _createCell(Map m, int index1, BuildContext context,
      {DataProvider? postMdl}) {
    print(m.values.toList());
    Size size = MediaQuery.of(context).size;
    return List.generate(
        (Responsive.isMobile(context) || Responsive.isTablet(context))
            ? 4
            : m.values.toList().length + 2,
        (index) => (Responsive.isMobile(context) ||
                Responsive.isTablet(context))
            ? DataCell((3 == index)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                          backgroundColor: kpop.withAlpha(30),
                          child: GestureDetector(
                              onTap: () async {
                                List<Map<String, dynamic>> val =
                                    postMdl!.jobnew!;
                                Map<String, dynamic> map = {};

                                val.forEach((element) {
                                  if (element["Id"] == m["Id"]) {
                                    map = element as Map<String, dynamic>;
                                  }
                                });

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        dialog(map, size));
                              },
                              child: Icon(Icons.remove_red_eye, color: kpop)),
                          radius: 20),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                          backgroundColor: kpen,
                          child: GestureDetector(
                              onTap: () async {
                                List<Map<String, dynamic>> val =
                                    postMdl!.jobnew!;
                                Map<String, dynamic> map = {};

                                val.forEach((element) {
                                  if (element["Id"] == m["Id"]) {
                                    map = element;

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Responsive(
                                                context: context,
                                                mobile: DataAdd(
                                                  map: map,
                                                  isEdit: true,
                                                ),
                                                desktop: DesktopDataAdd(
                                                  isEdit: true,
                                                ),
                                              )),
                                    );
                                  }
                                });
                              },
                              child: Icon(Icons.edit_sharp, color: kGreen))),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                          backgroundColor: kpink.withAlpha(50),
                          child: GestureDetector(
                            onTap: () async {
                              final dbHelper = DatabaseHelper.instance;
                              await dbHelper.delete(m["Id"]);
                              postMdl!.getPostdata(context);
                            },
                            child: Icon(
                              Icons.delete,
                              color: kpink,
                            ),
                          )),
                    ],
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
                        m.values.toList()[index].toString().toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[800]),
                      ))
            : DataCell((m.values.toList().length + 1 > index)
                ? (index == 0)
                    ? Text(
                        (index1).toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )
                    : (m.values.toList()[index - 1].toString().toUpperCase() ==
                                "TRUE" ||
                            m.values.toList()[index - 1].toString() == "FALSE")
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (m.values
                                          .toList()[index - 1]
                                          .toString()
                                          .toUpperCase() ==
                                      "TRUE")
                                  ? kpop.withAlpha(30)
                                  : kpink.withAlpha(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                (m.values
                                            .toList()[index - 1]
                                            .toString()
                                            .toUpperCase() ==
                                        "TRUE")
                                    ? "ACTIVE"
                                    : "InActive",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: (m.values
                                                .toList()[index - 1]
                                                .toString()
                                                .toUpperCase() ==
                                            "TRUE")
                                        ? kpop
                                        : kpink),
                              ),
                            ),
                          )
                        : Text(
                            m.values
                                .toList()[index - 1]
                                .toString()
                                .toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey[800]),
                          )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                          backgroundColor: kpop.withAlpha(30),
                          child: GestureDetector(
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      dialog(m, size)),
                              child: Icon(Icons.remove_red_eye, color: kpop)),
                          radius: 20),
                      sizebox5,
                      CircleAvatar(
                          backgroundColor: kpen,
                          child: Icon(Icons.edit_sharp, color: kGreen)),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                          backgroundColor: kpink.withAlpha(50),
                          child: GestureDetector(
                            onTap:() async{
                              
                                              final box = Boxes.getModel();
                                       
                            },
                            child: Icon(
                              Icons.delete,
                              color: kpink,
                            ),
                          )),
                    ],
                  ))).toList();
  }

  static Widget dialog(Map map, Size size) => Dialog(
        child: (map.isNotEmpty)
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: map.length - 1,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shadowColor: kPrimaryColor,
                    child: ListTile(
                      minLeadingWidth: size.width * 0.3,
                      leading: Text(
                        map.keys.toList()[index + 1].toString(),
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        (map.values
                                        .toList()[index + 1]
                                        .toString()
                                        .toUpperCase() ==
                                    "TRUE" ||
                                map.values
                                        .toList()[index + 1]
                                        .toString()
                                        .toUpperCase() ==
                                    "FALSE")
                            ? (map.values
                                        .toList()[index + 1]
                                        .toString()
                                        .toUpperCase() ==
                                    "TRUE")
                                ? "ACTIVE"
                                : "InACTIVE"
                            : map.values
                                .toList()[index + 1]
                                .toString()
                                .toUpperCase(),
                        style: TextStyle(
                            color: kGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      );
}
