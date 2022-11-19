import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/pages/movies/Movies.dart';
import 'package:theatrical_plays/using/Loading.dart';

class LoadingMovies extends StatefulWidget {
  @override
  _LoadingMoviesState createState() => _LoadingMoviesState();
}

class _LoadingMoviesState extends State<LoadingMovies> {
  List<Movie> movies = [];

//fetch data from api
  // ignore: missing_return
  Future<List<Movie>> loadMovies(String query) async {
    Uri uri = Uri.parse("http://195.251.123.174:8080/api/productions");
    Response data = await get(uri, headers: {"Accept": "application/json"});
    var jsonData = jsonDecode(data.body);

    try {
      for (var oldMovie in jsonData['data']['content']) {
        Movie movie = new Movie(
            oldMovie['id'],
            oldMovie['title'],
            oldMovie['ticketUrl'],
            oldMovie['producer'],
            oldMovie['mediaUrl'],
            oldMovie['duration'],
            oldMovie['description'],
            false);

        movies.add(movie);
      }
      return movies.where((movie) {
        final movietitleToLowerCase = movie.title.toLowerCase();
        final queryToLowerCase = query.toLowerCase();

        return movietitleToLowerCase.contains(queryToLowerCase);
      }).toList();
    } on Exception {
      print('error data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: loadMovies(''),
            builder:
                (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              } else if (snapshot.hasError) {
                return Text("error loading");
              } else {
                return Movies(movies);
              }
            }));
  }
}
