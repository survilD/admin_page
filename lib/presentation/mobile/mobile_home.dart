import 'package:flutter/material.dart';
import 'package:flutter_training_1/data/datasource.dart/hive_databse.dart';
import 'package:hive_flutter/adapters.dart';

import '../../data/datasource.dart/boxes.dart';
import '../../domain/logicpart/logictable.dart';

import '../responsive.dart';
import '../../data/constants.dart';
import '../widgets.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  final _drawer = GlobalKey<ScaffoldState>();

  // Stream<List<ModelData>> getData() {
  //   // return appDatabse.getdatalist();
  // }
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
          appBar: CustomWidgets.customAppBar(_drawer, context, size, true),
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
              flex: 1,
              child: Scrollbar(
                controller: scrollController,
                thickness: 2,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    color: Colors.white,
                    width: size.width * 0.02,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        children: [
                          FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: CircleAvatar(
                                radius: size.width * 0.045,
                                backgroundImage: profile,
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: drawer.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: GestureDetector(
                                  onTap: () => print(index),
                                  child: Icon(
                                    icon[index],
                                    size: size.width * 0.04,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: titel,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: Responsive.isMobile(context)
                                  ? size.width * 0.3
                                  : size.width * 0.18,
                              child: CustomWidgets.addButton(
                                  onPressed: () =>
                                      Navigator.pushNamed(context, "/second"))),
                          sizebox5,
                          CustomWidgets.iconButtonC(
                              Icons.mail,
                              Responsive.isMobile(context)
                                  ? size.width * 1.1
                                  : size.width * 0.75,
                              kGreen),
                          sizebox5,
                          CustomWidgets.iconButtonC(
                              Icons.call,
                              Responsive.isMobile(context)
                                  ? size.width * 1.1
                                  : size.width * 0.75,
                              kGreen),
                          sizebox5,
                          CustomWidgets.iconButtonC(
                              Icons.info,
                              Responsive.isMobile(context)
                                  ? size.width * 1.1
                                  : size.width * 0.75,
                              kGreen)
                        ],
                      )
                    ],
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
                          scrollbarOrientation: ScrollbarOrientation.bottom,
                          radius: const Radius.circular(20),
                          trackVisibility: true,
                          child: SingleChildScrollView(
                              controller: scrollControllertabel,
                              scrollDirection: Axis.horizontal,
                              child: data(
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

  Widget data(
    Size size,
  ) {
    final boxes = Boxes.getModel().listenable();

    return ValueListenableBuilder<Box<Model>>(
      valueListenable: boxes,
      builder: (context, box, _) {
        if (box.values.isEmpty) {
          return Center(
            child: Text("No data"),
          );
        } else {
        
          return Card(
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
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
