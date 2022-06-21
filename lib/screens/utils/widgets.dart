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
        leading: const Padding(padding: EdgeInsets.all(12.0), child: imageLogo),
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

  static constDrawer(Size size) {
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
    );
  }

  static flotButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomWidgets.flotbutton(
            onPressed: () {},
            color: kPrimaryColor.withAlpha(202),
            icons: Icons.next_plan_sharp),
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
}
