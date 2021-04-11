import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

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
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(44, 44, 44, 0),
        color: Color.fromRGBO(29, 29, 29, 1),
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
      ),
    );
  }
}
