import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'calendar_items.dart';

class Calendar extends StatefulWidget {
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left,
                        color: Colors.white,
                        size: 30,
                      )),
                  Text(
                    'Calendar',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(children: <Widget>[
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
      placeholderStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w400, fontSize: 16, color: Colors.grey),
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        decoration: const BoxDecoration(
          color: Color(0xffEFEFEF),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Academic Calendar',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Exam Calendar',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.grey),
                    )),
              ]),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  'September',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Color(0xffF35B04)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.08,
                  ),
                  Image.asset(
                    "Images/Calendar.png",
                    width: width * 0.84,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(titles.length, (index) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0, bottom: 20),
                        child: Container(
                          height: height * 0.09,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xff7678ED)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 10, top: 10, bottom: 14),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      dates[index]['date'],
                                      style: GoogleFonts.inter(
                                          fontSize: width * 0.065,
                                          color: Colors.white.withOpacity(0.9),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Oct",
                                      style: GoogleFonts.inter(
                                          fontSize: width * 0.03,
                                          color: Color(0xff3D348B),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const VerticalDivider(
                                  width: 20,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                  color: Color(0xff3D348B),
                                ),
                                Text(
                                  titles[index]['title'],
                                  style: GoogleFonts.inter(
                                      fontSize: width * 0.032,
                                      color: Colors.white.withOpacity(0.9),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
