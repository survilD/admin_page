import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_training_1/data.dart';

import 'package:flutter_training_1/screens/utils/constants.dart';

import '../../responsive.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<DesktopHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<DesktopHome> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 5);

  ScrollController scrollControllertabel =
      ScrollController(initialScrollOffset: 5);

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
    var _items = [];

    var jsonText = await rootBundle.loadString('assets/Json/demo.json');

    _items = await json.decode(jsonText);

    return _items;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.14),
        child: Container(
            color: Colors.white,
            height: height,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: CircleAvatar(
                            radius: width * 0.02,
                            backgroundColor: kPrimaryColor,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jobick",
                                style: TextStyle(
                                    fontSize: width * 0.019,
                                    fontWeight: FontWeight.bold),
                              ),
                              FittedBox(
                                child: Text(
                                  "Job Admin Dashboard",
                                  style: TextStyle(
                                      fontSize: width * 0.01, color: kGrey),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        "assets/Image/drawer.png",
                        height: 40,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: const Text(
                          "Job List",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.07,
                      ),
                      FittedBox(
                        child: SizedBox(
                          width: width * 0.18,
                          child: TextField(
                            cursorHeight: 20,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                size: 35,
                                color: Colors.black,
                              ),
                              hintStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                              filled: true,
                              fillColor: kGrey.withAlpha(30),
                              contentPadding: const EdgeInsets.all(15),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: kGrey.withAlpha(30))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: kGrey.withAlpha(30))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      iconButtonC(Icons.add, width * 1.9, 30),
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
                                radius: width * 0.03,
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            backgroundColor: kPrimaryColor.withAlpha(202),
            onPressed: () {},
            child: Icon(Icons.next_plan_sharp),
          ),
          SizedBox(
            height: 5,
          ),
          FloatingActionButton.small(
            backgroundColor: Color.fromRGBO(28, 202, 210, 1),
            onPressed: () {},
            child: Icon(Icons.headset_mic),
          ),
          SizedBox(
            height: 5,
          ),
          FloatingActionButton.small(
            backgroundColor: Color.fromRGBO(144, 194, 94, 1),
            onPressed: () {},
            child: Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Scrollbar(
              controller: scrollController,
              thickness: 2,
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  height: height,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.12,
                          child: FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                    "https://miro.medium.com/max/554/1*Ld1KM2WSfJ9YQ4oeRf7q4Q.jpeg",
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 30, left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Welcome  ${widget.name}",
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
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
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey[800],
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: drawer.length,
                            itemBuilder: (context, index) {
                              return FittedBox(
                                child: GestureDetector(
                                  onTap: () => print(index),
                                  child: Row(
                                    children: [
                                      Icon(
                                        icon[index],
                                        color: Colors.grey[500],
                                      ),
                                      SizedBox(
                                        width: width * 0.08,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            "${drawer[index]}",
                                            style: TextStyle(
                                              fontSize: width * 0.01,
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_right,
                                        size: 40,
                                        color: Colors.grey[400],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          child: const Text(
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
                                width: width * 0.1,
                                child: CupertinoButton(
                                  child: FittedBox(
                                    child: const Text(
                                      '+ Add New Job',
                                      style: TextStyle(
                                          fontSize: 15,
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
                                  child:
                                      iconButtonC(Icons.mail, width * 1.5, 15)),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                  child:
                                      iconButtonC(Icons.call, width * 1.5, 15)),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                  child:
                                      iconButtonC(Icons.info, width * 1.5, 15))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: FutureBuilder<List<dynamic>>(
                        future: getData(),
                        builder: (context, snapshot) {
                          List<dynamic>? data = snapshot.data;
                          List<DataColumn> colm = Data.getcolume(data!);
                          List<DataRow> row = Data.getrow(data);
                          return (snapshot.hasData)
                              ? Scrollbar(
                                  controller: scrollControllertabel,
                                  // scrollbarOrientation:
                                  //     ScrollbarOrientation.bottom,
                                  isAlwaysShown: true,
                                  showTrackOnHover: true,
                                  thickness: 6,
                                  radius: Radius.circular(20),
                                  trackVisibility: true,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: DataTable(
                                            sortColumnIndex: 1,
                                            columnSpacing: width * 0.05,
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
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : CircularProgressIndicator();
                        },
                      )),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          )
        ],
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
