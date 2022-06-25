import 'package:flutter/material.dart';
import 'package:flutter_training_1/dbhelper/database/boxes.dart';
import 'package:flutter_training_1/dbhelper/database/hive.dart';

import 'package:flutter_training_1/screens/utils/data.dart';

import 'package:flutter_training_1/screens/desktop/desktop_adddata.dart';
import 'package:flutter_training_1/screens/utils/constants.dart';
import 'package:flutter_training_1/screens/utils/widgets.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '../../responsive.dart';
import '../mobile/mobile_adddata.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({
    Key? key,
  }) : super(key: key);

  @override
  State<DesktopHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<DesktopHome> {
  @override
  void dispose() {
    Hive.box("model").close();
    super.dispose();
  }

  void addData() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Responsive(
                context: context,
                mobile: DataAdd(map: {}, isEdit: false),
                desktop: DesktopDataAdd(
                  model: Model(),
                  isEdit: false,
                ),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: CustomWidgets.webAppBar(size),
      floatingActionButton: CustomWidgets.flotButton(true),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: CustomWidgets.webDrower(size)
          ),
          Expanded(
            flex: 6,
            child: Scrollbar(
              controller: verticalscroll,
              child: SingleChildScrollView(
                controller: verticalscroll,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomWidgets.webBar(size,true, onPressed: addData,),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ValueListenableBuilder<Box<Model>>(
                          valueListenable: Boxes.getModel().listenable(),
                          builder: (BuildContext context, box, _) {
                            if (box.isNotEmpty) {
                              final data = box.values.toList().cast<Model>();

                              List<DataColumn> colm =
                                  Data.getcolume(data, context)
                                      as List<DataColumn>;
                              List<DataRow> row = Data.getrow(data, context);

                              return Scrollbar(
                                scrollbarOrientation:
                                    ScrollbarOrientation.bottom,
                                controller: scrollControllertabel,
                                thickness: 6,
                                radius: Radius.circular(20),
                                child: SingleChildScrollView(
                                  controller: scrollControllertabel,
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: table(
                                            columns: colm,
                                            rows: row,
                                            size: size),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text("Showing 1 of 9 of 9 entries"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            OutlinedButton(
                                                onPressed: () {},
                                                child: Text("Previous"),
                                                style: TextButton.styleFrom(
                                                    primary: kPrimaryColor,
                                                    side: BorderSide(
                                                        color: kPrimaryColor),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)))),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              width: 50,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: kPrimaryColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30))),
                                                onPressed: () {},
                                                child: Text(
                                                  "1",
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            OutlinedButton(
                                                onPressed: () {},
                                                child: Text("Next"),
                                                style: TextButton.styleFrom(
                                                    primary: kPrimaryColor,
                                                    side: BorderSide(
                                                        color: kPrimaryColor),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)))),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                child: Text("No data"),
                              );
                            }
                          },
                        )),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget table(
          {required List<DataColumn> columns,
          required List<DataRow> rows,
          required Size size}) =>
      DataTable(
        sortColumnIndex: 1,
        columnSpacing: size.width * 0.02,
        dataRowHeight: 70,
        dividerThickness: 1,
        columns: columns,
        rows: rows,
      );

  
}
