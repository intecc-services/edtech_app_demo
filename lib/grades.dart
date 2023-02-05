import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Grades extends StatelessWidget {
  const Grades({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottom_Bar(),
      backgroundColor: Color(0xff3D348B),
      body: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Icon(Icons.arrow_circle_left_rounded,
                    size: 20, color: Color(0xffFFFFFF)),
                SizedBox(width: 17),
                Text(
                  'List of Grades',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                color: Color(0xffF2F2F2),
              ),
              child: grade_widget(),
            ),
          ), //place to enter text
        ],
      ),
    );
  }
}

Widget grade_widget() {
  return Padding(
    padding: EdgeInsets.only(top: 58),
    child: SingleChildScrollView(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 34),
              child: Container(
                height: 150,
                width: 330,
                decoration: BoxDecoration(
                  color: Color(0xff7678ED),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Graphics & Drawing techniques',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          description('', 'Unit Test'),
                          description('', 'Final Grade'),
                          description('AA', 'Average'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    ),
  );
}

Widget description(String grade, String parameter) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 76,
        height: 76,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Color(0xff7678ED),
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '95',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                grade,
                style: TextStyle(
                  color: Color(0xff2EFF29),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 6),
      Text(
        parameter,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      )
    ],
  );
}
