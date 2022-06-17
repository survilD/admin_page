import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_1/dbhelper/dbhelper.dart';
import 'package:flutter_training_1/model/tabel_model.dart';
import 'package:flutter_training_1/screens/tablet/tablet_home.dart';

import 'package:flutter_training_1/screens/utils/constants.dart';
import 'package:flutter_training_1/screens/utils/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../responsive.dart';
import '../desktop/desktop_home.dart';
import 'mobile_home.dart';

class DataAdd extends StatefulWidget {
  const DataAdd({
    Key? key,
  }) : super(key: key);

  @override
  State<DataAdd> createState() => _DataAddState();
}

class _DataAddState extends State<DataAdd> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _positioncontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _datePostController = TextEditingController();
  final TextEditingController _dateLastController = TextEditingController();
  final TextEditingController _dateCloseController = TextEditingController();
  final _drawer = GlobalKey<ScaffoldState>();

  final Job _tableadd = Job();
  Status _status = Status.Active;

  DateTime postedDate = DateTime.now();
  DateTime lastdate = DateTime.now();
  DateTime closedate = DateTime.now();

  void onchagecategory(String value) {
    setState(() {
      categoryDropdownValue = value;
      _tableadd.type = value;
    });
  }

  void _addData() {}

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
    _tableadd.status = _status.name;
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
                            sizebox5,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome  ",
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
                            sizebox5,
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey[800],
                              size: 30,
                            )
                          ],
                        ),
                      ),
                      sizebox5,
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
          CustomWidgets.flotbutton(
              onPressed: () {},
              color: Color.fromRGBO(28, 202, 210, 1),
              icons: Icons.headset_mic),
          sizebox5,
          CustomWidgets.flotbutton(
              onPressed: () {},
              color: Color.fromRGBO(144, 194, 94, 1),
              icons: Icons.shopping_cart_outlined),
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          controller: verticalscroll,
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
                    sizebox5,
                    SizedBox(
                      width: 130,
                    ),
                    sizebox5,
                    GestureDetector(
                        child: iconButtonC(Icons.mail, kGreen, width)),
                    sizebox5,
                    GestureDetector(
                        child: iconButtonC(Icons.call, kGreen, width)),
                    sizebox5,
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
                          sizebox5,
                          CustomWidgets.newformfield(
                              name: "Name",
                              controller: _namecontroller,
                              onSaved: (val) async {
                                setState(() {
                                  _tableadd.name = _namecontroller.text;
                                });
                              },
                              error: error),
                          const SizedBox(
                            height: 10,
                          ),
                          header("Position"),
                          sizebox5,
                          CustomWidgets.newformfield(
                              name: "Name",
                              onSaved: (newValue) => setState(() {
                                    _tableadd.position =
                                        _positioncontroller.text;
                                  }),
                              error: error,
                              controller: _positioncontroller),
                          const SizedBox(
                            height: 10,
                          ),
                          header("Job Type"),
                          sizebox5,
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: DropdownButtonFormField(
                                decoration: CustomWidgets.decoration(),
                                elevation: 0,
                                hint: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text("Select Job Type"),
                                ),
                                iconSize: 0,
                                validator: (val) => val == null
                                    ? "Please Select Job Type"
                                    : null,
                                value: categoryDropdownValue,
                                items:
                                    categoryItem.map<DropdownMenuItem<String>>(
                                  (value) {
                                    return DropdownMenuItem<String>(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(value),
                                      ),
                                      value: value,
                                    );
                                  },
                                ).toList(),
                                onChanged: (value) =>
                                    onchagecategory(value.toString())),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          header("Select Gender"),
                          sizebox5,
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: kGrey.withAlpha(30),
                                  contentPadding: const EdgeInsets.all(10),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: kGrey.withAlpha(30))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: kGrey.withAlpha(30))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: kGrey.withAlpha(30))),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                ),
                                elevation: 0,
                                iconSize: 0,
                                validator: (val) => val == null
                                    ? "Please Select Gender Type"
                                    : null,
                                value: genderDropdownValue,
                                hint: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text("Select Gender Type"),
                                ),
                                items: genderItem.map<DropdownMenuItem<String>>(
                                  (value) {
                                    return DropdownMenuItem<String>(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(value),
                                      ),
                                      value: value,
                                    );
                                  },
                                ).toList(),
                                onChanged: (value) => setState(() {
                                      genderDropdownValue = value.toString();
                                      _tableadd.gender = value.toString();
                                    })),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          header("Posted Date"),
                          sizebox5,
                          Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: TextFormField(
                                onTap: () async {
                                  final date = await pickDate(postedDate);

                                  if (date == null) {
                                    return;
                                  } else {
                                    setState(() {
                                      if (date.compareTo(postedDate) > 0) {
                                        postedDate = date;
                                        _datePostController.text =
                                            " ${postedDate.day}/${postedDate.month}/${postedDate.year}";
                                        _tableadd.postedDate =
                                            " ${postedDate.day}/${postedDate.month}/${postedDate.year}";
                                      } else {
                                        _datePostController.clear();
                                      }
                                    });
                                  }
                                },
                                readOnly: true,
                                controller: _datePostController,
                                validator: RequiredValidator(
                                    errorText: "Please Select Correct Date"),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: kGrey.withAlpha(30),
                                  contentPadding: const EdgeInsets.all(5),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: kGrey.withAlpha(30))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: kGrey.withAlpha(30))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: kGrey.withAlpha(30))),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                  hintText:
                                      "  ${postedDate.day}/${postedDate.month}/${postedDate.year}",
                                  prefixIcon: Container(
                                    width: 60,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20)),
                                      color: Colors.grey,
                                    ),
                                    child: Icon(
                                      Icons.watch_later_outlined,
                                      color: kGrey,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          header("Last Date To Apply"),
                          sizebox5,
                          Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: TextFormField(
                                onTap: () async {
                                  final date = await pickDate(lastdate);

                                  if (date == null) {
                                    return;
                                  } else {
                                    setState(() {
                                      if (date.compareTo(postedDate) > 0) {
                                        lastdate = date;
                                        _dateLastController.text =
                                            " ${lastdate.day}/${lastdate.month}/${lastdate.year}";
                                        _tableadd.lastDateApply =
                                            " ${lastdate.day}/${lastdate.month}/${lastdate.year}";
                                      } else {
                                        _dateLastController.clear();
                                      }
                                    });
                                  }
                                },
                                readOnly: true,
                                controller: _dateLastController,
                                validator: RequiredValidator(
                                    errorText: "Please Select Correct Date"),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: kGrey.withAlpha(30),
                                  contentPadding: const EdgeInsets.all(5),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: kGrey.withAlpha(30))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: kGrey.withAlpha(30))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: kGrey.withAlpha(30))),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                  hintText:
                                      "  ${lastdate.day}/${lastdate.month}/${lastdate.year}",
                                  prefixIcon: Container(
                                    width: 60,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20)),
                                      color: Colors.grey,
                                    ),
                                    child: Icon(
                                      Icons.watch_later_outlined,
                                      color: kGrey,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          header("Close Date"),
                          sizebox5,
                          Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: TextFormField(
                                onTap: () async {
                                  final date = await pickDate(closedate);

                                  if (date == null) {
                                    return;
                                  } else {
                                    setState(() {
                                      if (date.compareTo(lastdate) > 0) {
                                        closedate = date;
                                        _dateCloseController.text =
                                            " ${closedate.day}/${closedate.month}/${closedate.year}";
                                        _tableadd.closeDate =
                                            " ${closedate.day}/${closedate.month}/${closedate.year}";
                                      } else {
                                        _dateCloseController.clear();
                                      }
                                    });
                                  }
                                },
                                readOnly: true,
                                controller: _dateCloseController,
                                validator: RequiredValidator(
                                    errorText: "Please Select Correct Date"),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: kGrey.withAlpha(30),
                                  contentPadding: const EdgeInsets.all(5),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: kGrey.withAlpha(30))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: kGrey.withAlpha(30))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: kGrey.withAlpha(30))),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                  hintText:
                                      "  ${closedate.day}/${closedate.month}/${closedate.year}",
                                  prefixIcon: Container(
                                    width: 60,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20)),
                                      color: Colors.grey,
                                    ),
                                    child: Icon(
                                      Icons.watch_later_outlined,
                                      color: kGrey,
                                      size: 25,
                                    ),
                                  ),
                                ),
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
                                sizebox5,
                                radioButton(Status.Active),
                                sizebox5,
                                Text("Active",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700])),
                                sizebox5,
                                radioButton(Status.InActive),
                                sizebox5,
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
                                    _key.currentState!.reset();
                                    genderDropdownValue = null;
                                    categoryDropdownValue = null;
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
                                  onPressed: () async {
                                    if (_key.currentState!.validate()) {
                                      final dbHelper = DatabaseHelper.instance;

                                      Map<String, dynamic> table =
                                          _tableadd.toMap();

                                      await dbHelper
                                          .insert(table)
                                          .whenComplete(() => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Responsive(
                                                          context: context,
                                                          mobile: MobileHome(),
                                                          tablet: TablateHome(),
                                                          desktop:
                                                              DesktopHome(),
                                                        )),
                                              ));
                                    }
                                  },
                                  color: kGreen,
                                  borderRadius: BorderRadius.circular(20),
                                  padding: const EdgeInsets.all(10),
                                ),
                              ),
                            ],
                          ),
                          sizebox5,
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
        sizebox5,
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
        print(_tableadd.status);
        _tableadd.status = _value.name;
        print(_tableadd.status);
      }),
    );
  }
}

enum Status { Active, InActive }
