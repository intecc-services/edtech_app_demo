import 'package:edtech_app_demo/Login.dart';
import 'package:edtech_app_demo/TabBar/root.dart';
import 'package:edtech_app_demo/attendance/teacher_attendance.dart';
import 'package:edtech_app_demo/theme_data.dart';
import 'package:flutter/material.dart';

void main() => runApp(edtech_app());

class edtech_app extends StatelessWidget {
  const edtech_app({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme,
      home: Root(),
    );
  }
}
