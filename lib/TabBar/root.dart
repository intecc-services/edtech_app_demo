import 'package:edtech_app_demo/TabBar/attendance_student.dart';
import 'package:edtech_app_demo/shared/horizontalcal.dart';
import 'package:edtech_app_demo/TabBar/tasks.dart';
import 'package:edtech_app_demo/TabBar/timetable.dart';
import 'package:edtech_app_demo/attendance/attendance.dart';
import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _TimetableState();
}

class _TimetableState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFEFEF),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            _topContainer(),
            //SizedBox(height: 36),
            Expanded(
              child: TabBarView(
                children: [
                  Timetable(),
                  Tasks(),
                  Attendance_student(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottom_Bar(),
    );
  }
}

Widget _topContainer() {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xff3D348B),
      //color: Colors.amber,
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(60), bottomLeft: Radius.circular(60)),
    ),
    child: Column(
      children: [
        SizedBox(height: 50, width: double.infinity),
        TabBar(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 1.5,
              //color: Colors.black26.withOpacity(0.2),
              color: const Color(0xffEFEFEF),
            ),
            insets: EdgeInsets.only(left: 5),
          ),
          //indicatorColor: Colors.amber,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              child: Container(
                height: 20,
                alignment: Alignment.center,
                child: Text(
                  "Timetable",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                decoration: BoxDecoration(
                    color: const Color(0xffEBF3FF),
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Tab(
              child: Container(
                height: 20,
                alignment: Alignment.center,
                child: Text(
                  "Tasks",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffEBF3FF),
                  // border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Tab(
              child: Container(
                height: 20,
                alignment: Alignment.center,
                child: Text(
                  "Attendance",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                decoration: BoxDecoration(
                    color: const Color(0xffEBF3FF),
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
        Calendar(),
      ],
    ),
  );
}
