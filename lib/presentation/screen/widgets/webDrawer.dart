


import 'package:flutter/material.dart';

import '../../../data/constants.dart';

import '../../responsive.dart';


class WEbDrawer extends StatelessWidget {
  const WEbDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scrollbar(
      controller: verticalcontroller,
      thickness: 2,
      child: SingleChildScrollView(
        controller: verticalcontroller,
        child: Container(
          color: Colors.white,
          width: Responsive.isDesktop(context) ? null : size.width * 0.02,
          height: Responsive.isDesktop(context) ? size.height : null,
          child: Padding(
            padding: Responsive.isDesktop(context)
                ? const EdgeInsets.only(left: 10)
                : const EdgeInsets.only(top: 8),
            child: Column(
              children: [
                SizedBox(
                  height:
                      Responsive.isDesktop(context) ? size.height * 0.12 : null,
                  child: FittedBox(
                    child: !Responsive.isDesktop(context)
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: CircleAvatar(
                              radius: size.width * 0.045,
                              backgroundImage: profile,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 40,
                                backgroundImage: profile,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 5, bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Welcome  ",
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Superadmin",
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey[800],
                                size: 30,
                              )
                            ],
                          ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: drawer.length,
                  itemBuilder: (context, index) {
                    return Responsive.isTablet(context)
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Icon(
                              icon[index],
                              size: size.width * 0.04,
                              color: Colors.grey[500],
                            ),
                          )
                        : FittedBox(
                            child: Row(
                              children: [
                                Icon(
                                  icon[index],
                                  color: Colors.grey[500],
                                ),
                                SizedBox(
                                  width: size.width * 0.08,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      "${drawer[index]}",
                                      style: TextStyle(
                                        fontSize: size.width * 0.01,
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  size: 40,
                                  color: Colors.grey[400],
                                ),
                              ],
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
