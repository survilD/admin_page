


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/constants.dart';


class AddButton extends StatelessWidget {
  final void Function()? onPressed;
  const AddButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: const FittedBox(
        child: Text(
          '+ Add New Job',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      onPressed: onPressed,
      color: kPrimaryColor,
      borderRadius: BorderRadius.circular(20),
      padding: const EdgeInsets.all(10),
    );
  }
}
