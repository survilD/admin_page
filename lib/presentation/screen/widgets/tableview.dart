


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/constants.dart';
import '../../../data/datasource.dart/boxes.dart';
import '../../../domain/logicpart/logictable.dart';

class TableView extends StatelessWidget {
  const TableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<Boxes>(
      builder: (context, box, _) {
        if (box.data.isNotEmpty) {
          return (box.isloding)
              ? const CircularProgressIndicator()
              : Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      TableGanrate.tableFetch(box.data, context, size),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Showing  1 of ${box.data.length}  Entries"),
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
                                      borderRadius:
                                          BorderRadius.circular(30)))),
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
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                        ],
                      ),
                      sizebox5
                    ],
                  ),
                );
        } else {
          return const Center(
            child: Text("NO Data"),
          );
        }
      },
    );
  }
}
