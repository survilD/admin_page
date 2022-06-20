import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_training_1/data.dart';
import 'package:flutter_training_1/dbhelper/getdata.dart';
import 'package:flutter_training_1/responsive.dart';
import 'package:flutter_training_1/screens/desktop/desktop_adddata.dart';
import 'package:flutter_training_1/screens/mobile/mobile_adddata.dart';

import 'package:flutter_training_1/screens/utils/constants.dart';
import 'package:flutter_training_1/screens/utils/widgets.dart';

import '../tablet/tablet_adddata.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  final _drawer = GlobalKey<ScaffoldState>();

  void addData() async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Responsive(
                context: context,
                mobile: DataAdd(map: {}, idEdit: false),
                tablet: TablateDataAdd(),
                desktop: DesktopDataAdd(),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          key: _drawer,
          drawerEnableOpenDragGesture: false,
          drawer: CustomWidgets.constDrawer(size),
          appBar: CustomWidgets.customAppBar(_drawer),
          floatingActionButton: CustomWidgets.flotButton(),
          body: mainPage(size)),
    );
  }

  Widget mainPage(Size size) =>
      // Size size = MediaQuery.of(context).size;
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Job List",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.38,
                        child: CupertinoButton(
                          child: FittedBox(
                            child: const Text(
                              '+ Add New Job',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                          onPressed: addData,
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(20),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                      sizebox5,
                      GestureDetector(
                          child: iconButtonC(Icons.mail, size.width)),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                          child: iconButtonC(Icons.call, size.width)),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                          child: iconButtonC(Icons.info, size.width))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Scrollbar(
                  scrollbarOrientation: ScrollbarOrientation.bottom,
                  radius: Radius.circular(20),
                  trackVisibility: true,
                  child: SingleChildScrollView(
                    controller: scrollControllertabel,
                    scrollDirection: Axis.horizontal,
                    child: FutureBuilder<List<dynamic>?>(
                        future: DataGet().getDataLocal(),
                        builder: (BuildContext context, snapshot) =>
                            (snapshot.hasData)
                                ? data(snapshot)
                                : CircularProgressIndicator()),
                  ),
                )),
            SizedBox(
              height: size.height * 0.07,
            ),
            Text(
              copyright,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            sizebox5,
            SizedBox(
              height: size.height * 0.02,
            ),
          ],
        ),
      );

  data(AsyncSnapshot<List<dynamic>?> snapshot) {
    if (snapshot.data!.isNotEmpty) {
      List<dynamic> data = snapshot.data as List;

      List<DataColumn>? colm =
          Data.getcolume(data, context) as List<DataColumn>;

      List<DataRow> row = Data.getrow(data, context);

      return Card(
        child: Column(
          children: [
            DataTable(
              columnSpacing: 25,
              dataRowHeight: 70,
              dividerThickness: 5,
              columns: colm,
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

  Widget iconButtonC(IconData icons, double width) {
    return CircleAvatar(
      radius: width * 0.04,
      backgroundColor: kGreen,
      child: Icon(
        icons,
        size: 15,
        color: Colors.white,
      ),
    );
  }
}
