import 'package:edtech_app_demo/Landing_Page.dart';
import 'package:edtech_app_demo/Login.dart';
<<<<<<< HEAD
import 'package:edtech_app_demo/TabBar/root.dart';
import 'package:edtech_app_demo/attendance/teacher_attendance.dart';
=======
import 'package:edtech_app_demo/profile.dart';
>>>>>>> 37e02f3926f59aef2a1522269cacfa5c795a401d
import 'package:edtech_app_demo/theme_data.dart';
import 'package:flutter/material.dart';
import './attendance/attendance.dart';

void main() => runApp(edtech_app());

class edtech_app extends StatelessWidget {
  const edtech_app({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme,
<<<<<<< HEAD
      home: Root(),
=======
      home: LandingPage(),
>>>>>>> 37e02f3926f59aef2a1522269cacfa5c795a401d
    );
  }
}
