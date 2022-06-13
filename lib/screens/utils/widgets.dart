import 'package:flutter/material.dart';
import 'package:flutter_training_1/screens/utils/constants.dart';
import 'package:form_field_validator/form_field_validator.dart';

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

  static newformfield(
      {String? error, TextEditingController? controller, String? name}) {
    return TextFormField(
      validator: RequiredValidator(errorText: error!),
      controller: controller,
      cursorColor: kGrey.withAlpha(30),
      decoration: InputDecoration(
          filled: true,
          fillColor: kGrey.withAlpha(30),
          contentPadding: const EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: kGrey.withAlpha(30))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: kGrey.withAlpha(30))),
          hintText: name ?? "Name",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: kGrey.withAlpha(30))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.red, width: 1))),
    );
  }

  static customAppBar(GlobalKey<ScaffoldState> _drawer) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70.0),
      child: AppBar(
        title: GestureDetector(
          onTap: () => _drawer.currentState!.openDrawer(),
          child: Image.asset(
            "assets/Image/drawer.png",
            height: 25,
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.all(12.0),
          child: CircleAvatar(
            backgroundColor: kPrimaryColor,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ),
        actionsIconTheme: const IconThemeData(
          size: 28,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          const CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
                "https://miro.medium.com/max/554/1*Ld1KM2WSfJ9YQ4oeRf7q4Q.jpeg"),
          ),
          const SizedBox(
            width: 15,
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
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
}
