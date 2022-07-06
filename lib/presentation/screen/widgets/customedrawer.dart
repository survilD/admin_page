
import 'package:flutter/material.dart';

import '../../../data/constants.dart';

import '../../responsive.dart';


class CostomeDrawer extends StatelessWidget {
  CostomeDrawer({Key? key}) : super(key: key);
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: SizedBox(
        width: size.width * 0.65,
        child: Drawer(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
            )),
            child: Scrollbar(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage: profile,
                          ),
                          sizebox5,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome  ",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 7,
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
                          sizebox5,
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey[800],
                            size: 30,
                          )
                        ],
                      ),
                    ),
                    sizebox5,
                    AnimatedList(
                      key: listKey,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index, animation) {
                        return SlideTransition(
                          position: Tween<Offset>(
                                  begin: Offset(-1, 0), end: Offset(0, 0))
                              .animate(animation),
                          child: ListTile(
                            onTap: () {},
                            horizontalTitleGap: 20,
                            leading: Icon(
                              icon[index],
                              color: Colors.grey[500],
                            ),
                            title: Text(
                              "${drawer[index]}",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_right,
                              size: 40,
                              color: Colors.grey[400],
                            ),
                            minLeadingWidth:
                                Responsive.isMobile(context) ? 25 : 50,
                          ),
                        );
                      },
                      initialItemCount: drawer.length,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
