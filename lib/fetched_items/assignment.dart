import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edtech_app_demo/fetched_items/firebase_service.dart';
import 'package:edtech_app_demo/fetched_items/pdf_viewer.dart';
import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:edtech_app_demo/Landing_Page.dart';
import 'dart:io';
import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';

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

import '../api/firebase_api.dart';

class Assignments extends StatefulWidget {
  const Assignments({Key? key}) : super(key: key);

  @override
  State<Assignments> createState() => _MaterialsState();
}

String fileName = '';

class _MaterialsState extends State<Assignments> {
  FirebaseServices firebaseServices = FirebaseServices();

  @override
  void initState() {
    super.initState();
    //firebaseServices.getTitles();
  }

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

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Bottom_Bar(),
      backgroundColor: Color(0xff3D348B),
      body: Column(
        children: [
          SizedBox(height: h * 0.1),
          Padding(
            padding: EdgeInsets.all(w * 0.05),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_circle_left_rounded,
                      size: w * 0.075, color: Color(0xffFFFFFF)),
                ),
                SizedBox(width: w * 0.07),
                Text(
                  'Assignments',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: w * 0.08,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(w * 0.13),
                  topLeft: Radius.circular(w * 0.13),
                ),
                color: Color(0xffF2F2F2),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: w * 0.02, right: w * 0.02, top: h * 0.02),
                child: Column(
                  children: [
                    Text(
                      'Section-B',
                      style: TextStyle(
                        color: Color(0xff3D348B),
                        fontSize: w * 0.065,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    //SizedBox(height: 10),
                    Expanded(
                      child: StreamBuilder<List<Map<String, dynamic>>>(
                        stream: firebaseServices.getAssignments(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          final assignments = snapshot.data!;
                          // List<String> titles =
                          //     (snapshot.data as List<dynamic>).cast<String>();
                          return Stack(children: [
                            ListView.builder(
                              //itemCount: titles.length,
                              itemCount: assignments.length,
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                //final assignment = assignments[index];
                                return AssignmentCard(
                                    assignment: assignments[index]);
                              },
                            ),
                            Positioned(
                              bottom: 16.0,
                              right: 16.0,
                              child: FloatingActionButton(
                                backgroundColor: Color(
                                    0xff3D348B), // set the background color
                                foregroundColor:
                                    Colors.white, // set the text and icon color
                                elevation: 2.0, // add shadow
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30.0), // round the button shape
                                ),
                                onPressed: () async {
                                  await showInformationDialog(context);
                                  // add your onPressed action here
                                  //add the dialog box here:
                                },
                                child: Icon(Icons.add),
                              ),
                            ),
                          ]);
                        },
                      ),
                    ),
                    // FloatingActionButton(
                    //     onPressed: () => null,
                    //     backgroundColor: Color(0xff7678ED),
                    //     child: Icon(
                    //       Icons.add,
                    //       color: Colors.white,
                    //       size: 30,
                    //     )),
                  ],
                ),
              ),
            ),
          ), //place to enter text
        ],
      ),
    );
  }
  //start from here
}

// Widget assigncard() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       width: double.infinity,
//       child: Card(
//         color: Color(0xffCBCBEE),
//         child: Padding(
//           padding: const EdgeInsets.only(top: 8, bottom: 8),
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text('Graphics & Drawing Techniques',
//                   style: TextStyle(
//                     color: Color(0xff3D348B),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                   )),
//               SizedBox(height: 23),
//               Text('Solid Orthographic projection ',
//                   style: TextStyle(
//                     color: Color(0xff3D348B),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                   )),
//               SizedBox(height: 23),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.person,
//                     size: 31,
//                   ),
//                   SizedBox(width: 6),
//                   Text('Prof George Hawkins',
//                       style: TextStyle(
//                         color: Color(0xff3D348B),
//                         fontSize: 10,
//                         fontWeight: FontWeight.w300,
//                       ))
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _textEditingController1 = TextEditingController();
final TextEditingController _textEditingController2 = TextEditingController();
final TextEditingController _textEditingController3 = TextEditingController();

class AssignmentCard extends StatefulWidget {
  Map<String, dynamic> assignment;

  AssignmentCard({required this.assignment});

  @override
  State<AssignmentCard> createState() => _AssignmentCardState();
}

PlatformFile? pickedfile;
File? file;
UploadTask? uploadTask;

class _AssignmentCardState extends State<AssignmentCard> {
  //final String title;
  FirebaseServices firebaseServices = FirebaseServices();

  void viewPDF(BuildContext context) async {
    //print("here");
    String pdfURL =
        await firebaseServices.getPdfURL(widget.assignment['title']);
    print("here");
    print(pdfURL);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PDFViewerPage(url: pdfURL)),
    );
  }

  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    if (widget.assignment['title'] == null)
      return Container();
    else
      return Padding(
        padding: EdgeInsets.all(w * 0.02),
        child: Container(
          width: double.infinity,
          child: Card(
            elevation: 6,
            color: Color(0xffCBCBEE),
            child: Padding(
              padding: EdgeInsets.only(top: h * 0.01, bottom: h * 0.01),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(widget.assignment['title'],
                      style: TextStyle(
                        color: Color(0xff3D348B),
                        fontSize: w * 0.047,
                        fontWeight: FontWeight.w700,
                      )),
                  SizedBox(height: h * 0.03),
                  Text(widget.assignment['topic'],
                      style: TextStyle(
                        color: Color(0xff3D348B),
                        fontSize: w * 0.04,
                        fontWeight: FontWeight.w700,
                      )),
                  SizedBox(height: h * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: w * 0.09,
                      ),
                      SizedBox(width: w * 0.03),
                      Text(widget.assignment['assignor'],
                          style: TextStyle(
                            color: Color(0xff3D348B),
                            fontSize: w * 0.03,
                            fontWeight: FontWeight.w300,
                          )),
                      SizedBox(width: w * 0.05),
                      ElevatedButton(
                          onPressed: () => viewPDF(context),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff3D348B))),
                          child: Icon(
                            Icons.picture_as_pdf,
                            color: Colors.white,
                            size: w * 0.1,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }

// class PDFViewerPage extends StatelessWidget {
}
