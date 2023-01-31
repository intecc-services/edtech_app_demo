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
            'Graphics & Drawing techniques',
            style: TextStyle(
              color: Color(0xff3D348B),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 19),
          Row(
            children: [
              reminder_widget(
                  Color(0xffD6EECB), "0 days Left", Color(0xff2EFF29)),
              SizedBox(width: 35),
              reminder_widget(Color.fromARGB(255, 255, 215, 181), "3 days Left",
                  Color.fromARGB(255, 255, 69, 69)),
            ],
          ),
          SizedBox(height: 19),
        ],
      ),
    ],
  );
}

Widget reminder_widget(Color clr, String deadline, Color active) {
  return Container(
    //not dync again :
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      color: clr,
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
            'Deadline',
            style: TextStyle(
              color: Color(0xff767676),
              fontWeight: FontWeight.w400,
              fontSize: 9,
            ),
          ),
          Row(
            children: [
              Icon(Icons.circle, color: active, size: 4),
              SizedBox(width: 3),
              Text(
                deadline,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff656565)),
              )
            ],
          ),
          Text(
            'Orthographic projections of a plain',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    ),
  );
}
