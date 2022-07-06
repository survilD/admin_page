
import 'package:flutter/material.dart';

import '../../../data/constants.dart';


class CustomeFlotButton extends StatelessWidget {
  final bool isFirst;
  const CustomeFlotButton({Key? key, required this.isFirst}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
            visible: isFirst,
            child: FloatingActionButton.small(
              heroTag: null,
              backgroundColor: kPrimaryColor.withAlpha(202),
              onPressed: () {},
              child: const Icon(Icons.next_plan_sharp),
            )),
        sizebox5,
        FloatingActionButton.small(
          heroTag: null,
          backgroundColor: const Color.fromRGBO(28, 202, 210, 1),
          onPressed: () {},
          child: const Icon(Icons.headset_mic_outlined),
        ),
        sizebox5,
        FloatingActionButton.small(
          heroTag: null,
          backgroundColor: const Color.fromRGBO(144, 194, 94, 1),
          onPressed: () {},
          child: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }
}
