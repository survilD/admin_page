



import 'package:flutter/material.dart';
import '../../../data/constants.dart';
import 'iconButtonCustom.dart';



class DesktopAppBar extends StatelessWidget {
  final bool isFirst;
  const DesktopAppBar({
    Key? key,
    required this.isFirst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size.fromHeight(size.height * 0.14),
      child: Container(
          color: Colors.white,
          height: size.height,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CircleAvatar(
                          radius: size.width * 0.02,
                          backgroundColor: kPrimaryColor,
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jobick",
                              style: TextStyle(
                                  fontSize: size.width * 0.019,
                                  fontWeight: FontWeight.bold),
                            ),
                            FittedBox(
                              child: Text(
                                "Job Admin Dashboard",
                                style: TextStyle(
                                    fontSize: size.width * 0.01, color: kGrey),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              Expanded(
                flex: 6,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "assets/Image/drawer.png",
                      height: 40,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    isFirst ? webtitel : webtitel2,
                    SizedBox(
                      width: size.width * 0.07,
                    ),
                    FittedBox(
                      child: SizedBox(
                        width: size.width * 0.18,
                        child: TextField(
                          cursorHeight: 20,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.search,
                              size: 35,
                              color: Colors.black,
                            ),
                            hintStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                            filled: true,
                            fillColor: kGrey.withAlpha(30),
                            contentPadding: const EdgeInsets.all(15),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: kGrey.withAlpha(30))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: kGrey.withAlpha(30))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButtonCustome(
                        icons: Icons.add,
                        width: size.width * 0.5,
                        color: kGreen),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              iconSize: 30,
                              icon: const Icon(Icons.chat_outlined),
                              onPressed: () {},
                            ),
                            IconButton(
                              iconSize: 30,
                              icon: const Icon(
                                Icons.notifications_none_outlined,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              iconSize: 30,
                              icon: const Icon(Icons.settings_outlined),
                              onPressed: () {},
                            ),
                            CircleAvatar(
                              radius: size.width * 0.03,
                              backgroundImage: profile,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
