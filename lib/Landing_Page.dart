import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';
import './fetched_items/assignment.dart';
// import './UploadDialog.dart';
import 'package:edtech_app_demo/shared/NavBar.dart';
import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:edtech_app_demo/Calendar/Calendar.dart';
import 'package:edtech_app_demo/Landing_Page.dart';
import 'package:edtech_app_demo/TabBar/root.dart';
import 'package:edtech_app_demo/attendance/attendance.dart';
import 'package:edtech_app_demo/chat/Chats.dart';
import 'package:edtech_app_demo/grades.dart';
import 'package:edtech_app_demo/profile.dart';
import 'package:edtech_app_demo/shared/theme_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'authentication/Login.dart';
import 'api/firebase_api.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  @override
  State<LandingPage> createState() => _LandingPageState();
}

String fileName = '';

class _LandingPageState extends State<LandingPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
//Function to upload assignment
  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 1,
                          controller: _textEditingController1,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Please enter assignment name";
                          },
                          decoration:
                              InputDecoration(hintText: "Assignment name"),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 1,
                          controller: _textEditingController2,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Please enter the topic";
                          },
                          decoration:
                              InputDecoration(hintText: "Assignment Topic"),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 1,
                          controller: _textEditingController3,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Please enter assigner's name";
                          },
                          decoration:
                              InputDecoration(hintText: "Assigner's name"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: selectFile,
                          child: Text("Select File"),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff7678ED),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          fileName,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ready to Upload?"),
                            Checkbox(
                                value: isChecked,
                                onChanged: (checked) {
                                  setState(() {
                                    isChecked = checked!;
                                  });
                                })
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          onPressed: uploadFile,
                          child: Text(
                            "Upload",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            primary: Colors.white.withOpacity(0.87),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        uploadTask != null
                            ? buildUploadStatus(uploadTask!)
                            : Container(),
                      ],
                    )),
              ),
              title: Row(
                children: [
                  Text('Assignment Upload'),
                  SizedBox(
                    width: 6,
                  ),
                  IconButton(
                      onPressed: () {
                        // Do something like updating SharedPreferences or User Settings etc.
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close)),
                ],
              ),
              actions: <Widget>[
                InkWell(
                  child: Text('OK   '),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  PlatformFile? pickedfile;
  File? file;
  UploadTask? uploadTask;
  @override
  Widget build(BuildContext context) {
    //final fileName =
    //  file != null ? Path.basename(file!.path) : 'No file Selected';
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;
    final Color background = Color(0xff3D348B);

    var name;
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

    //Dialog Box

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Intecc'),
      ),
      drawer: NavBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                        height: height1 * 0.02,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 10),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Assignments()),
                                  );
                                },

                                //async {
                                // await showInformationDialog(context);
                                //},
                                child: Card(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/StudentAttendance');
                                        },
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
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                  title: Row(
                                                    children: [
                                                      Text(
                                                        "Upload a file",
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 20,
                                                          color:
                                                              Color(0xff3D348B),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: width1 * 0.24,
                                                      ),
                                                      GestureDetector(
                                                        child: Icon(
                                                          Icons.close,
                                                        ),
                                                        onTap: () async =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(),
                                                      ),
                                                    ],
                                                  ),
                                                  content: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          updateName();
                                                          selectFile();
                                                        },
                                                        child:
                                                            Text("Select File"),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary:
                                                              Color(0xff7678ED),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      60,
                                                                  vertical: 20),
                                                          textStyle: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        fileName,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      SizedBox(
                                                        height: height1 * 0.02,
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: uploadFile,
                                                        child: Text(
                                                          "Upload",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),
                                                          primary: Colors.white
                                                              .withOpacity(
                                                                  0.87),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      30,
                                                                  vertical: 10),
                                                          textStyle: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      uploadTask != null
                                                          ? buildUploadStatus(
                                                              uploadTask!)
                                                          : Container(),
                                                    ],
                                                  )));
                                        },
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
              top: 225,
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

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;
    final file1 = result.files.single;
    setState(
      () => file = File(path),
    );
    setState(() {
      fileName = file1.name;
    });
    //  setState() {
    //    pickedfile = result.files.first;
    // }
  }

  void updateName() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return; // User pressed cancel

    final file = result.files.single;
    setState(() {
      fileName = file.name; // Update fileName with selected file name
    });
  }

  double uploadProgress = 0;
  Future uploadFile() async {
    if (file == null) return;

    final fileName = Path.basename(file!.path);
    final destination = 'files/$fileName';

    uploadTask = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (uploadTask == null) return;

    uploadTask!.snapshotEvents.listen((TaskSnapshot snapshot) {
      final progress = snapshot.bytesTransferred / snapshot.totalBytes;
      setState(() {
        uploadProgress = progress;
      });
    });

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');

    // Upload file data to Cloud Firestore
    final assignmentName = _textEditingController1.text;
    final assignmentTopic = _textEditingController2.text;
    final assignerName = _textEditingController3.text;

    final data = {
      'assignmentName': assignmentName,
      'assignmentTopic': assignmentTopic,
      'assignerName': assignerName,
      'fileUrl': urlDownload,
    };

    FirebaseFirestore.instance.collection('assignments').add(data);
  }

  Widget buildUploadStatus(UploadTask task) {
    return StreamBuilder<TaskSnapshot>(
      stream: task.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final snap = snapshot.data!;
          final progress = snap.bytesTransferred / snap.totalBytes;
          final percentage = (progress * 100).toStringAsFixed(2);

          return Text(
            '$percentage %',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          );
        } else if (snapshot.hasError) {
          return Text('Upload failed: ${snapshot.error}');
        } else {
          return const Text('Uploading...');
        }
      },
    );
  }
}
