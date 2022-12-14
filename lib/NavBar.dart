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
            myButton('Academic calendar', Icons.calendar_today_rounded),
            myButton('Time Table', Icons.schedule),
            myButton('Advisory Information', Icons.people),
            myButton('List of grades', Icons.grade),
            myButton('Attendance', Icons.schedule),
            myButton('Exam Calendar', Icons.edit_calendar_outlined),
            myButton('Announcements - Events', Icons.add_alert_rounded),
            myButton('Passing with QR code', Icons.qr_code),
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
    padding: const EdgeInsets.only(top: 0, left: 15),
    child: Row(
      children: [
        Icon(
          Icondata,
          color: Color(0xff3D348B),
          size: 18,
        ),
        TextButton(
          onPressed: () {},
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
