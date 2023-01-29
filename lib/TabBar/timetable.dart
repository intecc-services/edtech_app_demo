import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Timetable extends StatefulWidget {
  const Timetable({super.key});

  @override
  State<Timetable> createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 36, left: 34),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (index) {
              return reminder();
            }),
          ),
        ),
      ),
    );
  }
}

Widget reminder() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        children: [
          Icon(
            Icons.circle_outlined,
            color: Color(0xff3D348B),
            size: 12,
          ),
          //not dyn :
          Container(
            width: 1.5,
            height: 115,
            color: Color(0xff7678ED),
          ), //divider :
          // const VerticalDivider(
          //   width: 20,
          //   thickness: 1,
          //   indent: 20,
          //   endIndent: 0,
          //   color: Colors.grey,
          // ),
        ],
      ),
      SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '08:15 - 10:15',
            style: TextStyle(
              color: Color(0xff3D348B),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 19),
          reminder_widget(),
          SizedBox(height: 19),
        ],
      ),
    ],
  );
}

Widget reminder_widget() {
  return Container(
    //not dync again :
    height: 85,
    width: 275,
    decoration: BoxDecoration(
      color: Color(0xff7678ED),
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Graphics & Drawing techniques',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          Text(
            'Ranjan Kumar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          Text(
            '00222129300-12023903',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}
