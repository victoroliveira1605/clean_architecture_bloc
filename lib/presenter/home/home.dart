import 'package:clean_architecture_movie/presenter/launch/launch.dart';
import 'package:clean_architecture_movie/presenter/upcoming/upcoming_page.dart';
import 'package:clean_architecture_movie/utils/theme/app_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indexScreen = 0; // Variável para controlar o índice das telas
  final List<Widget> _screen = [
    LaunchPage(),
    UpcomingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screen[_indexScreen],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          backgroundColor: primaryColor,
          currentIndex: _indexScreen,
          iconSize: 32,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          selectedItemColor: aceentColor,
          unselectedItemColor: whiteColor,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.movie,
                ),
                label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.navigate_next), label: ''),
          ],
        ));
  }

  void onTabTapped(int index) {
    setState(() {
      _indexScreen = index;
    });
  }
}
