import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/using/MyColors.dart';

import 'LoadingMovies.dart';

// ignore: must_be_immutable
class Movies extends StatefulWidget {
  List<Movie> movies = [];
  Movies(this.movies);
  @override
  _MoviesState createState() => _MoviesState(movies: movies);
}

class _MoviesState extends State<Movies> {
  List<Movie> movies = [];
  _MoviesState({this.movies});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().black,
      body: Container(
        child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoadingMovies()));
                },
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                  // child: CircleAvatar(
                  //   radius: 30.0,
                  //   backgroundImage: NetworkImage(movies[index].image),
                  // ),
                ),
                title: Text(
                  movies[index].title,
                  style: TextStyle(color: MyColors().cyan),
                ),
              );
            }),
      ),
    );
  }
}
