import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:theatrical_plays/pages/homescreen.dart';
import 'package:theatrical_plays/pages/movies.dart';
import 'package:theatrical_plays/pages/theaters.dart';
import 'package:theatrical_plays/pages/loading_actors.dart';
import 'package:theatrical_plays/using/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //sbake bottom nav bar options initiallization
  SnakeShape snakeShape = SnakeShape.indicator;
  int _selectedItemPosition = 2;
  //bottom nav bar screens
  final List<Widget> screens = [
    Theaters(),
    Movies(),
    Homescreen(),
    Loading_actors(),
  ];
  //initiallize first screen
  Widget currentScreen = Homescreen();
  //https://www.youtube.com/watch?v=8YsO1FOLy5s

  //initialize page storage object to keep the selected page
  //final PageStorageBucket bucket = PageStorageBucket();

  final PageController controller = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //colors for letters in notification bar
      backgroundColor: Colors.white,
      //initiallize appbar options and colors
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          'Theatrical plays',
          style: TextStyle(color: MyColors().cyan),
        ),
        backgroundColor: MyColors().black,
      ),
      //bottom navigation bar size colors an snake shape
      bottomNavigationBar: SnakeNavigationBar.color(
        height: 60,
        backgroundColor: MyColors().black,
        snakeShape: snakeShape,
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
            controller.jumpToPage(index);
            /*if (index == 0) {
              currentScreen = screens[0];
            } else if (index == 1) {
              currentScreen = screens[1];
            } else if (index == 2) {
              currentScreen = screens[2];
            } else if (index == 3) {
              currentScreen = screens[3];
            }*/
          });
        },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.theaters_outlined), label: 'Theaters'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.movie_outlined), label: 'Movies'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Actors'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Search')
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
      body: PageView(
        controller: controller,
        children: screens,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            _selectedItemPosition = index;
          });
        },
        /*PageStorage(
        child: currentScreen,
        bucket: bucket,)*/
      ),
    );
  }
}
