import 'package:flutter/material.dart';
import 'package:theatrical_plays/pages/home.dart';

void main() {
  runApp(MaterialApp(
    //initialRoute: '/home',
    routes: {
      '/': (context) => Home(),
      //'/actors': (context) => Loading_actors(),
      //'/theaters': (context) => Theaters(),
    },
  ));
}
