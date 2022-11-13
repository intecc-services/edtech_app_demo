import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Conversation extends StatefulWidget {
  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            // top profile and name
            padding: const EdgeInsets.all(15),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 35,
                ),
                SizedBox(height: 10),
                Text(
                  'George Hawkings',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Expanded(
            //chat section
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                color: Color(0xffF2F2F2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ChatBubble(1, 'Hello sir, I have a doubt', '4:00 pm'),
                  ChatBubble(
                      0,
                      'Yes Rohan, let me know what topic you have a dount in ',
                      '4:15 pm'),
                ],
              ),
            ),
          ),
          inputField(), //place to enter text
        ],
      ),
    );
  }
}

class inputField extends StatefulWidget {
  @override
  State<inputField> createState() => _inputField();
}

class _inputField extends State<inputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          child: Container(
            color: Colors.grey[300],
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: CupertinoTextField(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              placeholder: 'Message...',
              decoration: BoxDecoration(
                  color: Color(0xff7678ED),
                  borderRadius: BorderRadius.circular(20)),
              placeholderStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 14),
            ),
          ),
        )
      ],
    );
  }
}

Widget ChatBubble(int side, String text, time) {
  return Row(
    mainAxisAlignment:
        side == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 10, left: 10),
        child: Column(
          crossAxisAlignment:
              side == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: side == 0
                  ? BoxDecoration(
                      color: Color(0xff3D348B),
                      borderRadius: BorderRadius.circular(30))
                  : BoxDecoration(
                      color: Color(0xff7678ED),
                      borderRadius: BorderRadius.circular(30)),
              child: Text(text,
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: Text(
                time,
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            )
          ],
        ),
      )
    ],
  );
}
