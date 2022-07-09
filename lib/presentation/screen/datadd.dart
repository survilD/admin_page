import 'package:drift/drift.dart' as d;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/model/drift_databse.dart';

import 'widgets/flotButton.dart';
import 'widgets/mobileAppBar.dart';
import 'widgets/pageheading.dart';

import 'home.dart';

import '../../domain/logicpart/logictable.dart';
import 'widgets/widgets.dart';

import '../../data/constants.dart';

import 'package:form_field_validator/form_field_validator.dart';

import '../../presentation/responsive.dart';
import '../../domain/enum.dart';

import 'widgets/desktopAppbar.dart';
import 'widgets/webDrawer.dart';

// ignore: must_be_immutable
class DataAdd extends StatefulWidget {
  final VoidCallback? onFlip;
  final UserTableCompanion model;
  final bool isEdit;
  const DataAdd({
    Key? key,
    required this.model,
    required this.isEdit,
    this.onFlip,
  }) : super(key: key);

  @override
  State<DataAdd> createState() => _DataAddState();
}

class _DataAddState extends State<DataAdd> with SingleTickerProviderStateMixin {
  Status _status = Status.Active;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _drawer = GlobalKey<ScaffoldState>();

  UserTableCompanion model = const UserTableCompanion();

  // textediting controller

