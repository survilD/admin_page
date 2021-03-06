

import 'package:flutter/material.dart';
import 'package:flutter_training_1/screens/mobile/mobile_mobxadd.dart';


import '../../model/hive.dart';
import '../../responsive.dart';
import '../desktop/desktop_adddata.dart';
import '../mobile/mobile_adddata.dart';

// const colors

const kPrimaryColor = Color.fromRGBO(242, 64, 33, 1);
const kSecondaryColor = Color.fromRGBO(32, 25, 48, 1);

const kLightColorGrey = Color.fromRGBO(125, 133, 148, 1);
const kGreen = Color.fromRGBO(14, 73, 68, 1);
const kGrey = Color.fromRGBO(125, 133, 148, 1);
const kclean = Colors.white;
const kpop = Color.fromRGBO(101, 228, 110, 1);
const kpink = Color.fromRGBO(249, 40, 78, 1);
const kpen = Color.fromRGBO(216, 246, 243, 1);

const error = "This Field Should Not Empty";
const copyright = "Copyright © Designed & Developed by Easternts ";

// Image part

const imageLogo = CircleAvatar(
  backgroundColor: kPrimaryColor,
  child: Icon(
    Icons.person,
    color: Colors.white,
  ),
);

const profile = NetworkImage(
    "https://miro.medium.com/max/554/1*Ld1KM2WSfJ9YQ4oeRf7q4Q.jpeg");

//

String? categoryDropdownValue;
String? genderDropdownValue;
List<String> categoryItem = [
  "Part Time",
  "Full Time",
  "Freelancer",
];

List<IconData> icon = [
  Icons.dashboard,
  Icons.flag,
  Icons.info,
  Icons.monitor_heart,
  Icons.star,
  Icons.health_and_safety_rounded,
  Icons.currency_yen_sharp,
  Icons.print_rounded,
  Icons.horizontal_split,
  Icons.pages_rounded
];

final List drawer = [
  "Dashboard",
  "Jobs",
  "Apps",
  "Chart",
  "Bootstrap",
  "Plugins",
  "Widget",
  "Forms",
  "Table",
  "Pages"
];

List<String> genderItem = [
  "Male",
  "Female",
];

Widget sizebox5 = const SizedBox(
  width: 5,
  height: 5,
);

Widget titel = const Text(
  "Job List",
  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
);
Widget titel2 = const Text(
  "New Job",
  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
);

Widget webtitel = const FittedBox(
  fit: BoxFit.cover,
  child:  Text(
     "Job List",
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
  ),
);
Widget webtitel2 = const FittedBox(
  fit: BoxFit.cover,
  child: Text(
    "New Job",
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
  ),
);
// controller

final scrollController = ScrollController(initialScrollOffset: 5);
final verticalscroll = ScrollController(initialScrollOffset: 5);

final scrollControllertabel = ScrollController(initialScrollOffset: 5);
ScrollController verticalcontroller = ScrollController(initialScrollOffset: 5);

DateTime postedDate = DateTime.now();
DateTime lastdate = DateTime.now();
DateTime closedate = DateTime.now();

// Navigation const

 addDetailpageRoute(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Responsive(
                context: context,
                mobile: const DataAddmobx(map: {}, isEdit: false),
                desktop: DesktopDataAdd(
                  model: Model(),
                  isEdit: false,
                ),
              )),
    );
