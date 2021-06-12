import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muon/add_photo_page.dart';
import 'package:muon/home_page.dart';
import 'package:muon/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key, User user}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  var _pages = [HomePage(), AddPhotoPage(), ProfilePage()];
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(alignment: Alignment(-0.2, 0), child: Text("Muon")),
      ),
      body: PageView(
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text("Home"),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo_outlined),
              title: Text("Camera"),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              title: Text("Profile"),
              backgroundColor: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(_currentIndex,
                duration: Duration(milliseconds: 100),
                curve: Curves.fastLinearToSlowEaseIn);
          });
        },
      ),
    );
  }
}
