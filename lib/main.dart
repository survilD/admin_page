
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_1/dbhelper/database/drift_database.dart';

// import 'package:flutter_training_1/dbhelper/database/moor_database.dart';

import 'package:flutter_training_1/responsive.dart';
import 'package:flutter_training_1/screens/desktop/desktop_home.dart';
import 'package:flutter_training_1/provider/dataProvider.dart';
import 'package:flutter_training_1/screens/mobile/mobile_home.dart';

import 'package:flutter_training_1/screens/utils/constants.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Provider(create: (context) => AppDatabse(),child: MyApp(),) );
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
            primaryColor: const Color.fromRGBO(244, 61, 39, 5),
            backgroundColor: Colors.white),
        home: const Responsive(
          mobile: MobileHome(),
          desktop: DesktopHome(),
        )
        
        );
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
