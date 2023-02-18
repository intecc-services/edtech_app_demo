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
    return Scaffold(
      bottomNavigationBar: Bottom_Bar(),
      backgroundColor: Color(0xff3D348B),
      body: Column(
        children: [
          SizedBox(height: 90),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_circle_left_rounded,
                      size: 20, color: Color(0xffFFFFFF)),
                ),
                SizedBox(width: 17),
                Text(
                  'Assignments',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
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
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                color: Color(0xffF2F2F2),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
                child: Column(
                  children: [
                    Text(
                      'Section-B',
                      style: TextStyle(
                        color: Color(0xff3D348B),
                        fontSize: 24,
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
                          return ListView.builder(
                            //itemCount: titles.length,
                            itemCount: assignments.length,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              //final assignment = assignments[index];
                              return AssignmentCard(
                                  assignment: assignments[index]);
                            },
                          );
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
    if (assignment['title'] == null)
      return Container();
    else
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Card(
            color: Color(0xffCBCBEE),
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(assignment['title'],
                      style: TextStyle(
                        color: Color(0xff3D348B),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      )),
                  SizedBox(height: 23),
                  Text(assignment['topic'],
                      style: TextStyle(
                        color: Color(0xff3D348B),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      )),
                  SizedBox(height: 23),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 31,
                      ),
                      SizedBox(width: 6),
                      Text(assignment['assignor'],
                          style: TextStyle(
                            color: Color(0xff3D348B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          )),
                      SizedBox(width: 20),
                      ElevatedButton(
                          onPressed: () => viewPDF(context),
                          child: Icon(
                            Icons.picture_as_pdf,
                            color: Colors.white,
                            size: 40,
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
