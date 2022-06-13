import 'package:flutter/material.dart';
import 'package:flutter_training_1/screens/desktop/desktop_adddata.dart';
import 'package:flutter_training_1/screens/desktop/desktop_home.dart';

import 'package:flutter_training_1/screens/mobile/mobile_adddata.dart';
import 'package:flutter_training_1/screens/mobile/mobile_home.dart';
import 'package:flutter_training_1/screens/tablet/tablet_adddata.dart';
import 'package:flutter_training_1/screens/tablet/tablet_home.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 600 && constraints.maxWidth <= 1024) {
        return TablateHome(
          name: "survil",
        );
      } else if (constraints.maxWidth > 1024) {
        return DesktopHome(
          name: "survil",
        );
      } else {
        return MobileHome(
          name: "survil",
        );
      }
    });
  }
}

class Responsive extends StatelessWidget {
  const Responsive({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 600 && constraints.maxWidth <= 1024) {
        return TablateDataAdd(
          name: "survil",
        );
      } else if (constraints.maxWidth > 1024) {
        return DesktopDataAdd(
          name: "survil",
        );
      } else {
        return DataAdd(
          name: "survi",
        );
      }
    });
  }
}
