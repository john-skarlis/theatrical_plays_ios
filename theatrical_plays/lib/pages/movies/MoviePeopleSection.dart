import 'package:flutter/material.dart';
import 'package:theatrical_plays/using/MyColors.dart';

class MoviePeopleSection extends StatefulWidget {
  @override
  State<MoviePeopleSection> createState() => _MoviePeopleSectionState();
}

class _MoviePeopleSectionState extends State<MoviePeopleSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text('list people',
            style: TextStyle(color: MyColors().cyan, fontSize: 15)));
  }
}
