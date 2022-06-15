import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_training_1/responsive.dart';
import 'package:flutter_training_1/screens/desktop/desktop_home.dart';

import 'package:flutter_training_1/screens/mobile/mobile_home.dart';
import 'package:flutter_training_1/screens/tablet/tablet_home.dart';

import 'package:flutter_training_1/screens/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: "Demo 1",
        theme: ThemeData(
            scrollbarTheme: ScrollbarThemeData(
                thumbColor: MaterialStateProperty.all(kPrimaryColor)),
            primaryColor: Color.fromRGBO(244, 61, 39, 5),
            backgroundColor: Colors.white),
        home: const Responsive(
          mobile: MobileHome(),
          tablet: TablateHome(),
          desktop: DesktopHome(),
        ));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
