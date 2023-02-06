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
import 'package:flutter/material.dart';

import 'authentication/Login.dart';

// void main() => runApp(edtech_app());

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    routes: {
      '/Profile': (context) => Profile(),
      '/Messages': (context) => Chats(),
      '/Calendar': (context) => Calendar(),
      '/TabBar': (context) => Root(),
      '/StudentAttendance': (context) => Attendance(),
      '/Grades': (context) => Grades(),
    },
    theme: customTheme,
    home: edtech_app(),
  ));
}

class edtech_app extends StatelessWidget {
  const edtech_app({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LandingPage();
          } else {
            //print('User logged out');
            return LoginPage();
          }
        },
      ),
    );
    // body: Calendar());
  }
}
