import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/pages/actors/ActorInfo.dart';
import 'package:theatrical_plays/pages/movies/MovieInfo.dart';
import 'package:theatrical_plays/using/MyColors.dart';
import 'package:theatrical_plays/using/SmallLoading.dart';

class TheaterMovieSection extends StatefulWidget {
  final int theaterId;
  TheaterMovieSection(this.theaterId);
  @override
  State<TheaterMovieSection> createState() =>
      _TheaterMovieSectionState(theaterId);
}

class _TheaterMovieSectionState extends State<TheaterMovieSection> {
  int theaterId;
  List<Movie> relatedMovies = [];
  _TheaterMovieSectionState(this.theaterId);

  Future<List<Movie>> loadRelatedMovies() async {
    try {
      Uri uri =
          Uri.parse("http://localhost:8080/api/venues/$theaterId/productions");
      Response data = await get(uri, headers: {"Accept": "application/json"});
      var jsonData = jsonDecode(data.body);

      for (var oldRelatedMovie in jsonData['data']['content']) {
        Movie relatedMovie = new Movie(
            oldRelatedMovie['id'],
            oldRelatedMovie['title'],
            oldRelatedMovie['url'],
            oldRelatedMovie['producer'],
            oldRelatedMovie['mediaURL'],
            oldRelatedMovie['duration'],
            oldRelatedMovie['description']);
        relatedMovies.add(relatedMovie);
      }
      return relatedMovies;
    } on Exception {
      print('error data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // call method for load the relative production with the actor id and show at the body of page
        future: loadRelatedMovies(),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (!snapshot.hasData) {
            return SmallLoading();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("error loading",
                  style: TextStyle(color: MyColors().cyan, fontSize: 22)),
            );
          } else {
            return Center(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: relatedMovies.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MovieInfo(relatedMovies[index].id)));
                        },
                        title: Text(
                          relatedMovies[index].title +
                              " - " +
                              relatedMovies[index].title,
                          style: TextStyle(color: MyColors().cyan),
                        ),
                      );
                    }));
          }
        });
    ;
  }
}
