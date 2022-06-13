import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_training_1/responsive.dart';

import 'package:flutter_training_1/screens/utils/constants.dart';

Future<void> main() async {
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
        home: const Home());
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
