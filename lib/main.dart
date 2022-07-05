import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/datasource.dart/boxes.dart';
import 'package:provider/provider.dart';
import 'presentation/screen/jobform.dart';
import 'presentation/screen/home.dart';
import 'package:hive_flutter/adapters.dart';

import 'data/constants.dart';
import 'data/model/hive_databse.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

await Hive.initFlutter();
Hive.registerAdapter(ModelAdapter());
await Hive.openBox<Model>("model");
  Provider.debugCheckInvalidValueType = null;
  // Hive.box("model").close();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Boxes>(
      create: (context) => Boxes(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const  Home(),
          '/second': (context) => DataAdd(model: Model(),
                    isEdit: false),
              










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
