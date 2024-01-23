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
