import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String uId = '';
Color defaultColor = Colors.green;
List<BottomNavigationBarItem> bottomNavigationBarItems = const [
  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house), label: 'home'),
  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.message), label: 'Chats'),
  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.circlePlus), label: 'post'),
  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user), label: 'Users'),
  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.gear), label: 'Settings'),
  
];
const TextStyle style18 =  TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
);
const TextStyle style22 =  TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w500,
);

const TextStyle style16 =  TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);
const TextStyle style14 =  TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
);
TextStyle? style12 =
    const TextStyle(fontSize: 12, color: Color.fromARGB(255, 97, 96, 96));
const double chatRadiusCirculer=12.0;