import 'package:flutter/material.dart';
import 'package:theatrical_plays/using/MyColors.dart';

class MovieVenuesSection extends StatefulWidget {
  @override
  State<MovieVenuesSection> createState() => _MovieVenuesSectionState();
}

class _MovieVenuesSectionState extends State<MovieVenuesSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text('list theates',
            style: TextStyle(color: MyColors().cyan, fontSize: 15)));
  }
}
