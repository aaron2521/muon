import 'package:flutter/material.dart';
import 'package:muon/login_page.dart';
import 'package:muon/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // App.sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
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
        home: SplashScreen()
    );
  }
}