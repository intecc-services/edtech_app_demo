import 'package:edtech_app_demo/profile.dart';
import 'package:edtech_app_demo/shared/theme_data.dart';
import 'package:flutter/material.dart';

void main() => runApp(edtech_app());

class edtech_app extends StatelessWidget {
  const edtech_app({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme,
      home: Profile(),
    );
  }
}
