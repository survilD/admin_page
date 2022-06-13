import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_training_1/data.dart';
import 'package:flutter_training_1/responsive.dart';
import 'package:flutter_training_1/screens/mobile/mobile_adddata.dart';
import 'package:flutter_training_1/screens/utils/constants.dart';
import 'package:flutter_training_1/screens/utils/widgets.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 5);

  ScrollController scrollControllertabel =
      ScrollController(initialScrollOffset: 5);
  final _drawer = GlobalKey<ScaffoldState>();
  Widget sizebox = const SizedBox(
    width: 5,
  );

  List<IconData> icon = [
    Icons.dashboard,
    Icons.flag,
    Icons.info,
    Icons.monitor_heart,
    Icons.star,
    Icons.health_and_safety_rounded,
    Icons.currency_yen_sharp,
    Icons.print_rounded,
    Icons.horizontal_split,
    Icons.pages_rounded
  ];

  final List drawer = [
    "Dashboard",
    "Jobs",
    "Apps",
    "Chart",
    "Bootstrap",
    "Plugins",
    "Widget",
    "Forms",
    "Table",
    "Pages"
  ];

  void addData() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Responsive(
                name: widget.name,
              )),
    );
  }

  Future<List<dynamic>> getData() async {
    await Future.delayed(Duration(milliseconds: 1000));
    var _items = [];

    var jsonText = await rootBundle.loadString('assets/Json/demo.json');

    _items = json.decode(jsonText);

    return _items;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        key: _drawer,
        drawerEnableOpenDragGesture: false,
        drawer: Padding(
          padding: const EdgeInsets.only(
            top: 60.0,
          ),
          child: SizedBox(
            width: width * 0.65,
            child: Drawer(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                )),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  "https://miro.medium.com/max/554/1*Ld1KM2WSfJ9YQ4oeRf7q4Q.jpeg",
                                ),
                              ),
                              sizebox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome  ${widget.name}",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "Superadmin",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              sizebox,
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey[800],
                                size: 30,
                              )
                            ],
                          ),
                        ),
                        sizebox,
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {},
                              horizontalTitleGap: 20,
                              leading: Icon(
                                icon[index],
                                color: Colors.grey[500],
                              ),
                              title: Text(
                                "${drawer[index]}",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_right,
                                size: 40,
                                color: Colors.grey[400],
                              ),
                              minLeadingWidth: 25,
                            );
                          },
                          itemCount: drawer.length,
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ),
        appBar: CustomWidgets.customAppBar(_drawer),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.small(
              heroTag: null,
              backgroundColor: kPrimaryColor.withAlpha(202),
              onPressed: () {},
              child: Icon(Icons.next_plan_sharp),
            ),
            SizedBox(
              height: 5,
            ),
            FloatingActionButton.small(
              heroTag: null,
              backgroundColor: Color.fromRGBO(28, 202, 210, 1),
              onPressed: () {},
              child: Icon(Icons.headset_mic),
            ),
            SizedBox(
              height: 5,
            ),
            FloatingActionButton.small(
              heroTag: null,
              backgroundColor: Color.fromRGBO(144, 194, 94, 1),
              onPressed: () {},
              child: Icon(Icons.shopping_cart_outlined),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Job List",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.38,
                          child: CupertinoButton(
                            child: const Text(
                              '+ Add New Job',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            onPressed: addData,
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20),
                            padding: const EdgeInsets.all(10),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(child: iconButtonC(Icons.mail, width)),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(child: iconButtonC(Icons.call, width)),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(child: iconButtonC(Icons.info, width))
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Scrollbar(
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    radius: Radius.circular(20),
                    trackVisibility: true,
                    child: SingleChildScrollView(
                      controller: scrollControllertabel,
                      scrollDirection: Axis.horizontal,
                      child: FutureBuilder<List<dynamic>>(
                        future: getData(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List> snapshot) {
                          if (snapshot.hasData) {
                            List<dynamic> data = snapshot.data as List;
                            List<DataColumn> colm = Data.getcolume(data);
                            List<DataRow> row = Data.getrow(data);

                            return Card(
                              child: Column(
                                children: [
                                  DataTable(
                                    columnSpacing: 22,
                                    dataRowHeight: 70,
                                    dividerThickness: 1,
                                    columns: colm,
                                    rows: row,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("Showing 1 of 9 of 9 entries"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
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
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)))),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 50,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: kPrimaryColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
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
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)))),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  )),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconButtonC(IconData icons, double width) {
    return CircleAvatar(
      radius: width * 0.04,
      backgroundColor: kGreen,
      child: Icon(
        icons,
        size: 15,
        color: Colors.white,
      ),
    );
  }
}
