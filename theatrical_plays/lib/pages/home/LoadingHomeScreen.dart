import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/pages/home/HomeScreen.dart';
import 'package:theatrical_plays/using/Loading.dart';

class LoadingHomeScreen extends StatefulWidget {
  @override
  _LoadingHomeScreenState createState() => _LoadingHomeScreenState();
}

class _LoadingHomeScreenState extends State<LoadingHomeScreen> {
  List<Movie> movies = [];
  //load latest movies data from api
  // ignore: missing_return
  Future<List<Movie>> loadLatestMovies() async {
    try {
      Uri uri = Uri.parse(
          "http://83.212.111.242:8080/api/productions/search?q=mediaURL~youtube");
      Response data = await get(uri, headers: {"Accept": "application/json"});
      var jsonData = jsonDecode(data.body);

      for (var oldMovie in jsonData['data']['content']) {
        if (oldMovie['mediaUrl']?.isEmpty ?? true) {
          Movie movie = new Movie(
              oldMovie['id'],
              oldMovie['title'],
              oldMovie['ticketUrl'],
              oldMovie['producer'],
              oldMovie['mediaUrl'],
              oldMovie['duration'],
              oldMovie['description']);
          movies.add(movie);
        }
      }
      return movies;
    } on Exception {
      print('error data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: loadLatestMovies(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              } else if (snapshot.hasError) {
                return Text("error loading");
              } else {
                return HomeScreen(movies);
              }
            }));
  }
}
