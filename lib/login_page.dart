import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final pass = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
                child: Image(
              image: AssetImage("images/logo.png"),
            )),
          ),
          RichText(
            text: TextSpan(
                text: "Hello, ",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: " Sign in to your Account",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff78CFBA),
                    ),
                  )
                ]),
          ),
          SizedBox(
            height: 40,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      TextField1(
                          icon: Icons.person,
                          title: "Name",
                          titleController: email),
                      TextField2(
                          icon: Icons.lock,
                          title: "Password",
                          titleController: pass),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 70,
                    decoration: ShapeDecoration(
                      color: Color(0xff78CFBA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_forward_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Don't have an account?   ",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 3),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: Colors.black,
                    width: 1.0, // This would be the width of the underline
                  ))
              ),
              child: Text(
                "Create",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, )
              ),
            ),
          ])
        ]),
      ),
    );
  }
}

class TextField1 extends StatelessWidget {
  final IconData icon;
  final String title;
  final TextEditingController titleController;
  const TextField1({
    Key key,
    this.icon,
    this.title,
    this.titleController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(36)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 5),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: TextFormField(
          // obscureText: true,
          autofocus: false,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(36.0),
              ),
            ),
            filled: true,
            prefixIcon: Icon(icon, color: Color(0xff78CFBA)),
            // icon: Icon(icon,color: Colors.white,),
            hintStyle: TextStyle(color: Color(0xff78CFBA)),
            hintText: title,
            fillColor: Colors.white,
          ),
          validator: (title) =>
              title != null && title.isEmpty ? "This cannot be empty" : null,
          controller: titleController,
        ),
      ),
    );
  }
}

class TextField2 extends StatelessWidget {
  final IconData icon;
  final String title;
  final TextEditingController titleController;
  const TextField2({
    Key key,
    this.icon,
    this.title,
    this.titleController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 25, right: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(36)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 5),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: TextFormField(
          obscureText: true,
          autofocus: false,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(36.0),
              ),
            ),
            filled: true,
            prefixIcon: Icon(icon, color: Color(0xff78CFBA)),
            // icon: Icon(icon,color: Colors.white,),
            hintStyle: TextStyle(color: Color(0xff78CFBA)),
            hintText: title,
            fillColor: Colors.white,
          ),
          validator: (title) =>
              title != null && title.isEmpty ? "This cannot be empty" : null,
          controller: titleController,
        ),
      ),
    );
  }
}
