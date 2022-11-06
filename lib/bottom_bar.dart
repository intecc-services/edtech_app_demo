import 'package:flutter/material.dart';

class Bottom_Bar extends StatelessWidget {
  const Bottom_Bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF2F2F2),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        decoration: BoxDecoration(
            color: Color(0xff3D348B),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
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
