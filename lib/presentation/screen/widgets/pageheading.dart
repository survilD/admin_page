

import 'package:flutter/material.dart';


import '../../../data/constants.dart';
import '../../responsive.dart';
import 'addButon.dart';
import 'iconButtonCustom.dart';

class PageHeading extends StatelessWidget {
  final bool isFirst;
  final void Function()? onPressed;
  const PageHeading({
    Key? key,
    required this.isFirst,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isFirst ? titel : titel2,
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              isFirst
                  ? SizedBox(
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.1
                          : Responsive.isMobile(context)
                              ? size.width * 0.3
                              : size.width * 0.14,
                      child: AddButton(
                        onPressed: onPressed,
                      ))
                  : sizebox5,
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  child: IconButtonCustome(
                      icons: Icons.mail,
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.4
                          : Responsive.isMobile(context)
                              ? size.width * 1
                              : size.width * 0.6,
                      color: kGreen)),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  child: IconButtonCustome(
                      icons: Icons.call,
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.4
                          : Responsive.isMobile(context)
                              ? size.width * 1
                              : size.width * 0.6,
                      color: kGreen)),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  child: IconButtonCustome(
                      icons: Icons.info,
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.4
                          : Responsive.isMobile(context)
                              ? size.width * 1
                              : size.width * 0.6,
                      color: isFirst ? kGreen : kPrimaryColor))
            ],
          ),
        )
      ],
    );
  }
}
