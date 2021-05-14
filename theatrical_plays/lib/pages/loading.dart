import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:theatrical_plays/using/colors.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().black,
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: SpinKitWave(
          color: MyColors().cyan,
          size: 40.0,
        ),
      ),
    );
  }
}
