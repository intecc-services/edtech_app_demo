import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edtech_app_demo/fetched_items/firebase_service.dart';
import 'package:edtech_app_demo/fetched_items/pdf_viewer.dart';
import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/material.dart';

class Assignments extends StatefulWidget {
  const Assignments({Key? key}) : super(key: key);

  @override
  State<Assignments> createState() => _MaterialsState();
}

class _MaterialsState extends State<Assignments> {
  FirebaseServices firebaseServices = FirebaseServices();

  @override
  void initState() {
    super.initState();
    //firebaseServices.getTitles();
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
                                onPressed: () {
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

class AssignmentCard extends StatelessWidget {
  Map<String, dynamic> assignment;
  //final String title;
  FirebaseServices firebaseServices = FirebaseServices();

  AssignmentCard({required this.assignment});

  void viewPDF(BuildContext context) async {
    //print("here");
    String pdfURL = await firebaseServices.getPdfURL(assignment['title']);
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
    if (assignment['title'] == null)
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
                  Text(assignment['title'],
                      style: TextStyle(
                        color: Color(0xff3D348B),
                        fontSize: w * 0.047,
                        fontWeight: FontWeight.w700,
                      )),
                  SizedBox(height: h * 0.03),
                  Text(assignment['topic'],
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
                      Text(assignment['assignor'],
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
}

// class PDFViewerPage extends StatelessWidget {
//   final String pdfURL;

//   PDFViewerPage({required this.pdfURL});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('PDF Viewer')),
//       body: PDFViewerScaffold(path: pdfURL),
//     );
//   }
// }
