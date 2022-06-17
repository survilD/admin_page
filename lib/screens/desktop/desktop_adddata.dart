import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_training_1/screens/desktop/desktop_adddata.dart';
import 'package:flutter_training_1/screens/mobile/mobile_adddata.dart';
import 'package:flutter_training_1/screens/utils/constants.dart';
import 'package:flutter_training_1/screens/utils/widgets.dart';

class DesktopDataAdd extends StatefulWidget {
  const DesktopDataAdd({
    Key? key,
  }) : super(key: key);

  @override
  State<DesktopDataAdd> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<DesktopDataAdd> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 5);
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _positioncontroller = TextEditingController();
  ScrollController verticalcontroller =
      ScrollController(initialScrollOffset: 5);

  ScrollController scrollControllertabel =
      ScrollController(initialScrollOffset: 5);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  Widget sizebox = const SizedBox(
    width: 5,
  );
  Status _status = Status.Active;
  String categoryDropdownValue = "Choose..";
  String genderDropdownValue = "Choose..";
  List<String> categoryItem = [
    "Part Time",
    "Full Time",
    "Freelancer",
    "Choose.."
  ];
  List<String> genderItem = ["Male", "Female", "Choose.."];
  DateTime postedDate = DateTime(2022, 01, 24);
  DateTime lastdate = DateTime(2022, 01, 24);
  DateTime closedate = DateTime(2022, 01, 24);

  void onchagecategory(String value) {
    setState(() {
      categoryDropdownValue = value;
    });
  }

  Future<DateTime?> pickDate(DateTime dateTime) {
    return showDatePicker(
        builder: (BuildContext context, child) {
          return Theme(
              data: ThemeData.dark().copyWith(
                primaryColor: Color(0xFFFF3661),
              ),
              child: child!);
        },
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
  }

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
                          "New Job",
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
                      iconButtonC(Icons.add, width * 1.9, 30, kGreen),
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
                                        "Welcome  ",
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
            child: Scrollbar(
              child: SingleChildScrollView(
                controller: verticalcontroller,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                            child: const Text(
                              "New Job",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                    child: iconButtonC(
                                        Icons.mail, width * 1.5, 15, kGreen)),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                    child: iconButtonC(
                                        Icons.call, width * 1.5, 15, kGreen)),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                    child: iconButtonC(Icons.info, width * 1.5,
                                        15, kPrimaryColor))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _key,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: height * 0.13,
                                    width: width * 0.9,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: box(
                                                controller: _namecontroller,
                                                error: "Please Enter Name",
                                                title: "Company Name",
                                                width: width)),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Expanded(
                                          child: box(
                                              error:
                                                  "This Field Should Not Empty",
                                              controller: _positioncontroller,
                                              title: "Position",
                                              width: width),
                                        )
                                      ],
                                    )),
                                SizedBox(
                                    height: height * 0.13,
                                    width: width * 0.9,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          children: [
                                            header("Job Type"),
                                            sizebox,
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child:
                                                    CustomWidgets.dropDownForm(
                                                  context: context,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20),
                                                    child: DropdownButton(
                                                        isExpanded: true,
                                                        underline: SizedBox(),
                                                        elevation: 0,
                                                        iconSize: 0,
                                                        value:
                                                            categoryDropdownValue,
                                                        items: categoryItem.map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                          (value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                child:
                                                                    Text(value),
                                                              ),
                                                              value: value,
                                                            );
                                                          },
                                                        ).toList(),
                                                        onChanged: (value) =>
                                                            onchagecategory(value
                                                                .toString())),
                                                  ),
                                                )),
                                          ],
                                        )),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Expanded(
                                            child: Column(
                                          children: [
                                            header("Select Gender:"),
                                            sizebox,
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child:
                                                    CustomWidgets.dropDownForm(
                                                  context: context,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20),
                                                    child: DropdownButton(
                                                        isExpanded: true,
                                                        underline: Container(),
                                                        elevation: 0,
                                                        iconSize: 0,
                                                        value:
                                                            genderDropdownValue,
                                                        items: genderItem.map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                          (value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                child:
                                                                    Text(value),
                                                              ),
                                                              value: value,
                                                            );
                                                          },
                                                        ).toList(),
                                                        onChanged: (value) =>
                                                            setState(() {
                                                              genderDropdownValue =
                                                                  value
                                                                      .toString();
                                                            })),
                                                  ),
                                                )),
                                          ],
                                        ))
                                      ],
                                    )),
                                SizedBox(
                                    height: height * 0.13,
                                    width: width * 0.9,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          children: [
                                            header("Posted Date"),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: CustomWidgets.datepiker(
                                                    context: context,
                                                    onPressed: () async {
                                                      final date =
                                                          await pickDate(
                                                              postedDate);

                                                      if (date == null) {
                                                        return;
                                                      } else {
                                                        setState(() {
                                                          postedDate = date;
                                                        });
                                                      }
                                                    },
                                                    dateTime: postedDate)),
                                          ],
                                        )),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Expanded(
                                            child: Column(
                                          children: [
                                            header("Last Date To Apply"),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: CustomWidgets.datepiker(
                                                  context: context,
                                                  dateTime: lastdate,
                                                  onPressed: () async {
                                                    final date = await pickDate(
                                                        lastdate);

                                                    if (date == null) {
                                                      return;
                                                    } else {
                                                      setState(() {
                                                        lastdate = date;
                                                      });
                                                    }
                                                  },
                                                )),
                                          ],
                                        ))
                                      ],
                                    )),
                                SizedBox(
                                    height: height * 0.13,
                                    width: width * 0.9,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          children: [
                                            header("Close Date"),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: CustomWidgets.datepiker(
                                                  context: context,
                                                  dateTime: closedate,
                                                  onPressed: () async {
                                                    final date = await pickDate(
                                                        closedate);

                                                    if (date == null) {
                                                      return;
                                                    } else {
                                                      setState(() {
                                                        closedate = date;
                                                      });
                                                    }
                                                  },
                                                ))
                                          ],
                                        )),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Expanded(
                                            child: Column(
                                          children: [
                                            header("Posted Date"),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: CustomWidgets.datepiker(
                                                    context: context,
                                                    onPressed: () async {
                                                      final date =
                                                          await pickDate(
                                                              postedDate);

                                                      if (date == null) {
                                                        return;
                                                      } else {
                                                        setState(() {
                                                          postedDate = date;
                                                        });
                                                      }
                                                    },
                                                    dateTime: postedDate)),
                                          ],
                                        ))
                                      ],
                                    )),
                                sizebox,
                                SizedBox(
                                    height: height * 0.13,
                                    width: width * width,
                                    child: Column(
                                      children: [
                                        header("Description:"),
                                        SizedBox(
                                          child: CustomWidgets.newformfield(
                                              name: "Description",
                                              controller: _namecontroller,
                                              error: "Enter Detail"),
                                        )
                                      ],
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Status:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700])),
                                    sizebox,
                                    radioButton(Status.Active),
                                    sizebox,
                                    Text("Active",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700])),
                                    sizebox,
                                    radioButton(Status.InActive),
                                    sizebox,
                                    Text(
                                      "In Active",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.13,
                                  width: width * 0.9,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        child: CupertinoButton(
                                          child: const Text(
                                            ' Close ',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          padding: const EdgeInsets.all(10),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: CupertinoButton(
                                          child: const Text(
                                            ' Submit ',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          onPressed: () {
                                            _key.currentState!.validate();
                                          },
                                          color: kGreen,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          padding: const EdgeInsets.all(10),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
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

  Widget iconButtonC(IconData icons, double width, double size, Color color) {
    return CircleAvatar(
      radius: width * 0.01,
      backgroundColor: color,
      child: Icon(
        icons,
        size: size,
        color: Colors.white,
      ),
    );
  }

  Widget box(
      {String? title,
      TextEditingController? controller,
      String? error,
      double? width}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            sizebox,
            Text(
              title!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            sizebox,
            const Text(
              "*",
              style: TextStyle(color: kPrimaryColor, fontSize: 20),
            )
          ],
        ),
        CustomWidgets.newformfield(controller: controller, error: error)
      ],
    );
  }

  Widget radioButton(
    Status _value,
  ) {
    return Radio(
      visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      value: _value,
      groupValue: _status,
      onChanged: (value) => setState(() {
        _status = _value;
      }),
    );
  }

  Widget header(String title) {
    return Row(
      children: [
        sizebox,
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        sizebox,
        const Text(
          "*",
          style: TextStyle(color: kPrimaryColor, fontSize: 20),
        )
      ],
    );
  }
}
