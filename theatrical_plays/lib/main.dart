import 'package:flutter/material.dart';
import 'package:theatrical_plays/pages/Home.dart';

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
