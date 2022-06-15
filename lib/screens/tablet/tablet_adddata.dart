import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_training_1/screens/mobile/mobile_adddata.dart';
import 'package:flutter_training_1/screens/utils/constants.dart';
import 'package:flutter_training_1/screens/utils/widgets.dart';

class TablateDataAdd extends StatefulWidget {
  const TablateDataAdd({Key? key, }) : super(key: key);
 

  @override
  State<TablateDataAdd> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<TablateDataAdd> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 5);
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _positioncontroller = TextEditingController();

  ScrollController scrollControllertabel =
      ScrollController(initialScrollOffset: 5);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  Widget sizebox = const SizedBox(
    width: 5,
  );
  Status _status = Status.active;
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
        child: LayoutBuilder(
      builder: (context, constraints) => Scaffold(
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
                          visible: constraints.maxWidth < 750 &&
                              constraints.maxHeight > 600,
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
                        iconButtonC(
                            Icons.add, width * 1.9, width * 0.03, kGreen),
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
                controller: scrollController,
                thickness: 2,
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    height: height,
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
              child: SingleChildScrollView(
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
                                    radioButton(Status.active),
                                    sizebox,
                                    Text("Active",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700])),
                                    sizebox,
                                    radioButton(Status.inActive),
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
            )
          ],
        ),
      ),
    ));
  }

  Widget iconButtonC(IconData icons, double width, double size, Color? color) {
    return CircleAvatar(
      radius: width * 0.01,
      backgroundColor: color ?? kGreen,
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
