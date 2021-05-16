import 'package:flutter/material.dart';
import 'package:theatrical_plays/pages/actors.dart';
import 'package:theatrical_plays/pages/home.dart';
import 'package:theatrical_plays/pages/loading_actors.dart';

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
