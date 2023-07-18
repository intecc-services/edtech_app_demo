import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        backgroundColor: Color(0xffF2F2F2),
        child: ListView(
          children: [
            TopInfo(),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/Calendar');
                },
                child: myButton(
                    'Academic calendar', Icons.calendar_today_rounded)),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/TabBar');
                },
                child: myButton('Time Table', Icons.schedule)),
            myButton('Advisory Information', Icons.people),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/Grades');
                },
                child: myButton('List of grades', Icons.grade)),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/StudentAttendance');
                },
                child: myButton('Attendance', Icons.schedule)),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/Calendar');
                },
                child: myButton('Exam Calendar', Icons.edit_calendar_outlined)),
            myButton('Announcements - Events', Icons.add_alert_rounded),
            myButton('Passing with QR code', Icons.qr_code),
            GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: myButton('Sign out', Icons.logout)),
          ],
        ),
      ),
    );
  }
}

class TopInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xff3D348B),
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 40, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('Images/man_face.jpg'),
              ),
              SizedBox(height: 10),
              Text(
                'Geoffrey Moss',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'B.DES',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
              ),
              Text(
                'Id: 4588971',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget myButton(String ButtonName, IconData Icondata) {
  return Padding(
    padding: const EdgeInsets.only(top: 30, left: 15),
    child: Row(
      children: [
        Icon(
          Icondata,
          color: Color(0xff3D348B),
          size: 18,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            ButtonName,
            style: const TextStyle(
                color: Color(0xff3D348B),
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        ),
      ],
    ),
  );
}
