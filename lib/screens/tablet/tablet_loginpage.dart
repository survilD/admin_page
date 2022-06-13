import 'package:flutter/material.dart';
import 'package:flutter_training_1/screens/mobile/mobile_home.dart';
import 'package:flutter_training_1/screens/tablet/tablet_home.dart';
import 'package:flutter_training_1/screens/utils/widgets.dart';

class TabletLoginPage extends StatefulWidget {
  const TabletLoginPage({Key? key}) : super(key: key);

  @override
  State<TabletLoginPage> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<TabletLoginPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _controllerUsername = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  void validate() {
    if (_key.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TablateHome(
                  name: _controllerUsername.text.toString(),
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: ((context, constraints) => SingleChildScrollView(
                child: Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Icon(
                          Icons.person,
                          color: Colors.red,
                          size: 120,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomWidgets.loginForm(
                            controller: _controllerUsername,
                            titel: "Enter UserName",
                            error: "Please Enter UserName"),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomWidgets.loginForm(
                            controller: _controllerPassword,
                            error: "Password Is Empty",
                            titel: "Enter Password"),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              onPressed: validate,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
