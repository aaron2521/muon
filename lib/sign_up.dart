import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muon/login_page.dart';
import 'package:muon/main_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email = TextEditingController();
  final pass = TextEditingController();
  final name = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
                child: Image(
              image: AssetImage("images/logo.png"),
            )),
          ),
          RichText(
            text: TextSpan(
              text: "Create Account ",
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
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
                        titleController: name,
                        message: "Enter an email",
                      ),
                      TextField1(
                        icon: Icons.mail,
                        title: "Email",
                        titleController: email,
                        message: "Enter a nick Name",
                      ),
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
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Create",
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
                  child: GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState.validate()) {
                        registerAccount();
                      }
                    },
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
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 50,
          // ),
          // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //   Text(
          //     "Don't have an account?   ",
          //     style: TextStyle(
          //       fontSize: 16,
          //       color: Colors.black,
          //     ),
          //   ),
          //   GestureDetector(
          //     onTap: (){
          //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
          //     },
          //     child: Container(
          //       padding: EdgeInsets.only(bottom: 3),
          //       decoration: BoxDecoration(
          //           border: Border(bottom: BorderSide(
          //             color: Colors.black,
          //             width: 1.0, // This would be the width of the underline
          //           ))
          //       ),
          //       child: Text(
          //           "Create",
          //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, )
          //       ),
          //     ),
          //   ),
          // ])
        ]),
      ),
    );
  }
  void registerAccount() async{
    try{
      final User user = (await _auth.createUserWithEmailAndPassword(email: email.text, password: pass.text)).user;

      if(user!=null){
        if(!user.emailVerified){
          await user.sendEmailVerification();
        }
        await user.updateDisplayName(name.text);
        final user1 = _auth.currentUser;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage(user: user1)));
      }
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter a valid email"),behavior: SnackBarBehavior.floating,backgroundColor: Color(0xff78CFBA),));
      print(e);
    }

  }
}

class TextField1 extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final TextEditingController titleController;
  const TextField1({
    Key key,
    this.icon,
    this.title,
    this.titleController,
    this.message,
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
          validator: (title) => title != null && title.isEmpty ? message : null,
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
              title != null && title.length < 6 ? "Enter a valid password" : null,
          controller: titleController,
        ),
      ),
    );
  }
}
