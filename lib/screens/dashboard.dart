import 'package:demo_screens/screens/first_screen.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      // _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    FirstScreen()

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: showBottomNavigationBar(),
        body: _children[_currentIndex],
      ),
    );
  }

  showBottomNavigationBar() {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home), label: ('Home')),
          BottomNavigationBarItem(
              icon: new Icon(Icons.developer_mode), label: ('Demo')),
          BottomNavigationBarItem(
              icon: new Icon(Icons.notifications_rounded), label: ('Notifications')),
          BottomNavigationBarItem(
              icon: new Icon(Icons.task), label: ('Tasks')),
        ]);
  }
}
