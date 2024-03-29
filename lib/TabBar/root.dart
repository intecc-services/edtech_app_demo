import 'package:edtech_app_demo/TabBar/attendance_student.dart';
import 'package:edtech_app_demo/TabBar/tasks.dart';
import 'package:edtech_app_demo/TabBar/timetable.dart';
import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:edtech_app_demo/shared/horizontalcal.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({Key? key});

  @override
  State<Root> createState() => _TimetableState();
}

class _TimetableState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Timetable'),
      ),
      backgroundColor: const Color(0xffEFEFEF),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            _topContainer(context),
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

Widget _topContainer(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  return Container(
    decoration: BoxDecoration(
      color: Color(0xff3D348B),
      //color: Colors.amber,
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(w * 0.2),
          bottomLeft: Radius.circular(w * 0.2)),
    ),
    child: Column(
      children: [
        SizedBox(height: h * 0.025, width: double.infinity),
        TabBar(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 1.5,
              //color: Colors.black26.withOpacity(0.2),
              color: const Color(0xffEFEFEF),
            ),
            insets: EdgeInsets.only(left: w * 0.01),
          ),
          //indicatorColor: Colors.amber,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              child: Container(
                height: h * 0.03,
                alignment: Alignment.center,
                child: Text(
                  "Timetable",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: w * 0.04,
                  ),
                ),
                decoration: BoxDecoration(
                    color: const Color(0xffEBF3FF),
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(w * 0.03)),
              ),
            ),
            Tab(
              child: Container(
                height: h * 0.03,
                alignment: Alignment.center,
                child: Text(
                  "Tasks",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: w * 0.04,
                  ),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffEBF3FF),
                  // border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(w * 0.03),
                ),
              ),
            ),
            Tab(
              child: Container(
                height: h * 0.03,
                alignment: Alignment.center,
                child: Text(
                  "Attendance",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: w * 0.04,
                  ),
                ),
                decoration: BoxDecoration(
                    color: const Color(0xffEBF3FF),
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(w * 0.03)),
              ),
            ),
          ],
        ),
        Calendar(),
      ],
    ),
  );
}
