import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_1/presentation/desktop/desktop_adddata.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'data/datasource.dart/hive_databse.dart';
import 'data/model/jobmdoel.dart';
import 'presentation/mobile/mobile_adddata.dart';
import 'presentation/responsive.dart';

import 'presentation/mobile/mobile_home.dart';

import 'data/constants.dart';

import 'presentation/desktop/desktop_home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

await Hive.initFlutter();
Hive.registerAdapter(ModelAdapter());
await Hive.openBox<Model>("model");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Responsive(
              mobile: MobileHome(),
              desktop: DesktopHome(),
            ),
        '/second': (context) => Responsive(
              context: context,
              mobile:  DataAdd(model: Model(),
                  isEdit: false),
              desktop: DesktopDataAdd(
                model: Model(),
                isEdit: false,
              ),
            )
      },

      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: "Demo 1",
      theme: ThemeData(
          scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all(kPrimaryColor)),
          primaryColor: const Color.fromRGBO(244, 61, 39, 5),
          backgroundColor: Colors.white),
      // home: const Responsive(
      //   mobile: MobileHome(),
      //   desktop: DesktopHome(),
      // )
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
