import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: Column(
        children: [
          //The top part that contains attendance and the below button
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Color(0xff3D348B)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Attendance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: TopButton('Sem-1'),
                  )
                ],
              ),
            ),
          ),
          //Body section that contains subjects and marks
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 35),
              child: ListView(
                children: [
                  Text(
                    'Subjects',
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.w300),
                  ),
                  AttendanceBox(
                      'Graphic Design & Drawing techniques', '8/10', '80%'),
                  AttendanceBox('Visual Art & Art appreciation Techniques',
                      '10/10', '100%'),
                  AttendanceBox('Social Studies', '4/5', '80%'),
                  AttendanceBox(
                      'Object Oriented Programming using Java', '12/12', '100%')
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Bottom_Bar(),
    );
  }
}

Widget TopButton(String sem) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            size: 15,
            color: Color(0xff3D348B),
          )),
      Text(
        sem,
        style: TextStyle(
            color: Color(0xff3D348B),
            fontWeight: FontWeight.w900,
            fontSize: 18),
      ),
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Color(0xff3D348B),
          ))
    ],
  );
}

Widget AttendanceBox(String subject, String ratio, String percentage) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject,
                style: TextStyle(
                    color: Color(0xff3D348B),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(height: 10),
              Text(
                ratio,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color(0xff7678ED),
            shape: BoxShape.circle,
          ),
          child: Text(
            percentage,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ),
  );
}
