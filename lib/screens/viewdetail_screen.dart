import 'package:flutter/material.dart';

class ViweDetailScreen extends StatefulWidget {
  ViweDetailScreen({Key? key, required Map map}) : super(key: key);

  Map? map;

  @override
  State<ViweDetailScreen> createState() => _ViweDetailScreenState();
}

class _ViweDetailScreenState extends State<ViweDetailScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.map == null);
    Map? map = widget.map;

    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: SizedBox(
          width: size.width * 0.9,
          height: size.height * 0.9,
          child: (map != null)
              ? Column(
                  children: [Text(map.keys.toList()[0])],
                )
              : Center(child: CircularProgressIndicator())),
    );
  }
}
