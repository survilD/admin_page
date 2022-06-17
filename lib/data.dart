import 'package:flutter/material.dart';
import 'package:flutter_training_1/dbhelper/dbhelper.dart';
import 'package:flutter_training_1/model/tabel_model.dart';
import 'package:flutter_training_1/responsive.dart';
import 'package:flutter_training_1/screens/desktop/desktop_adddata.dart';
import 'package:flutter_training_1/screens/desktop/desktop_home.dart';
import 'package:flutter_training_1/screens/mobile/mobile_adddata.dart';
import 'package:flutter_training_1/screens/mobile/mobile_home.dart';
import 'package:flutter_training_1/screens/tablet/tablet_adddata.dart';
import 'package:flutter_training_1/screens/tablet/tablet_home.dart';
import 'package:flutter_training_1/screens/utils/constants.dart';
import 'package:flutter_training_1/screens/viewdetail_screen.dart';

class Data {
  static final dbHelper = DatabaseHelper.instance;
  static List<DataColumn?> getcolume(List<dynamic> list, BuildContext context) {
    return List.generate(
        Responsive.isMobile(context) ? 4 : list[0].keys.toList().length + 1,
        (index) => DataColumn(
            label: Responsive.isMobile(context)
                ? ((3 > index)
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
                      ))
                : (list[0].keys.toList().length > index)
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

  static List<DataRow> getrow(List<dynamic> getrow, BuildContext context) {
    return List.generate(
        getrow.length,
        (index1) => DataRow(
              cells: _createCell(getrow[index1], index1 + 1, context),
            )).toList();
  }

  static List<DataCell> _createCell(Map m, int index1, BuildContext context) {
    return List.generate(
        Responsive.isMobile(context) ? 4 : m.values.toList().length + 1,
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
                                Size size = MediaQuery.of(context).size;

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) => Dialog(
                                          child: SizedBox(
                                              width: size.width * 0.9,
                                              height: size.height * 0.9,
                                              // ignore: unnecessary_null_comparison
                                              child: (map != null)
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 25),
                                                      child: ListView.builder(
                                                        itemCount:
                                                            map.length - 1,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Card(
                                                            child: ListTile(
                                                              leading: Text(map
                                                                  .keys
                                                                  .toList()[
                                                                      index + 1]
                                                                  .toString()),
                                                              title: Text(map
                                                                  .values
                                                                  .toList()[
                                                                      index + 1]
                                                                  .toString()),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    )
                                                  : Center(
                                                      child:
                                                          CircularProgressIndicator())),
                                        ));
                              },
                              child: Icon(Icons.remove_red_eye, color: kpop)),
                          radius: 20),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                          backgroundColor: kpen,
                          child: GestureDetector(
                              onTap: () {},
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
                    : RichText(
                        text: TextSpan(children: [
                        TextSpan(
                          text: m.values.toList()[index].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey[800]),
                        )
                      ])))
            : DataCell((m.keys.toList().length == index)
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
                        : RichText(
                            text: TextSpan(children: [
                            TextSpan(
                              text: m.values.toList()[index].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey[800]),
                            )
                          ])))).toList();
  }
}
