import 'package:flutter/material.dart';
import 'package:muon/login_page.dart';
import 'package:muon/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff78CFBA)
      ),
        debugShowCheckedModeBanner: false,
        home: LoginPage()
    );
  }
}