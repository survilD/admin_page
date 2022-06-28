// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




import 'package:flutter_training_1/screens/utils/constants.dart';

import 'package:flutter_training_1/screens/utils/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../logicpart/logictable.dart';
import '../../model/hive.dart';

import '../utils/enum.dart';

// ignore: must_be_immutable
class DesktopDataAdd extends StatefulWidget {
  final bool isEdit;
  Model model;
  DesktopDataAdd({
    Key? key,
    required this.isEdit,
    required this.model,
  }) : super(key: key);

  @override
  State<DesktopDataAdd> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<DesktopDataAdd> {
  Model model = Model();
  Status _status = Status.Active;

  final TextEditingController _positioncontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _datePostController = TextEditingController();
  final TextEditingController _dateLastController = TextEditingController();
  final TextEditingController _dateCloseController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.isEdit) {
      model = widget.model;
      _namecontroller.text = model.name.toString();
      _positioncontroller.text = model.position.toString();
      categoryDropdownValue = model.type;
      genderDropdownValue = model.gender;

      _status = (model.active!) ? Status.Active : Status.InActive;
    } else {
      model.active = true;
    }
  }

 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: CustomWidgets.webAppBar(size,false),
      floatingActionButton: CustomWidgets.flotButton(false),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: CustomWidgets.webDrower(size)),
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
                        child: CustomWidgets.webBar(size, false)),
                    Form(
                      key: _key,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: body(
                              model,
                              size,
                              onPressed: () =>
                                  (widget.isEdit) ? ButtonResponce.onEdit(model,_key,context) : ButtonResponce.newEntries(model, _key, context)
                            )),
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

  body(Model model, Size size, {void Function()? onPressed}) => Column(
        children: [
          SizedBox(
              height: size.height * 0.12,
              width: size.width * 0.9,
              child: Row(
                children: [
                  Expanded(
                      child: CustomWidgets. box(
                          title: "Company Name",
                          widget: CustomWidgets.newformfield(
                              onSaved: (val) =>
                                  model.name = _namecontroller.text,
                              controller: _namecontroller,
                              error: error,
                              name: "Name"))),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Expanded(
                    child: CustomWidgets.box(
                      widget: CustomWidgets.newformfield(
                          onSaved: (val) =>
                              model.position = _positioncontroller.text,
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
                          padding:  EdgeInsets.only(
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
                        onChanged: (value) => model.type = value.toString()),
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
                          padding:  EdgeInsets.only(left: 5),
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
                          model.gender = value.toString();
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
                              onTap: () async => model.postedDate =
                                  await DatePick.date(context,
                                      _datePostController, model, postedDate),
                              readOnly: true,
                              controller: _datePostController,
                              validator: RequiredValidator(
                                  errorText: "Please Select Correct Date"),
                              decoration: CustomWidgets.dateDacarotion(
                                widget.isEdit
                                    ? model.postedDate
                                    : "${postedDate.day}/${postedDate.month}/${postedDate.year}",
                              )))),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Expanded(
                      child: CustomWidgets.box(
                          title: "Last Date To Apply",
                          widget: TextFormField(
                              onTap: () async => model.lastDateApply =
                                  await DatePick.date(context,
                                      _dateLastController, model, lastdate),

                              readOnly: true,
                              controller: _dateLastController,
                              validator: RequiredValidator(
                                  errorText: "Please Select Correct Date"),
                              decoration: CustomWidgets.dateDacarotion(widget
                                      .isEdit
                                  ? model.lastDateApply
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
                              onTap: () async => model.closeDate =
                                  await DatePick.date(context,
                                      _dateCloseController, model, closedate),
                              readOnly: true,
                              controller: _dateCloseController,
                              validator: RequiredValidator(
                                  errorText: "Please Select Correct Date"),
                              decoration: CustomWidgets.dateDacarotion(
                                widget.isEdit
                                    ? model.closeDate
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
            height: size.height * 0.1,
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
          model.active = (_status == Status.Active) ? true : false;
        }),
      );
}
