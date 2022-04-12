import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/pages/movies/MovieProfile.dart';
import 'package:theatrical_plays/using/Loading.dart';
import 'package:theatrical_plays/using/MyColors.dart';

import 'MoviePeopleSection.dart';
import 'MovieVenuesSection.dart';

// ignore: must_be_immutable
class MovieInfo extends StatefulWidget {
  int movieId;
  MovieInfo(this.movieId);
  @override
  State<MovieInfo> createState() => _MovieInfoState(movieId: movieId);
}

class _MovieInfoState extends State<MovieInfo> {
  int movieId;
  Movie movie;
  _MovieInfoState({this.movieId});

  // method for load the actor with the id
  // ignore: missing_return
  Future<Movie> loadMovie() async {
    try {
      Uri uri = Uri.parse("http://localhost:8080/api/productions/$movieId");
      Response data = await get(uri, headers: {"Accept": "application/json"});
      var jsonData = jsonDecode(data.body);
      return movie = new Movie(
          jsonData['data']['id'],
          jsonData['data']['title'],
          jsonData['data']['ticketUrl'],
          jsonData['data']['producer'],
          jsonData['data']['mediaUrl'],
          jsonData['data']['duration'],
          jsonData['data']['description']);
    } on Exception {
      print('error data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors().black,
        //call the method to load actor and show
        body: FutureBuilder(
            future: loadMovie(),
            builder: (BuildContext context, AsyncSnapshot<Movie> snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              } else if (snapshot.hasError) {
                return Text("error loading",
                    style: TextStyle(color: MyColors().cyan));
              } else {
                return ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    MovieProfile(),
                    Divider(color: MyColors().gray),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
                      child: Text('Relateded Venues',
                          style:
                              TextStyle(color: MyColors().cyan, fontSize: 22)),
                    )),
                    MovieVenuesSection(),
                    Divider(color: MyColors().gray),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
                      child: Text('Relateded People',
                          style:
                              TextStyle(color: MyColors().cyan, fontSize: 22)),
                    )),
                    MoviePeopleSection()
                  ],
                );
              }
            }));
  }
}
