import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'data/constants.dart';
import 'presentation/provider/driftprovider.dart';
import 'presentation/screen/datadd.dart';
import 'presentation/screen/home.dart';
import 'roots/shared.dart';

import 'package:provider/provider.dart';

import 'data/datasource.dart/drift_databse.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;




  runApp(MultiProvider(providers: [
    Provider<AppDataBase>(create: (context) => constructDb(),),
    ChangeNotifierProvider<DataProvider>(create: (context) => DataProvider(),)


  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
