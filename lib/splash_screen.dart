import 'dart:async';
import 'package:flutter/material.dart';
import 'package:muon/main_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String type;
  // SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    displaySplash();
  }
  void displaySplash()async{
    Timer(Duration(seconds: 5),()async{
      // if(await _googleSignIn.isSignedIn()){
      //   String type=App.sharedPreferences.getString("type");
      //   if(type=='seller'){
      //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(SellerHome())));
      //   }
      //   else if(type=='customer'){
      //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(SidebarLayout())));
      //   }
      //   else{
      //     await _googleSignIn.signOut();
      //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(Login())));
      //     print("something wrong");
      //   }
      // }
      // else{
      //
      //   await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(Login())));
      //   print("user null");
      //   print(type);
      // }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(MainPage())));
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