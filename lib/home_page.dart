import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muon/login_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key key, this.user}) : super(key: key);
  final User user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