  final TextEditingController _positioncontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _datePostController = TextEditingController();
  final TextEditingController _dateLastController = TextEditingController();
  final TextEditingController _dateCloseController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  late final AnimationController _animationcontroller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animationcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationcontroller);
    animation.addListener(() {
      setState(() {
        print(animation.value.toString());
      });
    });
    _animationcontroller.forward();

    if (widget.isEdit) {
      model = widget.model;
      _namecontroller.text = model.name.value;
      _positioncontroller.text = model.position.value;
      categoryDropdownValue = model.type.value;
      genderDropdownValue = model.gender.value;

      _status = (model.status == "Active") ? Status.Active : Status.InActive;
    } else {
      model.copyWith(status: const d.Value("Active"));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isEdit) {
      model = model.copyWith(status: d.Value(_status.name));
    }
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: FadeTransition(
      opacity: animation,
      child: Scaffold(
        key: _drawer,
        drawerEnableOpenDragGesture: false,
        drawer: Responsive.isMobile(context) ? CostomeDrawer() : null,
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size.fromHeight(size.height * 0.14),
                child: const DesktopAppBar(isFirst: false))
            : PreferredSize(
                child: MobileAppBar(
                  drawer: _drawer,
                  isFirst: false,
                ),
                preferredSize: Size.fromHeight(size.height * 0.1),
              ),
        floatingActionButton: const CustomeFlotButton(isFirst: false),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: !Responsive.isMobile(context),
              child: const Expanded(flex: 1, child: WEbDrawer()),
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
                        child: PageHeading(
                          isFirst: false,
                          onPressed: () =>
                              Navigator.pushNamed(context, "/second"),
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
                                        () => (widget.isEdit)
                                            ? ButtonResponce.onEdit(
                                                model, _key, context)
                                            : ButtonResponce.newEntries(
                                                model, _key, context),
                                      )
                                    : otherBody(
                                        size,
                                        () => (widget.isEdit)
                                            ? ButtonResponce.onEdit(
                                                model, _key, context)
                                            : ButtonResponce.newEntries(
                                                model, _key, context),
                                      )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.07,
                      ),
                      const Text(
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
      ),
    ));
  }

  mobileBody(void Function()? onPressed) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomWidgets.box(
              title: "Company Name",
              widget: CustomWidgets.newformfield(
                  onSaved: (val) => model = model.copyWith(name: d.Value(val!)),
                  controller: _namecontroller,
                  error: error,
                  name: "Name")),
          const SizedBox(
            height: 10,
          ),
          CustomWidgets.box(
            widget: CustomWidgets.newformfield(
                onSaved: (val) =>
                    model = model.copyWith(position: d.Value(val!)),
                controller: _positioncontroller,
                error: error,
                name: "Name"),
            title: "Position",
          ),
          const SizedBox(
            height: 10,
          ),
          CustomWidgets.box(
            title: "Job Type",
            widget: DropdownButtonFormField(
                decoration: CustomWidgets.decoration(),
                elevation: 0,
                hint: const Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
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
                    model = model.copyWith(type: d.Value(value.toString()))),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomWidgets.box(
            title: "Select Gender:",
            widget: DropdownButtonFormField(
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
                onChanged: (value) async =>
                    model = model.copyWith(gender: d.Value(value.toString()))),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomWidgets.box(
              title: "Posted Date",
              widget: TextFormField(
                  onTap: () async => model = model.copyWith(
                        postedDate: d.Value(await DatePick.date(
                            context, _datePostController, model, postedDate)),
                      ),
                  readOnly: true,
                  controller: _datePostController,
                  validator: RequiredValidator(
                      errorText: "Please Select Correct Date"),
                  decoration: CustomWidgets.dateDacarotion(
                    widget.isEdit
                        ? model.postedDate.value
                        : "${postedDate.day}/${postedDate.month}/${postedDate.year}",
                  ))),
          const SizedBox(
            height: 10,
          ),
          CustomWidgets.box(
              title: "Last Date To Apply",
              widget: TextFormField(
                  onTap: () async => model = model.copyWith(
                        lastDateApply: d.Value(await DatePick.date(
                            context, _dateLastController, model, lastdate)),
                      ),
                  readOnly: true,
                  controller: _dateLastController,
                  validator: RequiredValidator(
                      errorText: "Please Select Correct Date"),
                  decoration: CustomWidgets.dateDacarotion(widget.isEdit
                      ? model.lastDateApply.value
                      : "${lastdate.day}/${lastdate.month}/${lastdate.year}"))),
          const SizedBox(
            height: 10,
          ),
          CustomWidgets.box(
              title: "Close Date",
              widget: TextFormField(
                  onTap: () async => model = model.copyWith(
                        closeDate: d.Value(await DatePick.date(
                            context, _dateCloseController, model, closedate)),
                      ),
                  readOnly: true,
                  controller: _dateCloseController,
                  validator: RequiredValidator(
                      errorText: "Please Select Correct Date"),
                  decoration: CustomWidgets.dateDacarotion(
                    widget.isEdit
                        ? model.closeDate.value
                        : "${closedate.day}/${closedate.month}/${closedate.year}",
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
                CustomWidgets.radioButton(Status.Active, onChanged: ((val) {
                  setState(() {
                    _status = Status.Active;
                  });

                  model = model.copyWith(status: d.Value(_status.name));
                }), groupValue: _status),
                sizebox5,
                Text("Active",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[700])),
                sizebox5,
                CustomWidgets.radioButton(Status.InActive, onChanged: ((val) {
                  setState(() {
                    _status = Status.InActive;
                  });

                  model = model.copyWith(status: d.Value(_status.name));
                }), groupValue: _status),
                sizebox5,
                Text(
                  "In Active",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          const SizedBox(
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
              const SizedBox(
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
              height: size.height * 0.12,
              width: size.width * 0.9,
              child: Row(
                children: [
                  Expanded(
                      child: CustomWidgets.box(
                          title: "Company Name",
                          widget: CustomWidgets.newformfield(
                              onSaved: (val) => model=model.copyWith(
                                  name: d.Value(_namecontroller.text)),
                              controller: _namecontroller,
                              error: error,
                              name: "Name"))),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Expanded(
                    child: CustomWidgets.box(
                      widget: CustomWidgets.newformfield(
                          onSaved: (val) => model = model.copyWith(
                              position: d.Value(_positioncontroller.text)),
                          controller: _positioncontroller,
                          error: error,
                          name: "Name"),
                      title: "Position",
                    ),
                  )
                ],
              )),
          SizedBox(
              height: size.height * 0.12,
              width: size.width * 0.9,
              child: Row(
                children: [
                  Expanded(
                      child: CustomWidgets.box(
                    title: "Job Type",
                    widget: DropdownButtonFormField(
                        decoration: CustomWidgets.decoration(),
                        elevation: 0,
                        hint: const Padding(
                          padding: EdgeInsets.only(
                            left: 5,
                          ),
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
                        onChanged: (value) => model =
                            model.copyWith(type: d.Value(value.toString()))),
                  )),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Expanded(
                      child: CustomWidgets.box(
                    title: "Select Gender:",
                    widget: DropdownButtonFormField(
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
                        onChanged: (value) async {
                        model =  model.copyWith(gender: d.Value(value.toString()));
                        }),
                  ))
                ],
              )),
          SizedBox(
              height: size.height * 0.12,
              width: size.width * 0.9,
              child: Row(
                children: [
                  Expanded(
                      child: CustomWidgets.box(
                          title: "Posted Date",
                          widget: TextFormField(
                              onTap: () async => model= model.copyWith(
                                      postedDate: d.Value(
                                    await DatePick.date(context,
                                        _datePostController, model, postedDate),
                                  )),
                              readOnly: true,
                              controller: _datePostController,
                              validator: RequiredValidator(
                                  errorText: "Please Select Correct Date"),
                              decoration: CustomWidgets.dateDacarotion(
                                widget.isEdit
                                    ? model.postedDate.value
                                    : "${postedDate.day}/${postedDate.month}/${postedDate.year}",
                              )))),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Expanded(
                      child: CustomWidgets.box(
                          title: "Last Date To Apply",
                          widget: TextFormField(
                              onTap: () async => model = model.copyWith(
                                  lastDateApply: d.Value(await DatePick.date(
                                      context,
                                      _dateLastController,
                                      model,
                                      lastdate))),
                              readOnly: true,
                              controller: _dateLastController,
                              validator: RequiredValidator(
                                  errorText: "Please Select Correct Date"),
                              decoration: CustomWidgets.dateDacarotion(widget
                                      .isEdit
                                  ? model.lastDateApply.value
                                  : "${lastdate.day}/${lastdate.month}/${lastdate.year}"))))
                ],
              )),
          SizedBox(
              height: size.height * 0.12,
              width: size.width * 0.9,
              child: Row(
                children: [
                  Expanded(
                      child: CustomWidgets.box(
                          title: "Close Date",
                          widget: TextFormField(
                              onTap: () async => model = model.copyWith(
                                      closeDate: d.Value(
                                    await DatePick.date(context,
                                        _dateCloseController, model, closedate),
                                  )),
                              readOnly: true,
                              controller: _dateCloseController,
                              validator: RequiredValidator(
                                  errorText: "Please Select Correct Date"),
                              decoration: CustomWidgets.dateDacarotion(
                                widget.isEdit
                                    ? model.closeDate.value
                                    : "${closedate.day}/${closedate.month}/${closedate.year}",
                              )))),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Expanded(
                    child: Container(),
                  )
                ],
              )),
          sizebox5,
          SizedBox(
              height: size.height * 0.12,
              width: size.width * 0.9,
              child: CustomWidgets.box(
                title: "Description",
                widget: CustomWidgets.newformfield(
                    name: "Description",
                    controller: _descriptionController,
                    error: "Enter Detail"),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Status:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700])),
              sizebox5,
              CustomWidgets.radioButton(Status.Active, onChanged: ((val) {
                setState(() {
                  _status = Status.Active;
                });

              model =  model.copyWith(status: d.Value(_status.name));
              }), groupValue: _status),
              sizebox5,
              Text("Active",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700])),
              sizebox5,
              CustomWidgets.radioButton(Status.InActive, onChanged: ((val) {
                setState(() {
                  _status = Status.InActive;
                });
               model= model.copyWith(status: d.Value(_status.name));
              }), groupValue: _status),
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
                const SizedBox(
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
}
