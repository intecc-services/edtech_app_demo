import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TimetableState();
}

class _TimetableState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFEFEF),
      body: Center(
          child: Text('Tasks',
              style: TextStyle(fontSize: 30, color: Colors.black))),
      //bottomNavigationBar: Bottom_Bar(),
    );
  }
}
