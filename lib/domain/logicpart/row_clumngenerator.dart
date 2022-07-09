import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart';
import '../../data/datasource.dart/boxes.dart';
import 'package:provider/provider.dart';

import '../../data/constants.dart';
import '../../data/model/hive_databse.dart';

import '../../presentation/responsive.dart';
import '../../presentation/screen/datadd.dart';


class Data {
  static List<DataColumn> getcolume(
    List<Model> list,
    BuildContext context,
  ) {
    if (Responsive.isDesktop(context)) {
      return List.generate(
          list[0].toMap().length + 2,
          (index) => DataColumn(
              label: (list[0].toMap().length + 1 > index)
                  ? (index == 0)
                      ?  Text(
                          "ID",
                          style: GoogleFonts.montserrat() .copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        )
                      : heading(list[0], index)
                  :  Text(
                      "Action",
                      style:  GoogleFonts.montserrat().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ))).toList();
    } else {
      return List.generate(
          4,
          (index) => DataColumn(
              label: ((3 > index)
                  ? (index == 0)
                      ?  Text(
                          "ID",
                          style:  GoogleFonts.montserrat().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        )
                      : Text(
                          list[0].toMap().keys.toList()[index - 1],
                          style:  GoogleFonts .montserrat().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        )
                  :  Text(
                      "Action",
                      style:  GoogleFonts.montserrat().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    )))).toList();
    }
  }

  static List<DataRow> getrow(List<Model> getrow, BuildContext context,
      {postMdl}) {
    if (Responsive.isDesktop(context)) {
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
    Model m,
    int index1,
    BuildContext context,
  ) {
    Size size = MediaQuery.of(context).size;
    return List.generate(
        (Responsive.isMobile(context) || Responsive.isTablet(context))
            ? 4
            : m.toMap().length + 2,
        (index) => (Responsive.isMobile(context) ||
                Responsive.isTablet(context))
            ? DataCell((3 == index)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                          backgroundColor: kpop.withAlpha(30),
                          child: GestureDetector(
                            onTap: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      dialog(m.toMap(), size, context)),
                            child: const Icon(Icons.remove_red_eye, color: kpop),
                          ),
                          radius: 20),
                      const SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                          backgroundColor: kpen,
                          child: GestureDetector(
                              onTap: () => onEdit(m, context),
                              child:const  Icon(Icons.edit_sharp, color: kGreen))),
                    const   SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                          backgroundColor: kpink.withAlpha(50),
                          child: GestureDetector(
                            onTap: () async => await Provider.of<Boxes>(context,listen:false).deletemodel(m),
                            child:const  Icon(
                              Icons.delete,
                              color: kpink,
                            ),
                          )),
                    ],
                  )
                : (index == 0)
                    ? Text(
                        (index1).toString(),
                        style: GoogleFonts.montserrat().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )
                    : Text(
                        m
                            .toMap()
                            .values
                            .toList()[index - 1]
                            .toString()
                            .toUpperCase(),
                        style:  GoogleFonts.montserrat().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[800]),
                      ))
            : DataCell((m.toMap().values.toList().length + 1 > index)
                ? (index == 0)
                    ? Text(
                        (index1 + 1).toString(),
                        style:  GoogleFonts.montserrat().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )
                    : (m
                                    .toMap()
                                    .values
                                    .toList()[index - 1]
                                    .toString()
                                    .toUpperCase() ==
                                "ACTIVE" ||
                            m
                                    .toMap()
                                    .values
                                    .toList()[index - 1]
                                    .toString()
                                    .toUpperCase() ==
                                "INACTIVE")
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (m
                                          .toMap()
                                          .values
                                          .toList()[index - 1]
                                          .toString()
                                          .toUpperCase() ==
                                      "ACTIVE")
                                  ? kpop.withAlpha(30)
                                  : kpink.withAlpha(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                (m
                                            .toMap()
                                            .values
                                            .toList()[index - 1]
                                            .toString()
                                            .toUpperCase() ==
                                        "ACTIVE")
                                    ? "ACTIVE"
                                    : "INACTIVE",
                                style:  GoogleFonts.montserrat().copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: (m
                                                .toMap()
                                                .values
                                                .toList()[index - 1]
                                                .toString()
                                                .toUpperCase() ==
                                            "ACTIVE")
                                        ? kpop
                                        : kpink),
                              ),
                            ),
                          )
                        : Text(
                            m
                                .toMap()
                                .values
                                .toList()[index - 1]
                                .toString()
                                .toUpperCase(),
                            style: GoogleFonts.montserrat().copyWith(
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
                              onTap: () =>   showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      dialog(m.toMap(), size, context)),
                              child:Hero( tag: "hero", child: const Icon(Icons.remove_red_eye, color: kpop))),
                          radius: 20),
                      sizebox5,
                      CircleAvatar(
                          backgroundColor: kpen,
                          child: GestureDetector(
                              onTap: () => onEdit(m, context),
                              child: const Icon(Icons.edit_sharp, color: kGreen))),
                    const   SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                          backgroundColor: kpink.withAlpha(50),
                          child: GestureDetector(
                            onTap: () async =>
                            await Provider.of<Boxes>(context,listen:false).deletemodel(m)
                            ,
                            child: const Icon(
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
                  itemCount:
                      Responsive.isDesktop(context) ? map.length : map.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      shadowColor: kPrimaryColor,
                      child: ListTile(
                        minLeadingWidth: size.width * 0.3,
                        leading: Text(
                          map.keys
                              .toList()[
                                  Responsive.isDesktop(context) ? index : index]
                              .toString(),
                          style:  GoogleFonts.montserrat().copyWith(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                         
                               map.values
                                  .toList()[Responsive.isDesktop(context)
                                      ? index
                                      : index]
                                  .toString()
                                  .toUpperCase(),
                          style:  GoogleFonts.montserrat().copyWith(
                              color: kGrey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      );

  static heading(Model model, int index) {
    Map map = model.toMap();

    return Text(
      map.keys.toList()[index - 1],
      style: GoogleFonts.montserrat().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    );
  }

  static onEdit(Model m, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DataAdd(
                isEdit: true,
                model: m,
              )),
    );
  }
}
