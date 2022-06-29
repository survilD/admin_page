// import 'package:flutter/material.dart';
// import 'package:flutter_training_1/logicpart/logictable.dart';
// import 'package:flutter_training_1/mobx/table_mobx.dart';

// import 'package:flutter_training_1/responsive.dart';
// import 'package:flutter_training_1/screens/utils/constants.dart';
// import 'package:flutter_training_1/screens/utils/widgets.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:mobx/mobx.dart';
// import 'package:provider/provider.dart';

// import '../../provider/dataProvider.dart';

// class MobileHomemobx extends StatefulWidget {
//   const MobileHomemobx({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MobileHomemobx> createState() => _MobileHomemobxState();
// }

// class _MobileHomemobxState extends State<MobileHomemobx> {
//   final postMdl = MxTable();
//   final _drawer = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     postMdl.getPostdata();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return SafeArea(
//       child: Scaffold(
//           key: _drawer,
//           drawerEnableOpenDragGesture: false,
//           drawer: Responsive.isMobile(context)
//               ? CustomWidgets.constDrawer(
//                   size,
//                 )
//               : null,
//           appBar: CustomWidgets.customAppBar(_drawer, context, size, true),
//           floatingActionButton: CustomWidgets.flotButton(true),
//           body: mainPage(
//             size,
//           )),
//     );
//   }

//   Widget mainPage(Size size) => Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Visibility(
//             visible: !Responsive.isMobile(context),
//             child: Expanded(
//               flex: 1,
//               child: Scrollbar(
//                 controller: scrollController,
//                 thickness: 2,
//                 child: SingleChildScrollView(
//                   controller: scrollController,
//                   child: Container(
//                     color: Colors.white,
//                     width: size.width * 0.02,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 8),
//                       child: Column(
//                         children: [
//                           FittedBox(
//                             child: Padding(
//                               padding: const EdgeInsets.only(bottom: 15),
//                               child: CircleAvatar(
//                                 radius: size.width * 0.045,
//                                 backgroundImage: profile,
//                               ),
//                             ),
//                           ),
//                           ListView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: drawer.length,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 10, bottom: 10),
//                                 child: GestureDetector(
//                                   onTap: () => print(index),
//                                   child: Icon(
//                                     icon[index],
//                                     size: size.width * 0.04,
//                                     color: Colors.grey[500],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 6,
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: titel,
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                               width: Responsive.isMobile(context)
//                                   ? size.width * 0.3
//                                   : size.width * 0.18,
//                               child: CustomWidgets.addButton(
//                                   onPressed: () =>
//                                       addDetailpageRoute(context))),
//                           sizebox5,
//                           CustomWidgets.iconButtonC(
//                               Icons.mail,
//                               Responsive.isMobile(context)
//                                   ? size.width * 1.1
//                                   : size.width * 0.75,
//                               kGreen),
//                           sizebox5,
//                           CustomWidgets.iconButtonC(
//                               Icons.call,
//                               Responsive.isMobile(context)
//                                   ? size.width * 1.1
//                                   : size.width * 0.75,
//                               kGreen),
//                           sizebox5,
//                           CustomWidgets.iconButtonC(
//                               Icons.info,
//                               Responsive.isMobile(context)
//                                   ? size.width * 1.1
//                                   : size.width * 0.75,
//                               kGreen)
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Scrollbar(
//                           scrollbarOrientation: ScrollbarOrientation.bottom,
//                           radius: const Radius.circular(20),
//                           trackVisibility: true,
//                           child: SingleChildScrollView(
//                               controller: scrollControllertabel,
//                               scrollDirection: Axis.horizontal,
//                               child: data(size)),
//                         )),
//                   ),
//                 ),
//                 SizedBox(
//                   height: size.height * 0.07,
//                 ),
//                 const Text(
//                   copyright,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: size.height * 0.02,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );

//   Widget data(Size size) => Observer(builder: (context) {
//         if ((!postMdl.loading)) {
//           return (postMdl.jobnew!.isNotEmpty)
//               ? Card(
//                   child: Column(
//                     children: [
//                       TableGanrate.tableFetchDesktop(postMdl, context, size),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       // Text("Showing  1 of ${.length}  Entries"),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             OutlinedButton(
//                                 onPressed: () {},
//                                 child: const Text("Previous"),
//                                 style: TextButton.styleFrom(
//                                     primary: kPrimaryColor,
//                                     side:
//                                         const BorderSide(color: kPrimaryColor),
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(30)))),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             SizedBox(
//                               width: 50,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     primary: kPrimaryColor,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(30))),
//                                 onPressed: () {},
//                                 child: const Text(
//                                   "1",
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             OutlinedButton(
//                                 onPressed: () {},
//                                 child: const Text("Next"),
//                                 style: TextButton.styleFrom(
//                                     primary: kPrimaryColor,
//                                     side:
//                                         const BorderSide(color: kPrimaryColor),
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(30)))),
//                           ],
//                         ),
//                       ),
//                       sizebox5
//                     ],
//                   ),
//                 )
//               : Center(
//                   child: Text("No Data"),
//                 );
//         } else {
//           return CircularProgressIndicator();
//         }
//       });
// }
