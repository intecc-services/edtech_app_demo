import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          //first expanded to contain circle avatar, name and button
          Expanded(flex: 3, child: Container()),
          //below coulmn contains all the text data
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Divider(
                  color: Colors.black38,
                  thickness: 1,
                ),
                textRow(category: 'Student ID', answer: '78548132'),
                Divider(
                  color: Colors.black38,
                  thickness: 1,
                ),
                textRow(category: 'Course', answer: 'B.Des'),
                Divider(
                  color: Colors.black38,
                  thickness: 1,
                ),
                textRow(category: 'Class', answer: 'Section B'),
                Divider(
                  color: Colors.black38,
                  thickness: 1,
                ),
                textRow(category: 'Mobile', answer: '9038829100'),
                Divider(
                  color: Colors.black38,
                  thickness: 1,
                ),
                textRow(category: 'E-mail', answer: 'student@school.edu'),
                Divider(
                  color: Colors.black38,
                  thickness: 1,
                ),
                textRow(
                  category: 'Blood group',
                  answer: 'O+',
                ),
                Divider(
                  color: Colors.black38,
                  thickness: 1,
                ),
              ],
            ),
          ),
        ],
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
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              answer!,
              style: TextStyle(
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
