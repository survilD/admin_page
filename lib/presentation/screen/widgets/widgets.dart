
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../data/constants.dart';
import '../../../domain/enum.dart';

class CustomWidgets {
 
  static loginForm({
    TextEditingController? controller,
    String? titel,
    String? error,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextFormField(
        validator: RequiredValidator(errorText: error!),
        cursorHeight: 20,
        controller: controller,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            hintStyle: const TextStyle(
                fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
            filled: true,
            fillColor: kGrey.withAlpha(30),
            contentPadding: const EdgeInsets.all(15),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: kGrey.withAlpha(30))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: kGrey.withAlpha(30))),
            hintText: titel,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: kGrey.withAlpha(30))),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red, width: 1))),
      ),
    );
  }

  static newformfield({
    String? error,
    TextEditingController? controller,
    String? name,
    FormFieldSetter<String>? onSaved,
  }) {
    return TextFormField(
        onChanged: onSaved,
        validator: RequiredValidator(errorText: error!),
        controller: controller,
        cursorColor: kGrey.withAlpha(30),
        decoration: decoration(name: name));
  }

  static decoration({String? name}) {
    return InputDecoration(
      filled: true,
      fillColor: kGrey.withAlpha(30),
      contentPadding: const EdgeInsets.only(left: 10, right: 20),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kGrey.withAlpha(30))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kGrey.withAlpha(30))),
      hintText: name,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kGrey.withAlpha(30))),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red, width: 1)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.red,
          )),
    );
  }

  static dateDacarotion(String? hint) {
    return InputDecoration(
      filled: true,
      fillColor: kGrey.withAlpha(30),
      contentPadding: const EdgeInsets.all(5),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kGrey.withAlpha(30))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kGrey.withAlpha(30))),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kGrey.withAlpha(30))),
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
      hintText: hint,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: 60,
          height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            color: Colors.grey,
          ),
          child: const Icon(
            Icons.watch_later_outlined,
            color: kGrey,
            size: 25,
          ),
        ),
      ),
    );
  }

  static dropDownForm({BuildContext? context, Widget? child}) {
    return Container(
        decoration: BoxDecoration(
          color: kGrey.withAlpha(30),
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 50,
        width: MediaQuery.of(context!).size.width * 70,
        child: child);
  }

  static datepiker(
      {required VoidCallback? onPressed,
      DateTime? dateTime,
      BuildContext? context}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: kGrey.withAlpha(30),
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 50,
        width: MediaQuery.of(context!).size.width * 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: Colors.grey,
              ),
              child: const Icon(
                Icons.watch_later_outlined,
                color: kGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "${dateTime!.day}/${dateTime.month}/${dateTime.year}",
              ),
            ),
          ],
        ),
      ),
    );
  }

  

  static Widget box({String? title, Widget? widget}) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              sizebox5,
              Text(
                title!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              sizebox5,
              const Text(
                "*",
                style: TextStyle(color: kPrimaryColor, fontSize: 20),
              )
            ],
          ),
          sizebox5,
          widget!,
        ],
      );

  static Widget radioButton(Status _value,
          {required Object? groupValue,
          required void Function(Object?)? onChanged}) =>
      Radio(
        visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        value: _value,
        groupValue: groupValue,
        onChanged: onChanged,
      );
}
