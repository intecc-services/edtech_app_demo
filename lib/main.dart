import 'package:edtech_app_demo/Calendar/Calendar.dart';
import 'package:edtech_app_demo/Landing_Page.dart';
import 'package:edtech_app_demo/TabBar/root.dart';
import 'package:edtech_app_demo/attendance/attendance.dart';
import 'package:edtech_app_demo/grades.dart';
import 'package:edtech_app_demo/profile.dart';
import 'package:edtech_app_demo/shared/theme_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'authentication/Login.dart';
import 'chat/Chats.dart';

//chat id is not addded : and assignments() pg hasnt been added to any route yet.clear

// void main() => runApp(edtech_app());

//notification channel
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', 'Title',
    description: 'Notification channel',
    importance: Importance.high,
    playSound: true);

//local notifications
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A background message just showed up : ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  final fcmToken = await FirebaseMessaging.instance.getToken();
  print('The fcm token is ${fcmToken}');

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      routes: {
        '/Profile': (context) => Profile(),
        '/Messages': (context) =>
            Chats(myId: FirebaseAuth.instance.currentUser?.uid),
        '/Calendar': (context) => Calendar(),
        '/TabBar': (context) => Root(),
        '/StudentAttendance': (context) => Attendance(),
        '/Grades': (context) => Grades(),
      },
      theme: customTheme,
      home: edtech_app(),
      // home: Root(),
    ),
  );
}

class edtech_app extends StatefulWidget {
  const edtech_app({Key? key}) : super(key: key);

  @override
  State<edtech_app> createState() => _edtech_appState();
}

class _edtech_appState extends State<edtech_app> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((event) {
      RemoteNotification? notification = event.notification;
      AndroidNotification? android = event.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              color: Colors.blue,
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text('${notification.title}'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [Text('${notification.body}')],
                  ),
                ),
              );
            });
      }
    });
  }

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
    // body: LandingPage());
  }
}
