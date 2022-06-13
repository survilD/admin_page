import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_training_1/screens/utils/constants.dart';
import 'package:flutter_training_1/screens/utils/widgets.dart';

class DataAdd extends StatefulWidget {
  const DataAdd({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<DataAdd> createState() => _DataAddState();
}

class _DataAddState extends State<DataAdd> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 5);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _positioncontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final _drawer = GlobalKey<ScaffoldState>();
  Status _status = Status.active;
  String categoryDropdownValue = "Choose..";
  String genderDropdownValue = "Choose..";
  List<String> categoryItem = [
    "Part Time",
    "Full Time",
    "Freelancer",
    "Choose.."
  ];
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      key: _drawer,
      drawerEnableOpenDragGesture: false,
      drawer: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: SizedBox(
          width: width * 0.65,
          child: Drawer(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
              )),
              child: Scrollbar(
                controller: scrollController,
                isAlwaysShown: true,
                showTrackOnHover: true,
                child: SingleChildScrollView(
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
      body: Scrollbar(
        controller: scrollController,
        isAlwaysShown: true,
        showTrackOnHover: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "New Job",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    sizebox,
                    SizedBox(
                      width: 130,
                    ),
                    sizebox,
                    GestureDetector(
                        child: iconButtonC(Icons.mail, kGreen, width)),
                    sizebox,
                    GestureDetector(
                        child: iconButtonC(Icons.call, kGreen, width)),
                    sizebox,
                    GestureDetector(
                        child: iconButtonC(Icons.info, kPrimaryColor, width)),
                  ],
                ),
              ),
              Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          header("Company Name"),
                          sizebox,
                          CustomWidgets.newformfield(
                              controller: _namecontroller,
                              error: "This Field Should Not Empty"),
                          // decorationForm(
                          //     "This Field Should Not Empty", _namecontroller),
                          const SizedBox(
                            height: 10,
                          ),
                          header("Position"),
                          sizebox,
                          CustomWidgets.newformfield(
                              error: "This Field Should Not Empty",
                              controller: _positioncontroller),
                          const SizedBox(
                            height: 10,
                          ),
                          header("Job Type"),
                          sizebox,
                          Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomWidgets.dropDownForm(
                                context: context,
                                child: DropdownButton(
                                    underline: Container(),
                                    elevation: 0,
                                    iconSize: 0,
                                    value: categoryDropdownValue,
                                    items: categoryItem
                                        .map<DropdownMenuItem<String>>(
                                      (value) {
                                        return DropdownMenuItem<String>(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(value),
                                          ),
                                          value: value,
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) =>
                                        onchagecategory(value.toString())),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          header("Select Gender"),
                          sizebox,
                          Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomWidgets.dropDownForm(
                                  child: DropdownButton(
                                      underline: Container(),
                                      elevation: 0,
                                      iconSize: 0,
                                      value: genderDropdownValue,
                                      items: genderItem
                                          .map<DropdownMenuItem<String>>(
                                        (value) {
                                          return DropdownMenuItem<String>(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(value),
                                            ),
                                            value: value,
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (value) => setState(() {
                                            genderDropdownValue =
                                                value.toString();
                                          })),
                                  context: context)),
                          const SizedBox(
                            height: 10,
                          ),
                          header("Posted Date"),
                          sizebox,
                          Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomWidgets.datepiker(
                                  context: context,
                                  onPressed: () async {
                                    final date = await pickDate(postedDate);

                                    if (date == null) {
                                      return;
                                    } else {
                                      setState(() {
                                        postedDate = date;
                                      });
                                    }
                                  },
                                  dateTime: postedDate)),
                          const SizedBox(
                            height: 10,
                          ),
                          header("Last Date To Apply"),
                          sizebox,
                          Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomWidgets.datepiker(
                                context: context,
                                dateTime: lastdate,
                                onPressed: () async {
                                  final date = await pickDate(lastdate);

                                  if (date == null) {
                                    return;
                                  } else {
                                    setState(() {
                                      lastdate = date;
                                    });
                                  }
                                },
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          header("Close Date"),
                          sizebox,
                          Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomWidgets.datepiker(
                                context: context,
                                dateTime: closedate,
                                onPressed: () async {
                                  final date = await pickDate(closedate);

                                  if (date == null) {
                                    return;
                                  } else {
                                    setState(() {
                                      closedate = date;
                                    });
                                  }
                                },
                              )),

                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
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
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
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
                                  borderRadius: BorderRadius.circular(20),
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
                                  borderRadius: BorderRadius.circular(20),
                                  padding: const EdgeInsets.all(10),
                                ),
                              ),
                            ],
                          ),
                          sizebox,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget iconButtonC(IconData icons, Color color, double width) {
    return CircleAvatar(
      radius: width * 0.048,
      backgroundColor: color,
      child: Icon(
        icons,
        size: 15,
        color: Colors.white,
      ),
    );
  }

  Widget header(String title) {
    return Row(
      children: [
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

  Widget datepick(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: kGrey.withAlpha(30),
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 50,
      width: MediaQuery.of(context).size.width * 70,
      child: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: child,
      ),
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

  Widget sizebox = const SizedBox(
    width: 5,
  );
}

enum Status { active, inActive }
