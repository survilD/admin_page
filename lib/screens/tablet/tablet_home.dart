import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_training_1/data.dart';
import 'package:flutter_training_1/dbhelper/getdata.dart';
import 'package:flutter_training_1/model/tabel_model.dart';
import 'package:flutter_training_1/responsive.dart';
import 'package:flutter_training_1/screens/tablet/tablet_adddata.dart';

import 'package:flutter_training_1/screens/utils/constants.dart';
import 'package:flutter_training_1/screens/utils/widgets.dart';

import '../desktop/desktop_adddata.dart';
import '../mobile/mobile_adddata.dart';

class TablateHome extends StatefulWidget {
  const TablateHome({
    Key? key,
  }) : super(key: key);

  @override
  State<TablateHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<TablateHome> {
  final _drawer = GlobalKey<ScaffoldState>();

  void addData() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Responsive(
                context: context,
                mobile: DataAdd(
                  map: {},
                  idEdit: false,
                ),
                tablet: TablateDataAdd(
                  idEdit: false,
                  map: {},
                ),
                desktop: DesktopDataAdd(),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomWidgets.flotbutton(
                onPressed: () {},
                color: kPrimaryColor.withAlpha(202),
                icons: Icons.next_plan_sharp),
            SizedBox(
              height: 5,
            ),
            CustomWidgets.flotbutton(
                onPressed: () {},
                color: Color.fromRGBO(28, 202, 210, 1),
                icons: Icons.headset_mic),
            SizedBox(
              height: 5,
            ),
            CustomWidgets.flotbutton(
                onPressed: () {},
                color: Color.fromRGBO(144, 194, 94, 1),
                icons: Icons.shopping_cart_outlined),
          ],
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.14),
          child: Container(
              color: Colors.white,
              height: height,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.04),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: kPrimaryColor,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 6,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Visibility(
                          visible: constraints.maxWidth < 750,
                          child: Image.asset(
                            "assets/Image/drawer.png",
                            height: 30,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Visibility(
                          visible: constraints.maxWidth > 750 ? true : false,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: const Text(
                              "Job List",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        iconButtonC(Icons.add, width * 1.9, width * 0.03),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  iconSize: 30,
                                  icon: const Icon(Icons.chat_outlined),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  iconSize: 30,
                                  icon: const Icon(
                                    Icons.notifications_none_outlined,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  iconSize: 30,
                                  icon: const Icon(Icons.settings_outlined),
                                  onPressed: () {},
                                ),
                                CircleAvatar(
                                  radius: width * 0.05,
                                  backgroundImage: NetworkImage(
                                      "https://miro.medium.com/max/554/1*Ld1KM2WSfJ9YQ4oeRf7q4Q.jpeg"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Scrollbar(
                thickness: 2,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    color: Colors.white,
                    width: width * 0.02,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        children: [
                          FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: CircleAvatar(
                                radius: width * 0.045,
                                backgroundImage: NetworkImage(
                                  "https://miro.medium.com/max/554/1*Ld1KM2WSfJ9YQ4oeRf7q4Q.jpeg",
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: drawer.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: GestureDetector(
                                  onTap: () => print(index),
                                  child: Icon(
                                    icon[index],
                                    size: width * 0.04,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Scrollbar(
                child: SingleChildScrollView(
                  controller: verticalscroll,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const FittedBox(
                              child: Text(
                                "Job List",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.15,
                                    height: height * 0.09,
                                    child: CupertinoButton(
                                      child: const FittedBox(
                                        child: Text(
                                          '+ Add New Job',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      onPressed: addData,
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                      padding: const EdgeInsets.all(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      child: iconButtonC(Icons.mail, width * 2,
                                          size.width * 0.02)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      child: iconButtonC(Icons.call, width * 2,
                                          size.width * 0.02)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      child: iconButtonC(Icons.info, width * 2,
                                          size.width * 0.02))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder<List<dynamic>?>(
                            future: DataGet().getData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<dynamic>? data = snapshot.data;
                                List<DataColumn> colm =
                                    Data.getcolume(data!, context)
                                        as List<DataColumn>;

                                List<DataRow> row = [];

                                // Data.getrow(data, context,[]);

                                return Scrollbar(
                                  // controller: scrollControllertabel,
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
                                          child: DataTable(
                                            sortColumnIndex: 1,
                                            columnSpacing: width * 0.09,
                                            dataRowHeight: 70,
                                            dividerThickness: 1,
                                            columns: colm,
                                            rows: row,
                                          ),
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
                                          height: size.height * 0.07,
                                        ),
                                        Text(
                                          copyright,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.02,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                    height: height * 0.8,
                                    child: Center(
                                        child: CircularProgressIndicator()));
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
      ),
    ));
  }

  Widget iconButtonC(IconData icons, double width, double size) {
    return CircleAvatar(
      radius: width * 0.01,
      backgroundColor: kGreen,
      child: Icon(
        icons,
        size: size,
        color: Colors.white,
      ),
    );
  }
}
