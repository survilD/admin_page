import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_1/responsive.dart';
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
      contentPadding: const EdgeInsets.all(10),
   
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
      prefixIcon: Container(
        width: 60,
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          color: Colors.grey,
        ),
        child: Icon(
          Icons.watch_later_outlined,
          color: kGrey,
          size: 25,
        ),
      ),
    );
  }

  static customAppBar(GlobalKey<ScaffoldState> _drawer, BuildContext context,
      Size size, bool isFirst) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70.0),
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
                      !isFirst ? "New Job" : "Job List",
                      style: TextStyle(
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
              ? EdgeInsets.all(10)
              : EdgeInsets.all(4.0),
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

  static flotbutton(
      {Color? color, IconData? icons, required void Function()? onPressed}) {
    return FloatingActionButton.small(
      heroTag: null,
      backgroundColor: color,
      onPressed: onPressed,
      child: Icon(icons),
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
                      padding: EdgeInsets.all(10.0),
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
          child: CustomWidgets.flotbutton(
              onPressed: () {},
              color: kPrimaryColor.withAlpha(202),
              icons: Icons.next_plan_sharp),
        ),
        sizebox5,
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
    );
  }

  static addButton({
    required void Function()? onPressed,
  }) =>
      CupertinoButton(
        child: const FittedBox(
          child: const Text(
            '+ Add New Job',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
        onPressed: onPressed,
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
        padding: const EdgeInsets.all(10),
      );

  static PreferredSize webAppBar(Size size) => PreferredSize(
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
                      webtitel1,
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

  static Widget webDrower(Size size) => Scrollbar(
        thickness: 2,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            color: Colors.white,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.12,
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage: profile,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                  SizedBox(
                    width: size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: drawer.length,
                      itemBuilder: (context, index) {
                        return FittedBox(
                          child: GestureDetector(
                            onTap: () => print(index),
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
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

 static Widget webBar(Size size, bool isFirst,{ void Function()? onPressed}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         isFirst ?titel:titel2,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
               isFirst? SizedBox(
                    width: size.width * 0.1,
                    child: CustomWidgets.addButton(onPressed: onPressed)):sizebox5,
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    child: CustomWidgets.iconButtonC(
                        Icons.mail, size.width * 0.4, kGreen)),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    child: CustomWidgets.iconButtonC(
                        Icons.call, size.width * 0.4, kGreen)),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    child: CustomWidgets.iconButtonC(
                        Icons.info, size.width * 0.4, isFirst? kGreen:kPrimaryColor))
              ],
            ),
          )
        ],
      );
}
