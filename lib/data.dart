import 'package:flutter/material.dart';
import 'package:flutter_training_1/dbhelper/dbhelper.dart';

import 'package:flutter_training_1/responsive.dart';
import 'package:flutter_training_1/screens/desktop/desktop_adddata.dart';

import 'package:flutter_training_1/screens/desktop/desktop_home.dart';
import 'package:flutter_training_1/screens/mobile/mobile_adddata.dart';

import 'package:flutter_training_1/screens/mobile/mobile_home.dart';
import 'package:flutter_training_1/screens/tablet/tablet_adddata.dart';

import 'package:flutter_training_1/screens/tablet/tablet_home.dart';
import 'package:flutter_training_1/screens/utils/constants.dart';

class Data {
  static final dbHelper = DatabaseHelper.instance;
  static List<DataColumn?> getcolume(List<dynamic> list, BuildContext context) {
    return List.generate(
        Responsive.isMobile(context) ? 4 : list[0].keys.toList().length,
        (index) => DataColumn(
            label: Responsive.isMobile(context)
                ? ((3 > index)
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
                      ))
                : (list[0].keys.toList().length > index)
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
                      ))).toList();
  }

  static List<DataRow> getrow(List<dynamic> getrow, BuildContext context) {
    return List.generate(
        getrow.length,
        (index1) => DataRow(
              cells: _createCell(getrow[index1], index1 + 1, context),
            )).toList();
  }

  static List<DataCell> _createCell(Map m, int index1, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return List.generate(
        Responsive.isMobile(context) ? 4 : m.values.toList().length,
        (index) => Responsive.isMobile(context)
            ? DataCell((3 == index)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                          backgroundColor: kpop.withAlpha(30),
                          child: GestureDetector(
                              onTap: () async {
                                final dbHelper = DatabaseHelper.instance;

                                List<Map> val = await dbHelper.queryAllRows();
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
                                final dbHelper = DatabaseHelper.instance;

                                List<Map> val = await dbHelper.queryAllRows();
                                Map<String, dynamic> map = {};

                                val.forEach((element) {
                                  if (element["Id"] == m["Id"]) {
                                    map = element as Map<String, dynamic>;
                                    print(map);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Responsive(
                                                context: context,
                                                mobile: DataAdd(
                                                  map: map,
                                                  idEdit: true,
                                                ),
                                                tablet: TablateDataAdd(),
                                                desktop: DesktopDataAdd(),
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
                            onTap: () {
                              final dbHelper = DatabaseHelper.instance;
                              dbHelper.delete(m["Id"]);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Responsive(
                                          context: context,
                                          mobile: MobileHome(),
                                          tablet: TablateHome(),
                                          desktop: DesktopHome(),
                                        )),
                              );
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
            : DataCell((m.keys.toList().length - 1 == index)
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
                              print("Tablate& windos");
                            },
                            child: Icon(
                              Icons.delete,
                              color: kpink,
                            ),
                          )),
                    ],
                  )
                : (m.values.toList()[index].toString() == "Active" ||
                        m.values.toList()[index].toString() == "InActive")
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              (m.values.toList()[index].toString() == "Active")
                                  ? kpop.withAlpha(30)
                                  : kpink.withAlpha(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            m.values.toList()[index].toString().toUpperCase(),
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
                          ))).toList();
  }

  static Widget dialog(Map map, Size size) => Dialog(
        child: SizedBox(
            // width: size.width * 0.9,
            // height: size.height * 0.9,
            // ignore: unnecessary_null_comparison
            child: (map != null)
                ? Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: ListView.builder(
                      itemCount: map.length - 1,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            minLeadingWidth: size.width * 0.3,
                            leading: Text(
                              map.keys.toList()[index + 1].toString(),
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            title: Text(
                              map.values
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
                    ),
                  )
                : Center(child: CircularProgressIndicator())),
      );
}
