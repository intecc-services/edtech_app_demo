import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventsHome extends StatefulWidget {
  @override
  State<EventsHome> createState() => _EventsHomeState();
}

class _EventsHomeState extends State<EventsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_circle_left,
                        color: Colors.white,
                        size: 30,
                      )),
                  const Text(
                    'Events',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(children: [
                bodyContainer(),
                OverlappedSearchBar(),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottom_Bar(),
    );
  }
}

Widget OverlappedSearchBar() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
    child: CupertinoSearchTextField(
      placeholder: 'Search',
      placeholderStyle: TextStyle(color: Colors.grey),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 2,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}

class bodyContainer extends StatefulWidget {
  @override
  State<bodyContainer> createState() => _bodyContainerState();
}

class _bodyContainerState extends State<bodyContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        decoration: const BoxDecoration(
          color: Color(0xffEFEFEF),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        ),
        child: ListView(children: [
          SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Events',
                  style: TextStyle(color: Colors.grey),
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Reports',
                  style: TextStyle(color: Colors.grey),
                )),
          ]),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(height: 10),
          EventDay(date: "23 October, 2022", events: [
            ['B.Des Sem 1 ISA', '10:00am - 12:00pm', 'Room no:D-201'],
            ['Cultural Day Program', '2:00pm - 4:00pm', 'Auditorium'],
            ['Class 10 - SpellBee', '10:00am - 11:30am', 'Hall-21B']
          ]),
          SizedBox(height: 10),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          EventDay(date: "24 October, 2022", events: [
            ['BBA Sem 1 ISA', '10:00am - 12:00pm', 'Room no:D-201'],
            ['Sport Day (class 1-10)', '2:00pm - 4:00pm', 'Cricket ground'],
            ['Guest lecture', '10:00am - 11:30am', 'Auditorium']
          ])
        ]),
      ),
    );
  }
}

class EventDay extends StatefulWidget {
  final String date;
  final List<List<String>> events;
  EventDay({required this.date, required this.events});
  @override
  State<EventDay> createState() => _EventDayState();
}

class _EventDayState extends State<EventDay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text('Events on ${widget.date}',
                  style: const TextStyle(
                      color: Colors.deepOrange, fontWeight: FontWeight.bold))),
          eventTile(
              widget.events[0][0], widget.events[0][1], widget.events[0][2]),
          eventTile(
              widget.events[1][0], widget.events[1][1], widget.events[1][2]),
          eventTile(
              widget.events[2][0], widget.events[2][1], widget.events[2][2]),
        ],
      ),
    );
  }
}

Widget eventTile(String eventName, String timing, String location) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.white),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eventName,
            style: const TextStyle(
                fontSize: 15,
                color: Color(0xff3D348B),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.access_time_outlined,
                  size: 10, color: Color(0xff3D348B)),
              Text(
                timing,
                style: TextStyle(color: Color(0xff7678ED), fontSize: 10),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.location_on_outlined,
                  size: 10, color: Color(0xff3D348B)),
              Text(
                location,
                style: TextStyle(color: Color(0xff7678ED), fontSize: 10),
              )
            ],
          )
        ],
      ),
    ),
  );
}
