import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key});

  @override
  State<Tasks> createState() => _TimetableState();
}

class _TimetableState extends State<Tasks> {
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
            height: h * 0.161,
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
            'Graphics & Drawing techniques',
            style: TextStyle(
              color: Color(0xff3D348B),
              fontSize: w * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: h * 0.025),
          Row(
            children: [
              reminder_widget(
                  Color(0xffD6EECB), "0 days Left", Color(0xff2EFF29), context),
              SizedBox(width: w * 0.035),
              reminder_widget(Color.fromARGB(255, 255, 215, 181), "3 days Left",
                  Color.fromARGB(255, 255, 69, 69), context),
            ],
          ),
          SizedBox(height: h * 0.025),
        ],
      ),
    ],
  );
}

Widget reminder_widget(
    Color clr, String deadline, Color active, BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  return Container(
    height: h * 0.13,
    width: w * 0.3,
    decoration: BoxDecoration(
      color: clr,
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(w * 0.03),
          bottomLeft: Radius.circular(w * 0.03),
          topLeft: Radius.circular(w * 0.03),
          topRight: Radius.circular(w * 0.03)),
    ),
    child: Padding(
      padding: EdgeInsets.all(w * 0.035),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deadline',
            style: TextStyle(
              color: Color(0xff767676),
              fontWeight: FontWeight.w400,
              fontSize: w * 0.026,
            ),
          ),
          Row(
            children: [
              Icon(Icons.circle, color: active, size: w * 0.015),
              SizedBox(width: w * 0.015),
              Text(
                deadline,
                style: TextStyle(
                    fontSize: w * 0.03,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff656565)),
              )
            ],
          ),
          Text(
            'Orthographic projections of a plain',
            style: TextStyle(
              fontSize: w * 0.031,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    ),
  );
}
