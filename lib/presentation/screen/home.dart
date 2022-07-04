import 'package:flutter/material.dart';
import '../../data/model/hive_databse.dart';
import 'package:hive_flutter/adapters.dart';

import '../../data/datasource.dart/boxes.dart';
import '../../domain/logicpart/logictable.dart';

import '../responsive.dart';
import '../../data/constants.dart';
import '../widgets.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _drawer = GlobalKey<ScaffoldState>();

// close box when state dispose
  @override
  void dispose() {
    Hive.box("model").close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          key: _drawer,
          drawerEnableOpenDragGesture: false,
          drawer: Responsive.isMobile(context)
              ? CustomWidgets.constDrawer(
                  size,
                )
              : null,
          appBar: Responsive.isDesktop(context)
              ? CustomWidgets.webAppBar(size, true):CustomWidgets.customAppBar(_drawer, context, size, true) ,
              
          floatingActionButton: CustomWidgets.flotButton(true),
          body: mainPage(size)),
    );
  }

  Widget mainPage(
    Size size,
  ) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: !Responsive.isMobile(context),
            child: Expanded(
                flex: 1, child: CustomWidgets.webDrower(size, context)

                ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomWidgets.pageHeading(
                    size,
                    true,
                    context,
                    onPressed: () => Navigator.pushNamed(context, "/second"),
                  ),
                ),
               
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Scrollbar(
                          controller: scrollControllertabel,
                          scrollbarOrientation: ScrollbarOrientation.bottom,
                          radius: const Radius.circular(20),
                          trackVisibility: true,
                          child: SingleChildScrollView(
                              controller: scrollControllertabel,
                              scrollDirection: Axis.horizontal,
                              child: tableview(
                                size,
                              )),
                        )),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                const Text(
                  copyright,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
              ],
            ),
          ),
        ],
      );

  Widget tableview(
    Size size,
  ) {
    final boxes = Boxes.getModel().listenable();

    return ValueListenableBuilder<Box<Model>>(
      valueListenable: boxes,
      builder: (context, box, _) {
        if (box.values.isEmpty) {
          return const Center(
            child: Text("No data"),
          );
        } else {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
        
              children: [
                TableGanrate.tableFetch(box, context, size),
                const SizedBox(
                  height: 20,
                ),
                Text("Showing  1 of ${box.length}  Entries"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        onPressed: () {},
                        child: const Text("Previous"),
                        style: TextButton.styleFrom(
                            primary: kPrimaryColor,
                            side: const BorderSide(color: kPrimaryColor),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)))),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {},
                        child: const Text(
                          "1",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(
                        onPressed: () {},
                        child: const Text("Next"),
                        style: TextButton.styleFrom(
                            primary: kPrimaryColor,
                            side: const BorderSide(color: kPrimaryColor),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)))),
                  ],
                ),
                sizebox5
              ],
            ),
          );
        }
      },
    );
  }
}
