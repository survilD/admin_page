import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_1/constants.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  final _drawer = GlobalKey<ScaffoldState>();

  List<DataCell> _createCell(indexR) {
    return List.generate(
        column.length,
        (index) => DataCell(Text(
              index == 0 ? indexR.toString() : index.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[800]),
            ))).toList();
  }

  List<DataRow> _createRow() {
    return List.generate(50, (index) => DataRow(cells: _createCell(index + 1)))
        .toList();
  }

  List<DataColumn> _createColumn() {
    return List.generate(
        column.length,
        (index) => DataColumn(
                label: Text(
              column[index].toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ))).toList();
  }

  final List column = [
    "No",
    "Position",
    "Type",
    "PostedDate",
    "LastDateApply",
    "CloseDate",
    "Status",
    "Action"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawer,
      drawerEnableOpenDragGesture: false,
      drawer: const Drawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          title: GestureDetector(
            onTap: () => _drawer.currentState!.openDrawer(),
            child: Image.asset(
              "assets/Image/drawer.png",
              height: 25,
            ),
          ),
          leading: const Padding(
            padding: EdgeInsets.all(12.0),
            child: CircleAvatar(
              backgroundColor: kPrimaryColor,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          actionsIconTheme: const IconThemeData(
            size: 28,
            color: Colors.black,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.chat_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications_none_outlined,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () {},
            ),
            const SizedBox(
              width: 10,
            ),
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                  "https://miro.medium.com/max/554/1*Ld1KM2WSfJ9YQ4oeRf7q4Q.jpeg"),
            ),
            const SizedBox(
              width: 15,
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Job List",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 130,
                    child: CupertinoButton(
                      child: const Text(
                        '+ Add New Job',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {},
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(child: iconButtonC(Icons.mail)),
                  GestureDetector(child: iconButtonC(Icons.call)),
                  GestureDetector(child: iconButtonC(Icons.info)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: _createColumn(),
                    rows: _createRow(),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget iconButtonC(IconData icons) {
    return CircleAvatar(
      backgroundColor: kGreen,
      child: Icon(
        icons,
        size: 18,
        color: Colors.white,
      ),
    );
  }
}
