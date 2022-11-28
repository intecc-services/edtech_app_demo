import 'package:edtech_app_demo/Events/event_home.dart';
import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/material.dart';

class TeacherAttendance extends StatefulWidget {
  @override
  State<TeacherAttendance> createState() => _TeacherAttendanceState();
}

class _TeacherAttendanceState extends State<TeacherAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFEFEF),
      body: Column(
        children: [
          _topContainer(),
          SizedBox(height: 10),
          OverlappedSearchBar(),
          SizedBox(height: 10),
          _body(),
        ],
      ),
      bottomNavigationBar: Bottom_Bar(),
    );
  }
}

Widget TopButton(String month) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          )),
      Text(
        month,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Colors.white,
          ))
    ],
  );
}

Widget _topContainer() {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xff3D348B),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))),
    child: Column(children: [
      SizedBox(height: 50, width: double.infinity),
      Text(
        'Attendance',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: TopButton('October')),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('10 \n\nMO', style: TextStyle(color: Colors.white)),
            Text('11 \n\nTU', style: TextStyle(color: Colors.white)),
            Text('12 \n\nWe', style: TextStyle(color: Colors.white)),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xff7678ED)),
                child:
                    Text('13 \n\nTH', style: TextStyle(color: Colors.white))),
            Text('10 \n\nFR', style: TextStyle(color: Colors.white)),
            Text('11 \n\nSA', style: TextStyle(color: Colors.white)),
            Text('12 \n\nSU', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      SizedBox(height: 20)
    ]),
  );
}

class _body extends StatefulWidget {
  const _body({Key? key}) : super(key: key);

  @override
  State<_body> createState() => _bodyState();
}

class _bodyState extends State<_body> {
  bool section = true;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: DropdownButton(
                borderRadius: BorderRadius.circular(10),
                style: TextStyle(
                    color: Color(0xff3D348B),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
                focusColor: Colors.white,
                value: section ? 'A' : 'B',
                items: [
                  DropdownMenuItem(
                      child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text('Section A')),
                      value: 'A'),
                  DropdownMenuItem(
                      child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text('Section B')),
                      value: 'B')
                ],
                onChanged: (e) => {
                  setState(() {
                    section = !section;
                  })
                },
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey, thickness: 1),
            details(No: 'No.', Name: 'Name', a: false),
            details(No: '01', Name: 'Rahul Srivastav'),
            details(No: '02', Name: 'Charles Gorden'),
            details(No: '03', Name: 'Divya Kumar'),
            details(No: '04', Name: 'Eric Hart'),
            details(No: '05', Name: 'Himesh Rishu'),
            details(No: '06', Name: 'Kamal R.'),
            details(No: '07', Name: 'Mohan Sharma')
          ],
        ),
      ),
    );
  }
}

class details extends StatefulWidget {
  final String Name;
  final String No;
  final bool a;
  bool present = true;
  details({required this.No, required this.Name, this.a = true});
  @override
  State<details> createState() => detailsState();
}

class detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    Widget field1 = IconButton(
        onPressed: () {
          setState(() {
            widget.present = true;
          });
        },
        icon: widget.present
            ? Icon(Icons.check_circle_outline, color: Color(0xff3D348B))
            : Icon(Icons.circle_outlined, color: Color(0xff7678ED)));
    Widget field2 = IconButton(
        onPressed: () {
          setState(() {
            widget.present = false;
          });
        },
        icon: !widget.present
            ? Icon(Icons.check_circle_outline, color: Color(0xff3D348B))
            : Icon(Icons.circle_outlined, color: Color(0xff7678ED)));
    if (!widget.a) {
      field1 = Text('Present',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xff3D348B)));
      field2 = Text('Absent',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xff3D348B)));
    }
    ;
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child:
                  Text(widget.No, style: TextStyle(color: Color(0xff3D348B)))),
          Expanded(
              flex: 5,
              child: Text(widget.Name,
                  style: TextStyle(color: Color(0xff3D348B)))),
          Expanded(flex: 2, child: field1),
          Expanded(flex: 2, child: field2),
        ],
      ),
    );
  }
}
