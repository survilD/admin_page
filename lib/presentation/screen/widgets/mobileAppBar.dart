

import 'package:flutter/material.dart';
import '../../../data/constants.dart';
import '../../responsive.dart';
import 'iconButtonCustom.dart';



class MobileAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawer;
  final bool isFirst;

  const MobileAppBar({
    Key? key,
    required this.drawer,
    required this.isFirst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AppBar(
      title: Responsive.isMobile(context)
          ? GestureDetector(
              onTap: () => drawer.currentState!.openDrawer(),
              child: Image.asset(
                "assets/Image/drawer.png",
                height: 25,
              ),
            )
          : Row(
              children: [
                FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    isFirst ? "Job List" : "New Job",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                IconButtonCustome(
                    icons: Icons.add, width: size.width * 0.6, color: kGreen),
              ],
            ),
      leadingWidth: size.width * 0.14,
      leading: Padding(
        padding: Responsive.isMobile(context)
            ? const EdgeInsets.all(10)
            : const EdgeInsets.all(4.0),
        child: imageLogo,
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
        const CircleAvatar(radius: 18, backgroundImage: profile),
        const SizedBox(
          width: 15,
        )
      ],
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
