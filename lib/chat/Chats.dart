import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bottom_bar.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3D348B),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        title: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_circle_left)),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Messages',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins'),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xffF2F2F2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CupertinoSearchTextField(
                      borderRadius: BorderRadius.circular(15),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Icon(
                      Icons.edit_outlined,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView(
                children: [
                  myTile(
                      name: 'Sarah Fischer', message: 'Presentation tomorrow'),
                  myTile(name: 'Dinesh Sharma', message: 'Doubt cleared'),
                  myTile(name: 'Alan Paul', message: 'SE assignment'),
                  myTile(
                      name: 'Rohit Erwing',
                      message: 'Submit before 20/20/2022'),
                  myTile(name: 'Samuel S. Thomas', message: 'Thank you')
                ],
              ),
            )
          ]),
        ),
      ),
      bottomNavigationBar: Bottom_Bar(), //defined in bottom_bar.dart
    );
  }
}

class myTile extends StatelessWidget {
  final String? name;
  final String? message;
  final String asset;

  myTile({this.name, this.message, this.asset = ''});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Container(
        child: ListTile(
          tileColor: Colors.white,
          leading:
              CircleAvatar(backgroundImage: AssetImage('Images/man_face.jpg')),
          title: Text('$name'),
          subtitle: Text('$message'),
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 2,
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
