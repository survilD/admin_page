import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_1/dbhelper/dbhelper.dart';
import 'package:flutter_training_1/model/tabel_model.dart';
import 'package:flutter_training_1/screens/mobile/dataProvider.dart';
import 'package:flutter_training_1/screens/tablet/tablet_home.dart';

import 'package:flutter_training_1/screens/utils/constants.dart';
import 'package:flutter_training_1/screens/utils/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../../responsive.dart';
import '../desktop/desktop_home.dart';
import 'mobile_home.dart';

class DataAdd extends StatefulWidget {
  final Map<String, dynamic> map;
  final bool idEdit;
  const DataAdd({Key? key, required this.map, required this.idEdit})
      : super(key: key);

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

  Job _tableadd = Job();
  Status _status = Status.Active;

  DateTime postedDate = DateTime.now();
  DateTime lastdate = DateTime.now();
  DateTime closedate = DateTime.now();

  void onchagecategory(String value) {
    setState(() {
      // categoryDropdownValue = value;
      _tableadd.type = value;
    });
  }

  @override
  void initState() {
    // List value = widget.map.values.toList();

    super.initState();
    final postMdl = Provider.of<DataProvider>(context, listen: false);
    if (widget.idEdit) {
      _tableadd = Job.fromMap(widget.map);

      _namecontroller.text = _tableadd.name.toString().toUpperCase();
      _positioncontroller.text = _tableadd.position.toString().toUpperCase();
      categoryDropdownValue = _tableadd.type.toString();
      genderDropdownValue = _tableadd.gender.toString();
    }
  }

  Future<DateTime?> pickDate(DateTime dateTime) => showDatePicker(
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

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<DataProvider>(context);
    //  _tableadd = widget.job;
    _tableadd.status = _status.name;
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      key: _drawer,
      drawerEnableOpenDragGesture: false,
      drawer: CustomWidgets.constDrawer(size),
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
                        child: iconButtonC(Icons.mail, kGreen, size.width)),
                    sizebox5,
                    GestureDetector(
                        child: iconButtonC(Icons.call, kGreen, size.width)),
                    sizebox5,
                    GestureDetector(
                        child:
                            iconButtonC(Icons.info, kPrimaryColor, size.width)),
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
                              onSaved: (val) {
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
                                            const EdgeInsets.only(left: 5.0),
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
                                decoration: CustomWidgets.decoration(),
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
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(value),
                                      ),
                                      value: value,
                                    );
                                  },
                                ).toList(),
                                onChanged: (value) => setState(() {
                                      // genderDropdownValue = value.toString();
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
                                  decoration: CustomWidgets.dateDacarotion(
                                    widget.idEdit
                                        ? "${_tableadd.postedDate}"
                                        : "  ${postedDate.day}/${postedDate.month}/${postedDate.year}",
                                  ))),
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
                                  decoration: CustomWidgets.dateDacarotion(widget
                                          .idEdit
                                      ? "${_tableadd.lastDateApply}"
                                      : "  ${lastdate.day}/${lastdate.month}/${lastdate.year}"))),
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
                                  decoration: CustomWidgets.dateDacarotion(
                                    widget.idEdit
                                        ? "${_tableadd.closeDate}"
                                        : "  ${closedate.day}/${closedate.month}/${closedate.year}",
                                  ))),
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

                                    genderDropdownValue = null;
                                    categoryDropdownValue = null;

                                    _key.currentState!.reset();
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
                                  onPressed: () => (widget.idEdit)
                                      ? _edit(postMdl)
                                      : _new(postMdl),
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
              SizedBox(
                height: size.height * 0.07,
              ),
              Text(
                "Copyright © Designed & Developed by Easternts ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              sizebox5,
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _new(DataProvider dataProvider) async {
    if (_key.currentState!.validate()) {
      await dataProvider.onAdd(context, _tableadd);

      _key.currentState!.reset();
      Navigator.of(context).pop();
    }
  }

  void _edit(DataProvider dataProvider) async {
    _key.currentState!.save();
    dataProvider.onUpdate(context, _tableadd, widget.map);

    _key.currentState!.reset();
    Navigator.of(context).pop();
  }

  Widget iconButtonC(IconData icons, Color color, double width) => CircleAvatar(
        radius: width * 0.048,
        backgroundColor: color,
        child: Icon(
          icons,
          size: 15,
          color: Colors.white,
        ),
      );

  Widget header(String title) => Row(
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

  Widget datepick(Widget child) => Container(
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

  Widget radioButton(
    Status _value,
  ) =>
      Radio(
        visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        value: _value,
        groupValue: _status,
        onChanged: (value) => setState(() {
          _status = _value;

          _tableadd.status = _value.name;
        }),
      );
}

enum Status { Active, InActive }
