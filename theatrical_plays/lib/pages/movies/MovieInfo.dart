import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/using/MyColors.dart';

// ignore: must_be_immutable
class MovieInfo extends StatefulWidget {
  Movie movie;
  MovieInfo(this.movie);
  @override
  State<MovieInfo> createState() => _MovieInfoState(movie: movie);
}

class _MovieInfoState extends State<MovieInfo> {
  Movie movie;
  _MovieInfoState({this.movie});
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
