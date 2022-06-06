import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:theatrical_plays/pages/Home.dart';
import 'package:theatrical_plays/using/Loading.dart';
import 'package:theatrical_plays/using/MyColors.dart';
import 'package:theatrical_plays/using/SmallLoading.dart';

void main() {
  runApp(MaterialApp(
    home: AnimatedSplashScreen(
        splash: Column(
          children: [
            Center(
              child: Text("Theatrical",
                  style: TextStyle(
                    color: MyColors().cyan,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  )),
            ),
            Center(
                child: Text(
              "Plays",
              style: TextStyle(
                color: MyColors().cyan,
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
            ))
          ],
        ),
        duration: 3000,
        backgroundColor: MyColors().black,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: Home()),
    // initialRoute: '/home',
    // routes: {
    //   '/': (context) => Home(),
    //   //'/actors': (context) => Loading_actors(),
    //   //'/theaters': (context) => Theaters(),
    // },
  ));
}
