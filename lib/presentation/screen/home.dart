// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_training_1/data/datasource.dart/drift_databse.dart';
import 'package:flutter_training_1/presentation/provider/driftprovider.dart';
import 'package:flutter_training_1/presentation/screen/widgets/desktopAppbar.dart';
import 'package:flutter_training_1/presentation/screen/widgets/flotButton.dart';
import 'package:flutter_training_1/presentation/screen/widgets/mobileAppBar.dart';
import 'package:flutter_training_1/presentation/screen/widgets/pageheading.dart';
import 'package:flutter_training_1/presentation/screen/widgets/tableview.dart';
import 'package:flutter_training_1/presentation/screen/widgets/webDrawer.dart';
import 'package:provider/provider.dart';

import '../../data/constants.dart';
import '../responsive.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _drawer = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    DataProvider userbox = Provider.of<DataProvider>(context, listen: false);
    userbox.getUserFuture();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      key: _drawer,
      drawerEnableOpenDragGesture: false,
      drawer: Responsive.isMobile(context) ? CostomeDrawer() : null,
      appBar: Responsive.isDesktop(context)
          ? PreferredSize(
              preferredSize: Size.fromHeight(size.height * 0.14),
              child: const DesktopAppBar(isFirst: true))
          : PreferredSize(
              child: MobileAppBar(
                drawer: _drawer,
                isFirst: true,
              ),
              preferredSize: Size.fromHeight(size.height * 0.1),
            ),
      floatingActionButton: const CustomeFlotButton(isFirst: true),
      body: const MainHomePageBody(),
    ));
  }
}

class MainHomePageBody extends StatelessWidget {
  const MainHomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: !Responsive.isMobile(context),
          child: const Expanded(flex: 1, child: WEbDrawer()),
        ),
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PageHeading(
                  isFirst: true,
                  onPressed: () => Navigator.pushNamed(context, "/second"),
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
                        controller: scrollControllertabel,
                        scrollbarOrientation: ScrollbarOrientation.bottom,
                        radius: const Radius.circular(20),
                        trackVisibility: true,
                        child: SingleChildScrollView(
                            controller: scrollControllertabel,
                            scrollDirection: Axis.horizontal,
                            child: const TableView()),
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
  }
}

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
                                  begin: const Offset(-1, 0),
                                  end: const Offset(0, 0))
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
