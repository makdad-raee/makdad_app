import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String uId = '';
Color defaultColor = Colors.green;
List<BottomNavigationBarItem> bottomNavigationBarItems = const [
  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house), label: 'home'),
  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.message), label: 'Chats'),
  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user), label: 'Users'),
  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.gear), label: 'Settings'),
];
TextStyle? style18 =const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,);

TextStyle? style16 =const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,);
TextStyle? style14 =const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,);
TextStyle? style12 =const TextStyle(fontSize: 12,color: Color.fromARGB(255, 97, 96, 96));