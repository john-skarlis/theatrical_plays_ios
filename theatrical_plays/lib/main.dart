import 'package:flutter/material.dart';
import 'package:theatrical_plays/pages/home.dart';
import 'package:theatrical_plays/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    //initialRoute: '/home',
    routes: {
      '/': (context) => Home(),
      '/home': (context) => Home(),
    },
  ));
}
