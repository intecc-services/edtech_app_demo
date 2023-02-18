import 'package:edtech_app_demo/shared/bottom_bar.dart';
import 'package:flutter/material.dart';

class Materials extends StatefulWidget {
  const Materials({Key? key}) : super(key: key);

  @override
  State<Materials> createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
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
                  'Materials',
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
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return assigncard();
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

  Widget assigncard() {
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
                Text('Graphics & Drawing Techniques',
                    style: TextStyle(
                      color: Color(0xff3D348B),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    )),
                SizedBox(height: 23),
                Text('Solid Orthographic projection ',
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
                    Text('Prof George Hawkins',
                        style: TextStyle(
                          color: Color(0xff3D348B),
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
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
  //start from here
}
