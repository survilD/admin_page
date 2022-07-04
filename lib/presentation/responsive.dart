import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({Key? key, this.mobile, this.desktop, this.context, this.tablet}) : super(key: key);
  final Widget? mobile;
  final Widget? desktop;
  final Widget? tablet;
  final BuildContext? context;

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1090 && MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1090;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth>=650 && constraints.maxWidth <= 1090) {
        return tablet!;
      } else if (constraints.maxWidth > 1090) {
        return desktop!;
      } else {
        return mobile!;
      }
    });
  }
}
