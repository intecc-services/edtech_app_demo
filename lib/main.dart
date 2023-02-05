import 'package:edtech_app_demo/Landing_Page.dart';
import 'package:edtech_app_demo/shared/theme_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'authentication/Login.dart';
import 'package:flutter/material.dart';
import 'Calendar/Calendar.dart';

// void main() => runApp(edtech_app());

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
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
