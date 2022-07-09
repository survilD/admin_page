import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_1/data/constants.dart';
import 'package:flutter_training_1/presentation/screen/datadd.dart';
import 'package:flutter_training_1/presentation/screen/home.dart';
import 'package:flutter_training_1/roots/shared.dart';

import 'package:provider/provider.dart';

import 'data/model/drift_databse.dart';

late AppDataBase appDataBase;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  // AppDataBase  appdatabase = constructDb();

// await Hive.initFlutter();
// Hive.registerAdapter(ModelAdapter());
// await Hive.openBox<Model>("model");
//   Provider.debugCheckInvalidValueType = null;
  // Hive.box("model").close();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppDataBase>(
      create: (context) => constructDb(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/second': (context) =>
              const DataAdd(model: UserTableCompanion(), isEdit: false),
        },
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: "Admin",
        theme: ThemeData(
            fontFamily: "Google font",
            scrollbarTheme: ScrollbarThemeData(
                thumbColor: MaterialStateProperty.all(kPrimaryColor)),
            primaryColor: const Color.fromRGBO(244, 61, 39, 5),
            backgroundColor: Colors.white),
      ),
     
    );
  }
}

// scroll for web horizantal
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
