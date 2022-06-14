import 'package:flutter/material.dart';

// const colors

const kPrimaryColor = Color.fromRGBO(242, 64, 33, 1);
const kSecondaryColor = Color.fromRGBO(32, 25, 48, 1);

const kLightColorGrey = Color.fromRGBO(125, 133, 148, 1);
const kGreen = Color.fromRGBO(14, 73, 68, 1);
const kGrey = Color.fromRGBO(125, 133, 148, 1);
const kclean = Colors.white;
const kpop = Color.fromRGBO(101, 228, 110, 1);
const kpink = Color.fromRGBO(249, 40, 78, 1);
const kpen = Color.fromRGBO(216, 246, 243, 1);

// Image part

const imageLogo = CircleAvatar(
  backgroundColor: kPrimaryColor,
  child: Icon(
    Icons.person,
    color: Colors.white,
  ),
);

const profile = NetworkImage(
    "https://miro.medium.com/max/554/1*Ld1KM2WSfJ9YQ4oeRf7q4Q.jpeg");
