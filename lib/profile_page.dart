import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muon/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Column(
        children: [
          Text("profile"),
          SizedBox(
            height: 40,
          ),
          // Container(child: Text(widget.user.displayName)),
          SizedBox(
            height: 40,
          ),
          Container(
            child: OutlinedButton(
              onPressed: (){
                _signOut().whenComplete((){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                });
              },
              child: Text("Logout"),
            ),
          )
        ],
      ),
    );
  }
  Future _signOut()async{
    await _auth.signOut();
  }
}
