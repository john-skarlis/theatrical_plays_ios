import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/using/MyColors.dart';

// ignore: must_be_immutable
class MovieInfo extends StatefulWidget {
  int movieId;
  MovieInfo(this.movieId);
  @override
  State<MovieInfo> createState() => _MovieInfoState(movieId: movieId);
}

class _MovieInfoState extends State<MovieInfo> {
  int movieId;
  _MovieInfoState({this.movieId});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "OK",
        style: TextStyle(color: MyColors().cyan, fontSize: 22),
      ),
    );
  }
}
