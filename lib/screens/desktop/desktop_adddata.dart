// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_training_1/dbhelper/database/boxes.dart';
import 'package:flutter_training_1/dbhelper/database/hive.dart';

import 'package:flutter_training_1/screens/utils/constants.dart';
import 'package:flutter_training_1/screens/utils/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
  ScrollController verticalcontroller =
      ScrollController(initialScrollOffset: 5);

  // ScrollController scrollControllertabel = ScrollController(initialScrollOffset: 5);

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  DateTime? postedDate = DateTime(2022, 01, 24);
  DateTime? lastdate = DateTime(2022, 01, 24);
  DateTime? closedate = DateTime(2022, 01, 24);

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
  void initState() {
    super.initState();

    if (widget.isEdit) {
      model = widget.model;
      _namecontroller.text = model.name.toString();
      _positioncontroller.text = model.position.toString();
      categoryDropdownValue = model.type;
      genderDropdownValue = model.gender;
      postedDate = model.postedDate;
      lastdate = model.lastDateApply;
      closedate = model.closeDate;
      _status = (model.active!) ? Status.Active : Status.InActive;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    model = widget.model;
    return SafeArea(
        child: Scaffold(
      appBar: CustomWidgets.webAppBar(size),
      floatingActionButton: CustomWidgets.flotButton(false),
      body: Row(
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
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _key,
                        child: Card(
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: otherBody(
                                model,
                                size,
                                onPressed:()=> (widget.isEdit)
                                    ? _edit(model)
                                    : _new(model),
                              )

                              // Column(
                              //   children: [
                              //     SizedBox(
                              //         height: size.height * 0.13,
                              //         width: size.width * 0.9,
                              //         child: Row(
                              //           children: [
                              //             Expanded(
                              //                 child: box(
                              //                     // onSaved:

                              //                     //  ((newValue) =>
                              //                     //     model.name),
                              //                     controller: _namecontroller,
                              //                     error: "Please Enter Name",
                              //                     title: "Company Name",
                              //                     width: size.width)),
                              //             SizedBox(
                              //               width: size.width * 0.02,
                              //             ),
                              //             Expanded(
                              //               child: box(
                              //                   error:
                              //                       "This Field Should Not Empty",
                              //                   controller: _positioncontroller,
                              //                   title: "Position",
                              //                   width: size.width),
                              //             )
                              //           ],
                              //         )),
                              //     SizedBox(
                              //         height: size.height * 0.13,
                              //         width: size.width * 0.9,
                              //         child: Row(
                              //           children: [
                              //             Expanded(
                              //                 child: Column(
                              //               children: [
                              //                 header("Job Type"),
                              //                 sizebox5,
                              //                 Padding(
                              //                     padding: const EdgeInsets.only(
                              //                         top: 5),
                              //                     child:
                              //                         CustomWidgets.dropDownForm(
                              //                       context: context,
                              //                       child: Padding(
                              //                         padding:
                              //                             const EdgeInsets.only(
                              //                                 right: 20),
                              //                         child: DropdownButton(
                              //                             isExpanded: true,
                              //                             underline: SizedBox(),
                              //                             elevation: 0,
                              //                             iconSize: 0,
                              //                             value:
                              //                                 categoryDropdownValue,
                              //                             items: categoryItem.map<
                              //                                 DropdownMenuItem<
                              //                                     String>>(
                              //                               (value) {
                              //                                 return DropdownMenuItem<
                              //                                     String>(
                              //                                   child: Padding(
                              //                                     padding:
                              //                                         const EdgeInsets
                              //                                                 .all(
                              //                                             10.0),
                              //                                     child:
                              //                                         Text(value),
                              //                                   ),
                              //                                   value: value,
                              //                                 );
                              //                               },
                              //                             ).toList(),
                              //                             onChanged: (value) =>
                              //                                 onchagecategory(value
                              //                                     .toString())),
                              //                       ),
                              //                     )),
                              //               ],
                              //             )),
                              //             SizedBox(
                              //               width: size.width * 0.02,
                              //             ),
                              //             Expanded(
                              //                 child: Column(
                              //               children: [
                              //                 header("Select Gender:"),
                              //                 sizebox5,
                              //                 Padding(
                              //                     padding: const EdgeInsets.only(
                              //                         top: 5),
                              //                     child:
                              //                         CustomWidgets.dropDownForm(
                              //                       context: context,
                              //                       child: Padding(
                              //                         padding:
                              //                             const EdgeInsets.only(
                              //                                 right: 20),
                              //                         child: DropdownButton(
                              //                             isExpanded: true,
                              //                             underline: Container(),
                              //                             elevation: 0,
                              //                             iconSize: 0,
                              //                             value:
                              //                                 genderDropdownValue,
                              //                             items: genderItem.map<
                              //                                 DropdownMenuItem<
                              //                                     String>>(
                              //                               (value) {
                              //                                 return DropdownMenuItem<
                              //                                     String>(
                              //                                   child: Padding(
                              //                                     padding:
                              //                                         const EdgeInsets
                              //                                                 .all(
                              //                                             10.0),
                              //                                     child:
                              //                                         Text(value),
                              //                                   ),
                              //                                   value: value,
                              //                                 );
                              //                               },
                              //                             ).toList(),
                              //                             onChanged: (value) =>
                              //                                 setState(() {
                              //                                   genderDropdownValue =
                              //                                       value
                              //                                           .toString();
                              //                                 })),
                              //                       ),
                              //                     )),
                              //               ],
                              //             ))
                              //           ],
                              //         )),
                              //     SizedBox(
                              //         height: size.height * 0.13,
                              //         width: size.width * 0.9,
                              //         child: Row(
                              //           children: [
                              //             Expanded(
                              //                 child: Column(
                              //               children: [
                              //                 header("Posted Date"),
                              //                 Padding(
                              //                     padding: const EdgeInsets.only(
                              //                         top: 5),
                              //                     child: CustomWidgets.datepiker(
                              //                         context: context,
                              //                         onPressed: () async {
                              //                           final date =
                              //                               await pickDate(
                              //                                   postedDate!);

                              //                           if (date == null) {
                              //                             return;
                              //                           } else {
                              //                             setState(() {
                              //                               postedDate = date;
                              //                             });
                              //                           }
                              //                         },
                              //                         dateTime: widget.isEdit
                              //                             ? widget
                              //                                 .model.postedDate
                              //                             : postedDate)),
                              //               ],
                              //             )),
                              //             SizedBox(
                              //               width: size.width * 0.02,
                              //             ),
                              //             Expanded(
                              //                 child: Column(
                              //               children: [
                              //                 header("Last Date To Apply"),
                              //                 Padding(
                              //                     padding: const EdgeInsets.only(
                              //                         top: 5),
                              //                     child: CustomWidgets.datepiker(
                              //                       context: context,
                              //                       dateTime: lastdate,
                              //                       onPressed: () async {
                              //                         final date = await pickDate(
                              //                             lastdate!);

                              //                         if (date == null) {
                              //                           return;
                              //                         } else {
                              //                           setState(() {
                              //                             lastdate = date;
                              //                           });
                              //                         }
                              //                       },
                              //                     )),
                              //               ],
                              //             ))
                              //           ],
                              //         )),
                              //     SizedBox(
                              //         height: size.height * 0.13,
                              //         width: size.width * 0.9,
                              //         child: Row(
                              //           children: [
                              //             Expanded(
                              //                 child: Column(
                              //               children: [
                              //                 header("Close Date"),
                              //                 Padding(
                              //                     padding: const EdgeInsets.only(
                              //                         top: 5),
                              //                     child: CustomWidgets.datepiker(
                              //                       context: context,
                              //                       dateTime: closedate,
                              //                       onPressed: () async {
                              //                         final date = await pickDate(
                              //                             closedate!);

                              //                         if (date == null) {
                              //                           return;
                              //                         } else {
                              //                           setState(() {
                              //                             closedate = date;
                              //                           });
                              //                         }
                              //                       },
                              //                     ))
                              //               ],
                              //             )),
                              //             SizedBox(
                              //               width: size.width * 0.02,
                              //             ),
                              //             Expanded(
                              //                 child: Column(
                              //               children: [
                              //                 header("Posted Date"),
                              //                 Padding(
                              //                     padding: const EdgeInsets.only(
                              //                         top: 5),
                              //                     child: CustomWidgets.datepiker(
                              //                         context: context,
                              //                         onPressed: () async {
                              //                           final date =
                              //                               await pickDate(
                              //                                   postedDate!);

                              //                           if (date == null) {
                              //                             return;
                              //                           } else {
                              //                             setState(() {
                              //                               postedDate = date;
                              //                             });
                              //                           }
                              //                         },
                              //                         dateTime: postedDate)),
                              //               ],
                              //             ))
                              //           ],
                              //         )),
                              //     sizebox5,
                              //     SizedBox(
                              //         height: size.height * 0.13,
                              //         width: size.width * size.width,
                              //         child: Column(
                              //           children: [
                              //             header("Description:"),
                              //             SizedBox(
                              //               child: CustomWidgets.newformfield(
                              //                   name: "Description",
                              //                   controller: _namecontroller,
                              //                   error: "Enter Detail"),
                              //             )
                              //           ],
                              //         )),
                              //     Row(
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       children: [
                              //         Text("Status:",
                              //             style: TextStyle(
                              //                 fontWeight: FontWeight.bold,
                              //                 color: Colors.grey[700])),
                              //         sizebox5,
                              //         radioButton(Status.Active),
                              //         sizebox5,
                              //         Text("Active",
                              //             style: TextStyle(
                              //                 fontWeight: FontWeight.bold,
                              //                 color: Colors.grey[700])),
                              //         sizebox5,
                              //         radioButton(Status.InActive),
                              //         sizebox5,
                              //         Text(
                              //           "In Active",
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.bold,
                              //               color: Colors.grey[700]),
                              //         ),
                              //       ],
                              //     ),
                              //     SizedBox(
                              //       height: size.height * 0.13,
                              //       width: size.width * 0.9,
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.end,
                              //         children: [
                              //           SizedBox(
                              //             width: 80,
                              //             child: CupertinoButton(
                              //               child: const Text(
                              //                 ' Close ',
                              //                 style: TextStyle(
                              //                     fontSize: 15,
                              //                     fontWeight: FontWeight.w600),
                              //               ),
                              //               onPressed: () {
                              //                 Navigator.pop(context);
                              //               },
                              //               color: kPrimaryColor,
                              //               borderRadius:
                              //                   BorderRadius.circular(20),
                              //               padding: const EdgeInsets.all(10),
                              //             ),
                              //           ),
                              //           SizedBox(
                              //             width: 10,
                              //           ),
                              //           SizedBox(
                              //             width: 80,
                              //             child: CupertinoButton(
                              //               child: const Text(
                              //                 ' Submit ',
                              //                 style: TextStyle(
                              //                     fontSize: 15,
                              //                     fontWeight: FontWeight.w600),
                              //               ),
                              //               onPressed: () => (widget.isEdit)
                              //                   ? _edit(model)
                              //                   : _new(model),

                              //               // async {
                              //               //   if (_key.currentState!.validate()) {
                              //               //     final model = Model()
                              //               //       ..name = _namecontroller.text
                              //               //       ..position =
                              //               //           _positioncontroller.text
                              //               //       ..type = categoryDropdownValue
                              //               //           .toString()
                              //               //       ..gender = genderDropdownValue
                              //               //           .toString()
                              //               //       ..postedDate = postedDate
                              //               //       ..lastDateApply = lastdate
                              //               //       ..closeDate = closedate
                              //               //       ..active =
                              //               // (_status == Status.Active)
                              //               //     ? true
                              //               //     : false;

                              //               // final box = Boxes.getModel();
                              //               // await box.add(model);
                              //               //     Navigator.pop(context);
                              //               //   }

                              //               //   // mdlDta.insert(modelCompanion)
                              //               // },
                              //               color: kGreen,
                              //               borderRadius:
                              //                   BorderRadius.circular(20),
                              //               padding: const EdgeInsets.all(10),
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     )
                              //   ],
                              // ),
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

  void _edit(Model model) async {
    _key.currentState!.save();

    model.name = _namecontroller.text;
    model.position = _positioncontroller.text;
    model.type = categoryDropdownValue;
    model.gender = genderDropdownValue;
    model.postedDate = postedDate;
    model.closeDate = closedate;
    model.lastDateApply = lastdate;
    model.active = (_status == Status.Active) ? true : false;

    model.save();

    _key.currentState!.reset();
    Navigator.of(context).pop();
  }

  void _new(Model model) async {
    if (_key.currentState!.validate()) {
      model.name = _namecontroller.text;
      model.position = _positioncontroller.text;
      model.type = categoryDropdownValue;
      model.gender = genderDropdownValue;
      model.postedDate = postedDate;
      model.closeDate = closedate;
      model.lastDateApply = lastdate;
      model.active = (_status == Status.Active) ? true : false;

      final box = Boxes.getModel();
      await box.add(model);
      _key.currentState!.reset();
      Navigator.of(context).pop();
    }
  }

  otherBody(Model model, Size size, {void Function()? onPressed}) => Column(
        children: [
          SizedBox(
            height: size.height * 0.13,
                      width: size.width * 0.9,
              child: Row(
                children: [
                  Expanded(
                      child: box(
                    controller: _namecontroller,
                    error: "This Field Should Not Empty",
                    title: "Company Name",
                    width: size.width,
                    onSaved: (val)=> 
                 
                        model.name = _namecontroller.text
                    
                    ,
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
                        setState(() {
                          model.position = _positioncontroller.text;
                        });
                      },
                    ),
                  )
                ],
              )),
          SizedBox(
             height: size.height * 0.13,
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
                              padding: const EdgeInsets.only(left: 5,),
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
                                model.type = value.toString()),
                      ),
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
                                model.gender = value.toString()),
                      ),
                    ],
                  ))
                ],
              )),
          SizedBox(
               height: size.height * 0.13,
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
                                final date = await pickDate(postedDate!);

                                if (date == null) {
                                  return;
                                } else {
                                  setState(() {
                                    if (date.compareTo(postedDate!) > 0) {
                                      postedDate = date;
                                      _datePostController.text =
                                          " ${postedDate!.day}/${postedDate!.month}/${postedDate!.year}";
                                      model.postedDate = postedDate!;
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
                                widget.isEdit
                                    ? "${model.postedDate}"
                                    : "  ${postedDate!.day}/${postedDate!.month}/${postedDate!.year}",
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
                                final date = await pickDate(lastdate!);

                                if (date == null) {
                                  return;
                                } else {
                                  setState(() {
                                    if (date.compareTo(postedDate!) > 0) {
                                      lastdate = date;
                                      _dateLastController.text =
                                          " ${lastdate!.day}/${lastdate!.month}/${lastdate!.year}";
                                      model.lastDateApply = lastdate;
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
                                      .isEdit
                                  ? "${model.lastDateApply}"
                                  : "  ${lastdate!.day}/${lastdate!.month}/${lastdate!.year}"))),
                    ],
                  ))
                ],
              )),
          SizedBox(
             height: size.height * 0.13,
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
                                final date = await pickDate(closedate!);

                                if (date == null) {
                                  return;
                                } else {
                                  setState(() {
                                    if (date.compareTo(lastdate!) > 0) {
                                      closedate = date;
                                      _dateCloseController.text =
                                          " ${closedate!.day}/${closedate!.month}/${closedate!.year}";
                                      model.closeDate = closedate;
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
                                widget.isEdit
                                    ? "${model.closeDate}"
                                    : "  ${closedate!.day}/${closedate!.month}/${closedate!.year}",
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
              height: size.height * 0.13,
              width: size.width * 0.9,

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
        sizebox5,
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
}
