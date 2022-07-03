import 'package:flutter/material.dart';
import '../../data/datasource.dart/boxes.dart';

import '../../data/constants.dart';


import 'package:hive_flutter/hive_flutter.dart';


import '../../data/datasource.dart/hive_databse.dart';
import '../../domain/logicpart/logictable.dart';
import '../widgets.dart';


class DesktopHome extends StatefulWidget {
  const DesktopHome({
    Key? key,
  }) : super(key: key);

  @override
  State<DesktopHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<DesktopHome> {
  // close box of hive
  @override
  void dispose() {
    Hive.box("model").close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //fetch table of local data
    final boxes = Boxes.getModel().listenable();

    return SafeArea(
        child: Scaffold(
      appBar: CustomWidgets.webAppBar(size, true),
      floatingActionButton: CustomWidgets.flotButton(true),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: CustomWidgets.webDrower(size)),
          Expanded(
            flex: 6,
            child: Scrollbar(
              controller: verticalscroll,
              child: SingleChildScrollView(
                controller: verticalscroll,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomWidgets.webBar(
                        size,
                        true,
                        onPressed: () =>Navigator.pushNamed(context,"/second"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ValueListenableBuilder<Box<Model>>(
                          valueListenable: boxes,
                          builder: (BuildContext context, box, _) {
                            if (box.isNotEmpty) {
                              return Scrollbar(
                                scrollbarOrientation:
                                    ScrollbarOrientation.bottom,
                                controller: scrollControllertabel,
                                thickness: 6,
                                radius: const Radius.circular(20),
                                child: SingleChildScrollView(
                                  controller: scrollControllertabel,
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TableGanrate.tableFetch(
                                              box, context, size)),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text("Showing 1 of 9 of 9 entries"),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            OutlinedButton(
                                                onPressed: () {},
                                                child: const Text("Previous"),
                                                style: TextButton.styleFrom(
                                                    primary: kPrimaryColor,
                                                    side: const BorderSide(
                                                        color: kPrimaryColor),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)))),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              width: 50,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: kPrimaryColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30))),
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
                                                    side: const BorderSide(
                                                        color: kPrimaryColor),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)))),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return const Center(child: Text("No data"));
                            }
                          },
                        )),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
