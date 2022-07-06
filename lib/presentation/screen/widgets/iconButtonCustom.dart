

import 'package:flutter/material.dart';

import '../../../data/constants.dart';


class IconButtonCustome extends StatelessWidget {
  final IconData icons;
  final Color color;
  final double width;
  const IconButtonCustome(
      {Key? key, required this.icons, required this.color, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        radius: width * 0.04,
        backgroundColor: kGreen,
        child: Icon(
          icons,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
