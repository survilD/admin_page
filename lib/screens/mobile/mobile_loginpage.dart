// import 'package:flutter/material.dart';
// import 'package:flutter_training_1/screens/mobile/mobile_home.dart';
// import 'package:flutter_training_1/screens/utils/widgets.dart';

// class MobileLogin extends StatefulWidget {
//   MobileLogin({Key? key, required this.constraints}) : super(key: key);
//   final BoxConstraints constraints;

//   @override
//   State<MobileLogin> createState() => _MobileLoginState();
// }

// class _MobileLoginState extends State<MobileLogin> {
//   final GlobalKey<FormState> _key = GlobalKey<FormState>();

//   final TextEditingController _controllerUsername = TextEditingController();

//   final TextEditingController _controllerPassword = TextEditingController();

//   validate(BoxConstraints constraints) {
//     if (_key.currentState!.validate()) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => MobileHome(
               
//                   name: _controllerUsername.text.toString(),
//                 )),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final BoxConstraints constraints = widget.constraints;
//     return SafeArea(
//       child: Scaffold(
//           body: SingleChildScrollView(
//         child: Form(
//           key: _key,
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               children: [
//                 Text(
//                   "Welcome Back",
//                   style: TextStyle(
//                       color: Colors.grey[800],
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 const Icon(
//                   Icons.person,
//                   color: Colors.red,
//                   size: 120,
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 CustomWidgets.loginForm(
//                     controller: _controllerUsername,
//                     titel: "Enter UserName",
//                     error: "Please Enter UserName"),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 CustomWidgets.loginForm(
//                     controller: _controllerPassword,
//                     error: "Password Is Empty",
//                     titel: "Enter Password"),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 SizedBox(
//                     width: 200,
//                     height: 50,
//                     child: ElevatedButton(
//                       child: const Text(
//                         "Submit",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       onPressed: validate(constraints),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.red,
//                       ),
//                     ))
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }
