import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Timetable extends StatefulWidget {
  const Timetable({Key? key});

  @override
  State<Timetable> createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: h * 0.035, left: w * 0.07),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (index) {
              return reminder(context);
            }),
          ),
        ),
      ),
    );
  }
}

Widget reminder(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        children: [
          Icon(
            Icons.circle_outlined,
            color: Color(0xff3D348B),
            size: w * 0.035,
          ),
          //not dyn :
          Container(
            width: w * 0.0035,
            height: h * 0.15,
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
      SizedBox(width: w * 0.03),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '08:15 - 10:15',
            style: TextStyle(
              color: Color(0xff3D348B),
              fontSize: w * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: h * 0.025),
          reminder_widget(context),
          SizedBox(height: h * 0.025),
        ],
      ),
    ],
  );
}

Widget reminder_widget(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  return Container(
    height: h * 0.11,
    width: w * 0.7,
    decoration: BoxDecoration(
      color: Color(0xff7678ED),
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(w * 0.03),
          bottomLeft: Radius.circular(w * 0.03),
          topLeft: Radius.circular(w * 0.03),
          topRight: Radius.circular(w * 0.03)),
    ),
    child: Padding(
      padding: EdgeInsets.all(w * 0.025),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Graphics & Drawing techniques',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: w * 0.04,
            ),
          ),
          Text(
            'Ranjan Kumar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: w * 0.035,
            ),
          ),
          Text(
            '00222129300-12023903',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: w * 0.035,
            ),
          ),
        ],
      ),
    ),
  );
}
