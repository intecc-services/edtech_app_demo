import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Attendance_student extends StatefulWidget {
  const Attendance_student({super.key});

  @override
  State<Attendance_student> createState() => _TimetableState();
}

class _TimetableState extends State<Attendance_student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFEFEF),
      body: Center(
          child: Text('Attendance',
              style: TextStyle(fontSize: 30, color: Colors.black))),
      //bottomNavigationBar: Bottom_Bar(),
    );
  }
}
