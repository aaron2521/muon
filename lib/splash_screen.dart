import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muon/login_page.dart';
import 'package:muon/main_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String type;
  // SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    displaySplash();
  }
  void displaySplash()async{
    Timer(Duration(seconds: 2),()async{
      var user = _auth.currentUser;

      if (user != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(MainPage())));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(LoginPage())));
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/logo.png"),
                  fit: BoxFit.fill
              )
          ),
        ),
      ),
    );
  }
}