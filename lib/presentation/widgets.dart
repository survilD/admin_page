import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/enum.dart';
import 'responsive.dart';
import '../data/constants.dart';
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

  static customAppBar(GlobalKey<ScaffoldState> _drawer, BuildContext context,
      Size size, bool isFirst) {
    return PreferredSize(
      preferredSize: Size.fromHeight(size.height * 0.1),
      child: AppBar(
        title: Responsive.isMobile(context)
            ? GestureDetector(
                onTap: () => _drawer.currentState!.openDrawer(),
                child: Image.asset(
                  "assets/Image/drawer.png",
                  height: 25,
                ),
              )
            : Row(
                children: [
                  FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      isFirst ? "Job List" : "New Job",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  iconButtonC(Icons.add, size.width * 0.6, kGreen),
                ],
              ),
        leadingWidth: size.width * 0.14,
        leading: Padding(
          padding: Responsive.isMobile(context)
              ? const EdgeInsets.all(10)
              : const EdgeInsets.all(4.0),
          child: imageLogo,
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
          const CircleAvatar(radius: 18, backgroundImage: profile),
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

  static constDrawer(
    Size size,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: SizedBox(
        width: size.width * 0.65,
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
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage: profile,
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
                      physics: const NeverScrollableScrollPhysics(),
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
                          minLeadingWidth:
                              Responsive.isMobile(context) ? 25 : 50,
                        );
                      },
                      itemCount: drawer.length,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  static Widget iconButtonC(
    IconData icons,
    double width,
    Color? kGreen,
  ) =>
      GestureDetector(
        child: CircleAvatar(
          radius: width * 0.04,
          backgroundColor: kGreen,
          child: Icon(
            icons,
            size: 20,
            color: Colors.white,
          ),
        ),
      );

  static flotButton(bool isFirst) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
            visible: isFirst,
            child: FloatingActionButton.small(
              heroTag: null,
              backgroundColor: kPrimaryColor.withAlpha(202),
              onPressed: () {},
              child: const Icon(Icons.next_plan_sharp),
            )),
        sizebox5,
        FloatingActionButton.small(
          heroTag: null,
          backgroundColor: const Color.fromRGBO(28, 202, 210, 1),
          onPressed: () {},
          child: const Icon(Icons.headset_mic_outlined),
        ),
        sizebox5,
        FloatingActionButton.small(
          heroTag: null,
          backgroundColor: const Color.fromRGBO(144, 194, 94, 1),
          onPressed: () {},
          child: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }

  static addButton({
    required void Function()? onPressed,
  }) =>
      CupertinoButton(
        child: const FittedBox(
          child: Text(
            '+ Add New Job',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
        onPressed: onPressed,
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
        padding: const EdgeInsets.all(10),
      );

  static PreferredSize webAppBar(Size size, bool isFirst) => PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.14),
        child: Container(
            color: Colors.white,
            height: size.height,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: CircleAvatar(
                            radius: size.width * 0.02,
                            backgroundColor: kPrimaryColor,
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jobick",
                                style: TextStyle(
                                    fontSize: size.width * 0.019,
                                    fontWeight: FontWeight.bold),
                              ),
                              FittedBox(
                                child: Text(
                                  "Job Admin Dashboard",
                                  style: TextStyle(
                                      fontSize: size.width * 0.01,
                                      color: kGrey),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        "assets/Image/drawer.png",
                        height: 40,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      isFirst ? webtitel : webtitel2,
                      SizedBox(
                        width: size.width * 0.07,
                      ),
                      FittedBox(
                        child: SizedBox(
                          width: size.width * 0.18,
                          child: TextField(
                            cursorHeight: 20,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.search,
                                size: 35,
                                color: Colors.black,
                              ),
                              hintStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                              filled: true,
                              fillColor: kGrey.withAlpha(30),
                              contentPadding: const EdgeInsets.all(15),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: kGrey.withAlpha(30))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: kGrey.withAlpha(30))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomWidgets.iconButtonC(
                          Icons.add, size.width * 0.5, kGreen),
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
                                radius: size.width * 0.03,
                                backgroundImage: profile,
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
      );

  static Widget webDrower(Size size, BuildContext context) => Scrollbar(
        controller: verticalcontroller,
        thickness: 2,
        child: SingleChildScrollView(
          controller: verticalcontroller,
          child: Container(
            color: Colors.white,
            width: Responsive.isDesktop(context) ? null : size.width * 0.02,
            height: Responsive.isDesktop(context) ? size.height : null,
            child: Padding(
              padding: Responsive.isDesktop(context)
                  ? const EdgeInsets.only(left: 10)
                  : const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  SizedBox(
                    height: Responsive.isDesktop(context)
                        ? size.height * 0.12
                        : null,
                    child: FittedBox(
                      child: !Responsive.isDesktop(context)
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: CircleAvatar(
                                radius: size.width * 0.045,
                                backgroundImage: profile,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: profile,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, left: 5, bottom: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Welcome  ",
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
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
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey[800],
                                  size: 30,
                                )
                              ],
                            ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: drawer.length,
                    itemBuilder: (context, index) {
                      return Responsive.isTablet(context)
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Icon(
                                icon[index],
                                size: size.width * 0.04,
                                color: Colors.grey[500],
                              ),
                            )
                          : FittedBox(
                              child: Row(
                                children: [
                                  Icon(
                                    icon[index],
                                    color: Colors.grey[500],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.08,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "${drawer[index]}",
                                        style: TextStyle(
                                          fontSize: size.width * 0.01,
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 40,
                                    color: Colors.grey[400],
                                  ),
                                ],
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  static Widget pageHeading(Size size, bool isFirst, BuildContext context,
          {void Function()? onPressed}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isFirst ? titel : titel2,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                isFirst
                    ? SizedBox(
                        width: Responsive.isDesktop(context)
                            ? size.width * 0.1
                            : Responsive.isMobile(context)
                                ? size.width * 0.3
                                : size.width * 0.14,
                        child: CustomWidgets.addButton(onPressed: onPressed))
                    : sizebox5,
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    child: CustomWidgets.iconButtonC(
                        Icons.mail,
                        Responsive.isDesktop(context)
                            ? size.width * 0.4
                            : Responsive.isMobile(context)
                                ? size.width * 1
                                : size.width * 0.6,
                        kGreen)),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    child: CustomWidgets.iconButtonC(
                        Icons.call,
                        Responsive.isDesktop(context)
                            ? size.width * 0.4
                            : Responsive.isMobile(context)
                                ? size.width * 1
                                : size.width * 0.6,
                        kGreen)),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    child: CustomWidgets.iconButtonC(
                        Icons.info,
                        Responsive.isDesktop(context)
                            ? size.width * 0.4
                            : Responsive.isMobile(context)
                                ? size.width * 1
                                : size.width * 0.6,
                        isFirst ? kGreen : kPrimaryColor))
              ],
            ),
          )
        ],
      );

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
