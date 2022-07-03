import 'package:drift/drift.dart' as d;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/datasource.dart/boxes.dart';
import '../../data/datasource.dart/hive_databse.dart';
import '../widgets.dart';
import 'mobile_home.dart';

import '../../data/constants.dart';

import 'package:form_field_validator/form_field_validator.dart';

import '../../presentation/responsive.dart';
import '../../domain/enum.dart';

class DataAdd extends StatefulWidget {
  Model model;
  final bool isEdit;
  DataAdd({
    Key? key,
    required this.model,
    required this.isEdit,
  }) : super(key: key);

  @override
  State<DataAdd> createState() => _DataAddState();
}

class _DataAddState extends State<DataAdd> {
  Status _status = Status.Active;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _drawer = GlobalKey<ScaffoldState>();

  Model model = Model();

  final TextEditingController _positioncontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _datePostController = TextEditingController();
  final TextEditingController _dateLastController = TextEditingController();
  final TextEditingController _dateCloseController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.isEdit) {
      model = widget.model;
      print(model);

      _namecontroller.text = model.name!;
      _positioncontroller.text = model.position!;
      categoryDropdownValue = model.type;
      genderDropdownValue = model.gender;
      _status = (model.status == "Active") ? Status.Active : Status.InActive;
    }
  }

  Future<DateTime?> pickDate(DateTime dateTime) => showDatePicker(
      builder: (BuildContext context, child) {
        return Theme(data: ThemeData.dark().copyWith(), child: child!);
      },
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      key: _drawer,
      drawerEnableOpenDragGesture: false,
      drawer: Responsive.isMobile(context)
          ? CustomWidgets.constDrawer(
              size,
            )
          : null,
      appBar: CustomWidgets.customAppBar(_drawer, context, size, false),
      floatingActionButton: CustomWidgets.flotButton(false),
      body: Row(
        children: [
          Visibility(
            visible: !Responsive.isMobile(context),
            child: Expanded(
              flex: 1,
              child: Scrollbar(
                thickness: 2,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    color: Colors.white,
                    width: size.width * 0.02,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        children: [
                          FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: CircleAvatar(
                                radius: size.width * 0.045,
                                backgroundImage: profile,
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
                                    size: size.width * 0.04,
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
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: titel2,
                          ),
                          Row(
                            children: [
                              CustomWidgets.iconButtonC(
                                  Icons.mail,
                                  Responsive.isMobile(context)
                                      ? size.width * 1.1
                                      : size.width * 0.85,
                                  kGreen),
                              sizebox5,
                              CustomWidgets.iconButtonC(
                                  Icons.call,
                                  Responsive.isMobile(context)
                                      ? size.width * 1.1
                                      : size.width * 0.85,
                                  kGreen),
                              sizebox5,
                              CustomWidgets.iconButtonC(
                                  Icons.info,
                                  Responsive.isMobile(context)
                                      ? size.width * 1.1
                                      : size.width * 0.85,
                                  kPrimaryColor)
                            ],
                          )
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
                              child: Responsive.isMobile(context)
                                  ? mobileBody(
                                      () => (widget.isEdit) ? _edit() : _new(),
                                    )
                                  : otherBody(
                                      size,
                                      () => (widget.isEdit) ? _edit() : _new(),
                                    )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Text(
                      copyright,
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
          ),
        ],
      ),
    ));
  }

  mobileBody(void Function()? onPressed) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          header("Company Name"),
          sizebox5,
          CustomWidgets.newformfield(
              name: "Name",
              controller: _namecontroller,
              onSaved: (val) {
                model.name = val;
              },
              error: error),
          const SizedBox(
            height: 10,
          ),
          header("Position"),
          sizebox5,
          CustomWidgets.newformfield(
              name: "Name",
              onSaved: (val) => model.position = val,
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
                hint: const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text("Select Job Type"),
                ),
                iconSize: 0,
                validator: (val) =>
                    val == null ? "Please Select Job Type" : null,
                value: categoryDropdownValue,
                items: categoryItem.map<DropdownMenuItem<String>>(
                  (value1) {
                    return DropdownMenuItem<String>(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(value1),
                      ),
                      value: value1,
                    );
                  },
                ).toList(),
                onChanged: (value) => model.type = value.toString()),
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
                validator: (val) =>
                    val == null ? "Please Select Gender Type" : null,
                value: genderDropdownValue,
                hint: const Padding(
                  padding: EdgeInsets.only(left: 5),
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
                onChanged: (val) => model.gender = val.toString()),
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
                      if (date.compareTo(postedDate) > 0) {
                        postedDate = date;
                        _datePostController.text =
                            " ${postedDate.day}/${postedDate.month}/${postedDate.year}";
                        model.postedDate =
                            " ${postedDate.day}/${postedDate.month}/${postedDate.year}";
                      } else {
                        _datePostController.clear();
                      }
                    }
                  },
                  readOnly: true,
                  controller: _datePostController,
                  validator: RequiredValidator(
                      errorText: "Please Select Correct Date"),
                  decoration: CustomWidgets.dateDacarotion(
                    widget.isEdit
                        ? model.postedDate
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
                      if (date.compareTo(postedDate) > 0) {
                        lastdate = date;
                        _dateLastController.text =
                            " ${lastdate.day}/${lastdate.month}/${lastdate.year}";
                        model.lastDateApply =
                            " ${lastdate.day}/${lastdate.month}/${lastdate.year}";
                      } else {
                        _dateLastController.clear();
                      }
                    }
                  },
                  readOnly: true,
                  controller: _dateLastController,
                  validator: RequiredValidator(
                      errorText: "Please Select Correct Date"),
                  decoration: CustomWidgets.dateDacarotion(widget.isEdit
                      ? model.lastDateApply
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
                      if (date.compareTo(lastdate) > 0) {
                        closedate = date;
                        _dateCloseController.text =
                            " ${closedate.day}/${closedate.month}/${closedate.year}";
                        model.closeDate =
                            " ${closedate.day}/${closedate.month}/${closedate.year}";
                      } else {
                        _dateCloseController.clear();
                      }
                    }
                  },
                  readOnly: true,
                  controller: _dateCloseController,
                  validator: RequiredValidator(
                      errorText: "Please Select Correct Date"),
                  decoration: CustomWidgets.dateDacarotion(
                    widget.isEdit
                        ? model.closeDate
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
                        fontWeight: FontWeight.bold, color: Colors.grey[700])),
                sizebox5,
                radioButton(Status.Active),
                sizebox5,
                Text("Active",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[700])),
                sizebox5,
                radioButton(Status.InActive),
                sizebox5,
                Text(
                  "In Active",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700]),
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    genderDropdownValue = null;
                    categoryDropdownValue = null;

                    _key.currentState!.reset();
                    Navigator.pushNamed(context, "/");
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  onPressed: onPressed,
                  color: kGreen,
                  borderRadius: BorderRadius.circular(20),
                  padding: const EdgeInsets.all(10),
                ),
              ),
            ],
          ),
          sizebox5,
        ],
      );

  otherBody(Size size, void Function()? onPressed) => Column(
        children: [
          SizedBox(
              width: size.width * 0.9,
              child: Row(
                children: [
                  Expanded(
                      child: box(
                    controller: _namecontroller,
                    error: "This Field Should Not Empty",
                    title: "Company Name",
                    width: size.width,
                    onSaved: (val) async {
                      model.name = val;
                    },
                  )),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Expanded(
                    child: box(
                      error: "This Field Should Not Empty",
                      controller: _positioncontroller,
                      title: "Position",
                      width: size.width,
                      onSaved: (val) async {
                        model.position = val;
                      },
                    ),
                  )
                ],
              )),
          SizedBox(
              width: size.width * 0.9,
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      header("Job Type"),
                      sizebox5,
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: DropdownButtonFormField(
                          decoration: CustomWidgets.decoration(),
                          elevation: 0,
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "Select Job Type",
                            ),
                          ),
                          iconSize: 0,
                          validator: (val) =>
                              val == null ? "Please Select Job Type" : null,
                          value: categoryDropdownValue,
                          items: categoryItem.map<DropdownMenuItem<String>>(
                            (value) {
                              return DropdownMenuItem<String>(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(value),
                                ),
                                value: value,
                              );
                            },
                          ).toList(),
                          onChanged: (value) =>
                              model.type = genderDropdownValue,
                        ),
                      )
                    ],
                  )),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      header("Select Gender:"),
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
                            onChanged: (value) =>
                                model.gender = genderDropdownValue),
                      ),
                    ],
                  ))
                ],
              )),
          SizedBox(
              width: size.width * 0.9,
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      header("Posted Date"),
                      Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextFormField(
                              onTap: () async {
                                final date = await pickDate(postedDate);

                                if (date == null) {
                                  return;
                                } else {
                                  if (date.compareTo(postedDate) > 0) {
                                    postedDate = date;
                                    _datePostController.text =
                                        " ${postedDate.day}/${postedDate.month}/${postedDate.year}";
                                    model.postedDate =
                                        " ${postedDate.day}/${postedDate.month}/${postedDate.year}";
                                  } else {
                                    _datePostController.clear();
                                  }
                                }
                              },
                              readOnly: true,
                              controller: _datePostController,
                              validator: RequiredValidator(
                                  errorText: "Please Select Correct Date"),
                              decoration: CustomWidgets.dateDacarotion(
                                widget.isEdit
                                    ? "${model.postedDate}"
                                    : "  ${postedDate.day}/${postedDate.month}/${postedDate.year}",
                              ))),
                    ],
                  )),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      header("Last Date To Apply"),
                      Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextFormField(
                              onTap: () async {
                                final date = await pickDate(lastdate);

                                if (date == null) {
                                  return;
                                } else {
                                  if (date.compareTo(postedDate) > 0) {
                                    lastdate = date;
                                    _dateLastController.text =
                                        " ${lastdate.day}/${lastdate.month}/${lastdate.year}";
                                    model.lastDateApply =
                                        " ${lastdate.day}/${lastdate.month}/${lastdate.year}";
                                  } else {
                                    _dateLastController.clear();
                                  }
                                }
                              },
                              readOnly: true,
                              controller: _dateLastController,
                              validator: RequiredValidator(
                                  errorText: "Please Select Correct Date"),
                              decoration: CustomWidgets.dateDacarotion(widget
                                      .isEdit
                                  ? "${model.lastDateApply}"
                                  : "  ${lastdate.day}/${lastdate.month}/${lastdate.year}"))),
                    ],
                  ))
                ],
              )),
          SizedBox(
              width: size.width * 0.9,
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      header("Close Date"),
                      Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TextFormField(
                              onTap: () async {
                                final date = await pickDate(closedate);

                                if (date == null) {
                                  return;
                                } else {
                                  if (date.compareTo(lastdate) > 0) {
                                    closedate = date;
                                    _dateCloseController.text =
                                        " ${closedate.day}/${closedate.month}/${closedate.year}";
                                    model.closeDate =
                                        " ${closedate.day}/${closedate.month}/${closedate.year}";
                                  } else {
                                    _dateCloseController.clear();
                                  }
                                }
                              },
                              readOnly: true,
                              controller: _dateCloseController,
                              validator: RequiredValidator(
                                  errorText: "Please Select Correct Date"),
                              decoration: CustomWidgets.dateDacarotion(
                                widget.isEdit
                                    ? "${model.closeDate}"
                                    : "  ${closedate.day}/${closedate.month}/${closedate.year}",
                              )))
                    ],
                  )),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      // header("Posted Date"),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                      ),
                    ],
                  ))
                ],
              )),
          sizebox5,
          SizedBox(
              width: size.width * size.width,
              child: Column(
                children: [
                  header("Description:"),
                  SizedBox(
                    child: CustomWidgets.newformfield(
                        name: "Description",
                        controller: _descriptionController,
                        error: "Enter Detail"),
                  )
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Status:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700])),
              sizebox5,
              radioButton(Status.Active),
              sizebox5,
              Text("Active",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700])),
              sizebox5,
              radioButton(Status.InActive),
              sizebox5,
              Text(
                "In Active",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[700]),
              ),
            ],
          ),
          SizedBox(
            width: size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 80,
                  child: CupertinoButton(
                    child: const Text(
                      ' Close ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      categoryDropdownValue = null;
                      genderDropdownValue = null;
                      Navigator.pushNamed(context, '/');
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    onPressed: onPressed,
                    color: kGreen,
                    borderRadius: BorderRadius.circular(20),
                    padding: const EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
          )
        ],
      );

  void _new() async {
    if (_key.currentState!.validate()) {
      model.status = _status.name;
      final box = Boxes.getModel();
      await box.add(model);
      _key.currentState!.reset();
      Navigator.of(context).pop();
    }
  }

  void _edit() async {
    _key.currentState!.save();

    model.save();

    _key.currentState!.reset();
    Navigator.of(context).pop();
  }

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

  Widget box(
          {String? title,
          TextEditingController? controller,
          String? error,
          FormFieldSetter<String>? onSaved,
          double? width}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          header(title!),
          CustomWidgets.newformfield(
              onSaved: onSaved,
              controller: controller,
              error: error,
              name: "Name")
        ],
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

          model.status = _status.name;
        }),
      );
}
