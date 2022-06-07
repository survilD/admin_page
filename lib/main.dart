import 'package:flutter/material.dart';
import 'package:flutter_training_1/home_page_desktop.dart';
import 'package:flutter_training_1/home_page_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mobile_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Demo 1",
        theme: ThemeData(
            primaryColor: Color.fromRGBO(244, 61, 39, 5),
            backgroundColor: Colors.white),
        home: const Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const MobileHome(name: "survil"),

      // MobileLogin(),
      desktop: const DesktopLogin(),
    );
  }
}
