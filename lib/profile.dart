import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Profile',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        children: [
          //first expanded to contain circle avatar, name and button
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('Images/man_face.jpg'),
                  radius: 60,
                ),
                Text(
                  'Geoffrey Moss',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff7678ED)),
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                    child: Text(
                      'Edit profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          //
          //below coulmn is for displaying student data
          //
          Expanded(
            flex: 6,
            child: Column(
              //Both div and textRow are defined below.
              children: [
                Div(),
                textRow(category: 'Student ID', answer: '78548132'),
                Div(),
                textRow(category: 'Course', answer: 'B.Des'),
                Div(),
                textRow(category: 'Class', answer: 'Section B'),
                Div(),
                textRow(category: 'Mobile', answer: '9038829100'),
                Div(),
                textRow(category: 'E-mail', answer: 'student@school.edu'),
                Div(),
                textRow(
                  category: 'Blood group',
                  answer: 'O+',
                ),
                Div(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        color: Color(0xff3D348B),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home_outlined),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.chat_bubble_outline_rounded),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.calendar_today),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_outlined),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class textRow extends StatelessWidget {
  textRow({this.category, this.answer});
  final String? category;
  final String? answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: Text(
              category!,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              answer!,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget Div() {
  return const Divider(
    color: Colors.black12,
    thickness: 1,
  );
}
