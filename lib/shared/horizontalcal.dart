import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      decoration: BoxDecoration(
        color: Color(0xff3D348B),
        //color: Colors.amber,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
      ),
      child: Column(
        children: [
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
                    child: Text('13 \n\nTH',
                        style: TextStyle(color: Colors.white))),
                Text('10 \n\nFR', style: TextStyle(color: Colors.white)),
                Text('11 \n\nSA', style: TextStyle(color: Colors.white)),
                Text('12 \n\nSU', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 20)
        ],
      ),
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
