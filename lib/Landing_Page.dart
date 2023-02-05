import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;
    final Color background = Color(0xff3D348B);
    final Color fill = Colors.white;
    final List<Color> gradient = [
      background,
      background,
      fill,
      fill,
    ];
    final double fillPercent = 60.23; // fills 60.23% for container from bottom
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('hh:mm \n \ta').format(now);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 90,
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 40,
                      )
                    ],
                  ),
                ),
                Image.asset("Images/Cap.png"),
                SizedBox(
                  height: height1 * 0.018,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 37, bottom: 47),
                  child: Row(
                    children: [
                      Text(
                        "Today's Classes",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height1 * 0.7,
                  width: width1 * 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(34.0),
                        topRight: Radius.circular(34.0),
                      ),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height1 * 0.09,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, top: 5.0),
                        child: Row(
                          children: [
                            Text(
                              "Announcements",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: width1 * 0.015,
                            ),
                            Text(
                              "(3)",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height1 * 0.02,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Row(
                            children: List.generate(3, (index) {
                              return Card(
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  width: 282,
                                  height: 125,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      colors: gradient,
                                      stops: stops,
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.topCenter,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12.0, right: 8.0, top: 15.0),
                                        child: Text(
                                          "B.DES Sem-1 ISA 1 - Design Fundamentals",
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height1 * 0.025,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_month_outlined,
                                              color: Color(0xff7678ED),
                                              size: 18,
                                            ),
                                            SizedBox(
                                              width: width1 * 0.01,
                                            ),
                                            Text(
                                              DateFormat('dd-MM-yyyy')
                                                  .format(now),
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: Color(0xff7678ED)),
                                            ),
                                            SizedBox(
                                              width: width1 * 0.02,
                                            ),
                                            Text(
                                              DateFormat('EEEE').format(now),
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: Color(0xff7678ED)),
                                            ),
                                            SizedBox(
                                              width: width1 * 0.06,
                                            ),
                                            Icon(
                                              Icons.location_pin,
                                              color: Color(0xff7678ED),
                                              size: 18,
                                            ),
                                            SizedBox(
                                              width: width1 * 0.02,
                                            ),
                                            Text(
                                              "D-201",
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: Color(0xff7678ED)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 7.0, top: 4),
                                            child: Icon(
                                              Icons.access_alarms,
                                              color: Color(0xff7678ED),
                                              size: 18,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4.0),
                                            child: Text(
                                              "10:00am-12:00pm",
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: Color(0xff7678ED)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height1 * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, top: 5.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Card(
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  width: width1 * 0.45,
                                  height: 246,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:
                                          Color(0xff7678ED).withOpacity(0.3)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("Images/CalendarCheck.png"),
                                      Text(
                                        "Assignments",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: Color(0xff3D348B),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width1 * 0.03,
                              ),
                              Column(
                                children: [
                                  Card(
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Container(
                                      width: 159,
                                      height: 115,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xff7678ED)
                                              .withOpacity(0.3)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset("Images/attend.png"),
                                          Text(
                                            "Attendance",
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Color(0xff3D348B),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Card(
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Container(
                                      width: 159,
                                      height: 115,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xff7678ED)
                                              .withOpacity(0.3)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset("Images/Notebook.png"),
                                          Text(
                                            "Materials",
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Color(0xff3D348B),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 350,
              left: 30,
              child: Container(
                height: height1 * 0.12,
                width: width1 * 0.9,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Color(0xff7678ED),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          formattedDate,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        const VerticalDivider(
                          width: 20,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  Text(
                                    "Graphics And Drawing Techniques",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width1 * 0.034,
                                        color: Colors.white),
                                  )
                                ],
                                // child: Text(
                                //   "Graphics And Drawing Techniques",
                                //   style: GoogleFonts.inter(
                                //       fontWeight: FontWeight.w600,
                                //       fontSize: 16,
                                //       color: Colors.white),
                                // ),
                              ),
                              SizedBox(
                                height: height1 * 0.015,
                              ),
                              Text(
                                "RAJAN KUMAR",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: height1 * 0.008,
                              ),
                              Text(
                                "00222129300-12023903",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottom_Bar(),
    );
  }
}
