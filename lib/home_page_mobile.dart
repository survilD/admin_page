import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_1/mobile_home.dart';
import 'package:form_field_validator/form_field_validator.dart';

class MobileLogin extends StatefulWidget {
  const MobileLogin({Key? key}) : super(key: key);

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _controllerUsername = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      SizedBox(
                        height: 30,
                      ),
                      Icon(
                        Icons.person,
                        color: Colors.red,
                        size: 120,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Card(
                        margin: EdgeInsets.all(10),
                        color: Colors.grey[300],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
                            controller: _controllerUsername,
                            cursorHeight: 20,
                            cursorColor: Colors.grey,
                            validator: RequiredValidator(
                                errorText: "Please Enter Username"),
                            decoration: InputDecoration(
                                labelText: "Enter Username",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                                fillColor: Colors.grey),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(10),
                        color: Colors.grey[300],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
                            validator: RequiredValidator(
                                errorText: "Password Is Empty"),
                            cursorHeight: 20,
                            controller: _controllerPassword,
                            cursorColor: Colors.grey,
                            decoration: const InputDecoration(
                                labelText: "Enter Password",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                                fillColor: Colors.grey),
                          ),
                        ),
                      ),
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
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                print("done");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MobileHome(
                                            name: _controllerUsername.text
                                                .toString(),
                                          )),
                                );
                              }
                            },
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
    );
  }
}
