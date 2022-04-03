import 'package:flutter/material.dart';
import 'package:theatrical_plays/using/MyColors.dart';

class MovieProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text('movie profile',
            style: TextStyle(color: MyColors().cyan, fontSize: 15)));
  }
}
