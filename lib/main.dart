import 'dart:ui';

import 'package:flutter/material.dart';
import 'presentation/desktop/desktop_adddata.dart';
import 'presentation/mobile/mobile_adddata.dart';
import 'data/datasource.dart/drift_database.dart';

import 'presentation/responsive.dart';

import 'presentation/mobile/mobile_home.dart';

import 'data/constants.dart';

import 'package:provider/provider.dart';

import 'data/model/jobmdoel.dart';
import 'presentation/desktop/desktop_home.dart';


late final AppDatabse appDatabse;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appDatabse = AppDatabse();

  runApp(Provider(
    create: (context) => AppDatabse(),
    child:const MyApp(),
  ));
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
              mobile: const DataAdd(
                  modelCompanion: ModelCompanion(), isEdit: false),
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
