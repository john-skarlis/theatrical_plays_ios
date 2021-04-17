import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:theatrical_plays/pages/actors.dart';
import 'package:theatrical_plays/pages/homescreen.dart';
import 'package:theatrical_plays/pages/movies.dart';
import 'package:theatrical_plays/pages/theaters.dart';
import 'package:theatrical_plays/using/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*ShapeBorder bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );*/
  SnakeShape snakeShape = SnakeShape.indicator;
  int _selectedItemPosition = 2;
  final List<Widget> screens = [
    Movies(),
    Theaters(),
    Homescreen(),
    Actors(),
  ];

  Widget currentScreen = Homescreen();
  //https://www.youtube.com/watch?v=8YsO1FOLy5s

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          'Theatrical plays',
          style: TextStyle(color: MyColors().cyan),
        ),
        backgroundColor: MyColors().black,
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        height: 60,
        backgroundColor: MyColors().black,
        snakeShape: snakeShape,
        //shape: bottomBarShape,
        //padding: const EdgeInsets.all(12),
        snakeViewColor: MyColors().cyan,
        selectedItemColor: SnakeShape.indicator == SnakeShape.indicator
            ? MyColors().cyan
            : null,
        unselectedItemColor: Colors.white,

        showUnselectedLabels: true,
        showSelectedLabels: true,

        currentIndex: _selectedItemPosition,
        onTap: (index) {
          setState(() {
            _selectedItemPosition = index;
            if (index == 0) {
              currentScreen = Theaters();
            } else if (index == 1) {
              currentScreen = Movies();
            } else if (index == 2) {
              currentScreen = Homescreen();
            } else if (index == 3) {
              currentScreen = Actors();
            }
          });
        },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.theaters_outlined), label: 'theaters'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.movie_outlined), label: 'movies'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'actors'),
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
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
    );
  }
}
