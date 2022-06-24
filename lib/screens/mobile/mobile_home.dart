import 'package:flutter/material.dart';

import 'package:flutter_training_1/screens/utils/data.dart';
import 'package:flutter_training_1/responsive.dart';
import 'package:flutter_training_1/screens/desktop/desktop_adddata.dart';
import 'package:flutter_training_1/screens/mobile/mobile_adddata.dart';
import 'package:flutter_training_1/screens/utils/constants.dart';
import 'package:flutter_training_1/screens/utils/widgets.dart';
import 'package:provider/provider.dart';

import '../../provider/dataProvider.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  final _drawer = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    final postMdl = Provider.of<DataProvider>(context, listen: false);
    postMdl.getPostdata(context);
  }

  void addData() async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Responsive(
                context: context,
                mobile: DataAdd(map: {}, isEdit: false),
                desktop: DesktopDataAdd(isEdit: false,),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<DataProvider>(context);
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
          body: mainPage(size, postMdl)),
    );
  }

  Widget mainPage(Size size, DataProvider postMdl) => Row(
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
                                backgroundImage: const NetworkImage(
                                  "https://miro.medium.com/max/554/1*Ld1KM2WSfJ9YQ4oeRf7q4Q.jpeg",
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
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
                              child: CustomWidgets.addButton(onPressed: addData)

                              // CupertinoButton(
                              //   child: const FittedBox(
                              //     child: const Text(
                              //       '+ Add New Job',
                              //       style: TextStyle(
                              //           fontSize: 15,
                              //           fontWeight: FontWeight.w600),
                              //     ),
                              //   ),
                              //   onPressed: addData,
                              //   color: kPrimaryColor,
                              //   borderRadius: BorderRadius.circular(20),
                              //   padding: const EdgeInsets.all(10),
                              // ),
                              ),
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
                          radius: Radius.circular(20),
                          trackVisibility: true,
                          child: SingleChildScrollView(
                              controller: scrollControllertabel,
                              scrollDirection: Axis.horizontal,
                              child: postMdl.loading
                                  ? Center(child: CircularProgressIndicator())
                                  : data(postMdl)),
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

  Widget data(DataProvider postMdl) {
    if (postMdl.jobnew!.isNotEmpty) {
      List<Map<String, dynamic>> data = postMdl.jobnew!;

      List<DataColumn> column = Data.getcolume(data, context);

      List<DataRow> row = Data.getrow(data, context, postMdl: postMdl);

      return Card(
        child: Column(
          children: [
            DataTable(
              columnSpacing: Responsive.isMobile(context) ? 20 : 70,
              dataRowHeight: 70,
              dividerThickness: 5,
              columns: column,
              rows: row,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Showing  1 of ${row.length}  Entries"),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OutlinedButton(
                      onPressed: () {},
                      child: Text("Previous"),
                      style: TextButton.styleFrom(
                          primary: kPrimaryColor,
                          side: BorderSide(color: kPrimaryColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                  SizedBox(
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
                      child: Text(
                        "1",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                      onPressed: () {},
                      child: Text("Next"),
                      style: TextButton.styleFrom(
                          primary: kPrimaryColor,
                          side: BorderSide(color: kPrimaryColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                ],
              ),
            ),
            sizebox5
          ],
        ),
      );
    } else {
      return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Center(child: Text("No Data Found")));
    }
  }
}
