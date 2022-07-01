import 'package:flutter/material.dart';

import '../../data/constants.dart';
import '../../data/datasource.dart/drift_database.dart';
import '../../main.dart';
import '../../presentation/mobile/mobile_adddata.dart';
import '../../presentation/responsive.dart';

class Data {
  static List<DataColumn> getcolume(
    List<ModelData> list,
    BuildContext context,
  ) {
    if (Responsive.isDesktop(context)) {
      // final box = Boxes.getModel();
      // List<ModelData>? webclmname = box.values.cast<Model>().toList();

      return List.generate(
          list[0].toJson().keys.toList().length + 2,
          (index) => DataColumn(
              label: (list[0].toJson().keys.toList().length + 1 > index)
                  ? (index == 0)
                      ? const Text(
                          "ID",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        )
                      : heading(list[0], index)
                  : const Text(
                      "Action",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ))).toList();
    } else {
      return List.generate(
          4,
          (index) => DataColumn(
              label: ((3 > index)
                  ? Text(
                      list[0].toJson().keys.toList()[index].toUpperCase(),
                      //  [index] keys.toList()[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    )
                  : const Text(
                      "ACTION",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    )))).toList();
    }
  }

  static List<DataRow> getrow(List<ModelData> getrow, BuildContext context,
      {postMdl}) {
    if (Responsive.isDesktop(context)) {
      // final box = Boxes.getModel();

      // List<Model>? webclmname = getrow.cast<Model>();

      return List.generate(
          getrow.length,
          (index1) => DataRow(
                cells: _createCell(
                  getrow[index1],
                  index1,
                  context,
                ),
              )).toList();
    } else {
      return List.generate(
          getrow.length,
          (index1) => DataRow(
                cells: _createCell(
                  getrow[index1],
                  index1 + 1,
                  context,
                ),
              )).toList();
    }
  }

  static List<DataCell> _createCell(
      ModelData m, int index1, BuildContext context,
      {postMdl}) {
    Size size = MediaQuery.of(context).size;
    return List.generate(
        (Responsive.isMobile(context) || Responsive.isTablet(context))
            ? 4
            : m.toJson().length + 2,
        (index) => (Responsive.isMobile(context) ||
                Responsive.isTablet(context))
            ? DataCell((3 == index)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                          backgroundColor: kpop.withAlpha(30),
                          child: GestureDetector(
                              onTap: () async {
                                // List<Map<String, dynamic>> val =
                                //     postMdl!.jobnew!;
                                // Map<String, dynamic> map = {};

                                // val.forEach((element) {
                                //   if (element["Id"] == m["Id"]) {
                                //     map = element as Map<String, dynamic>;
                                //   }
                                // });

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        dialog(m.toJson(), size, context));
                              },
                              child: Icon(Icons.remove_red_eye, color: kpop)),
                          radius: 20),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                          backgroundColor: kpen,
                          child: GestureDetector(
                              onTap: () async {
                                // List<Map<String, dynamic>> val =
                                //     postMdl!.jobnew!;
                                // Map<String, dynamic> map = {};

                                // val.forEach((element) {
                                //   if (element["Id"] == m["Id"]) {
                                //     map = element;

                                //   }
                                // }
                                // );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DataAdd(
                                      modelCompanion: m.toCompanion(true),
                                      isEdit: true,
                                    ),
                                  ),
                                );
                              },
                              child: Icon(Icons.edit_sharp, color: kGreen))),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                          backgroundColor: kpink.withAlpha(50),
                          child: GestureDetector(
                            onTap: () async =>
                                appDatabse.deleteUSer(m.toCompanion(true)),
                            child: Icon(
                              Icons.delete,
                              color: kpink,
                            ),
                          )),
                    ],
                  )
                : (index == 0)
                    ? Text(
                        (index1).toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )
                    : Text(
                        m
                            .toJson()
                            .values
                            .toList()[index]
                            .toString()
                            .toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[800]),
                      ))
            : DataCell((m.toJson().values.toList().length + 1 > index)
                ? (index == 0)
                    ? Text(
                        (index1 + 1).toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )
                    : (m
                                    .toJson()
                                    .values
                                    .toList()[index - 1]
                                    .toString()
                                    .toUpperCase() ==
                                "TRUE" ||
                            m.toJson().values.toList()[index - 1].toString() ==
                                "FALSE")
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (m
                                          .toJson()
                                          .values
                                          .toList()[index - 1]
                                          .toString()
                                          .toUpperCase() ==
                                      "TRUE")
                                  ? kpop.withAlpha(30)
                                  : kpink.withAlpha(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                (m
                                            .toJson()
                                            .values
                                            .toList()[index - 1]
                                            .toString()
                                            .toUpperCase() ==
                                        "TRUE")
                                    ? "ACTIVE"
                                    : "InActive",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: (m
                                                .toJson()
                                                .values
                                                .toList()[index - 1]
                                                .toString()
                                                .toUpperCase() ==
                                            "TRUE")
                                        ? kpop
                                        : kpink),
                              ),
                            ),
                          )
                        : (m
                                    .toJson()
                                    .values
                                    .toList()[index - 1]
                                    .toString()
                                    .toUpperCase() ==
                                "FALSE")
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (m
                                              .toJson()
                                              .values
                                              .toList()[index - 1]
                                              .toString()
                                              .toUpperCase() ==
                                          "FALSE")
                                      ? kpink.withAlpha(30)
                                      : kpink.withAlpha(30),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "InActive",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: kpink),
                                  ),
                                ),
                              )
                            : Text(
                                m
                                    .toJson()
                                    .values
                                    .toList()[index - 1]
                                    .toString()
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.grey[800]),
                              )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                          backgroundColor: kpop.withAlpha(30),
                          child: GestureDetector(
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      dialog(m.toJson(), size, context)),
                              child: Icon(Icons.remove_red_eye, color: kpop)),
                          radius: 20),
                      sizebox5,
                      CircleAvatar(
                          backgroundColor: kpen,
                          child: GestureDetector(
                              // onTap: () => onEditWeb(m, context),
                              child: Icon(Icons.edit_sharp, color: kGreen))),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                          backgroundColor: kpink.withAlpha(50),
                          child: GestureDetector(
                            // onTap: () async {
                            //   m.delete();
                            // },
                            child: Icon(
                              Icons.delete,
                              color: kpink,
                            ),
                          )),
                    ],
                  ))).toList();
  }

  static Widget dialog(Map map, Size size, BuildContext context) => Dialog(
        child: (map.isNotEmpty)
            ? SizedBox(
                width: Responsive.isDesktop(context)
                    ? size.width * 0.5
                    : size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Responsive.isDesktop(context)
                      ? map.length
                      : map.length - 1,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      shadowColor: kPrimaryColor,
                      child: ListTile(
                        minLeadingWidth: size.width * 0.3,
                        leading: Text(
                          map.keys
                              .toList()[Responsive.isDesktop(context)
                                  ? index
                                  : index + 1]
                              .toString(),
                          style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          (map.values
                                          .toList()[index]
                                          .toString()
                                          .toUpperCase() ==
                                      "TRUE" ||
                                  map.values
                                          .toList()[index]
                                          .toString()
                                          .toUpperCase() ==
                                      "FALSE")
                              ? (map.values
                                          .toList()[index]
                                          .toString()
                                          .toUpperCase() ==
                                      "TRUE")
                                  ? "ACTIVE"
                                  : "InACTIVE"
                              : map.values
                                  .toList()[Responsive.isDesktop(context)
                                      ? index
                                      : index + 1]
                                  .toString()
                                  .toUpperCase(),
                          style: TextStyle(
                              color: kGrey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Center(child: CircularProgressIndicator()),
      );

  static heading(ModelData model, int index) {
    Map map = model.toJson();

    return Text(
      map.keys.toList()[index - 1],
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    );
  }

  // static onEditWeb(Model m, BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) => DesktopDataAdd(
  //               isEdit: true,
  //               model: m,
  //             )),
  //   );
  // }
}
