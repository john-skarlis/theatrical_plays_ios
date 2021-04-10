import 'dart:js';

import 'package:flutter/material.dart';
import 'package:theatrical_plays/pages/home.dart';
import 'package:theatrical_plays/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    title: 'Theatrical_plays',
    theme: ThemeData(primaryColor: Color(0x1d1d1d)),
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    },
  ));
}
