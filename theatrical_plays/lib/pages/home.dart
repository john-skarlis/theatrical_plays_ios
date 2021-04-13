import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(92, 92, 92, 1),
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          'Theatrical plays',
          style: TextStyle(color: Color.fromRGBO(113, 255, 250, 1)),
        ),
        backgroundColor: Color.fromRGBO(29, 29, 29, 1),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        height: 50,
        backgroundColor: Color.fromRGBO(29, 29, 29, 1),
        //behaviour: snakeBarStyle,
        snakeShape: SnakeShape.indicator,
        //shape: shape,
        //padding: padding,
        currentIndex: 2,

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: Color.fromRGBO(113, 255, 250, 1),
        selectedItemColor: SnakeShape.indicator == SnakeShape.indicator
            ? Color.fromRGBO(113, 255, 250, 1)
            : null,
        unselectedItemColor: Color.fromRGBO(92, 92, 92, 1),

        //showUnselectedLabels: showUnselectedLabels,
        //showSelectedLabels: showSelectedLabels,

        //currentIndex: _selectedItemPosition,
        onTap: (index) {},
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'tickets'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.movie_outlined), label: 'calendar'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'microphone'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'search')
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
      /*bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(44, 44, 44, 0),
        color: Color.fromRGBO(29, 29, 29, 1),
        height: 70,
        animationDuration: Duration(milliseconds: 300),
        //buttonBackgroundColor: Color.fromRGBO(113, 255, 250, 1),
        items: <Widget>[
          Icon(
            Icons.movie_outlined,
            size: 30,
            color: Color.fromRGBO(113, 255, 250, 1),
          ),
          Icon(
            Icons.home_outlined,
            size: 30,
            color: Color.fromRGBO(113, 255, 250, 1),
          ),
          Icon(
            Icons.person_outline,
            size: 30,
            color: Color.fromRGBO(113, 255, 250, 1),
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),*/
    );
  }
}
