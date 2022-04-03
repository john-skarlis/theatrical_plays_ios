import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/models/Production.dart';
import 'package:theatrical_plays/pages/movies/MovieInfo.dart';
import 'package:theatrical_plays/using/MyColors.dart';
import 'package:theatrical_plays/using/SmallLoading.dart';

class BodyProfileWidget extends StatefulWidget {
  final int actorId;
  BodyProfileWidget(this.actorId);

  @override
  _BodyProfileWidgetState createState() => _BodyProfileWidgetState(actorId);
}

class _BodyProfileWidgetState extends State<BodyProfileWidget> {
  int actorId;
  List<Production> productions = [];
  List<Movie> movies = [];
  _BodyProfileWidgetState(this.actorId);

  // ignore: missing_return
  Future<List<Production>> loadProductions() async {
    try {
      Uri uri = Uri.parse(
          "http://83.212.111.242:8080/api/people/$actorId/productions");
      Response data = await get(uri, headers: {"Accept": "application/json"});
      var jsonData = jsonDecode(data.body);

      for (var oldProduction in jsonData['data']['content']) {
        Production production = new Production(
            oldProduction['role'],
            oldProduction['productionId'],
            oldProduction['title'],
            oldProduction['ticketUrl'],
            oldProduction['producer'],
            oldProduction['mediaUrl'],
            oldProduction['duration'],
            oldProduction['description']);

        Movie movie = new Movie(
            oldProduction['productionId'],
            oldProduction['title'],
            oldProduction['ticketUrl'],
            oldProduction['producer'],
            oldProduction['mediaUrl'],
            oldProduction['duration'],
            oldProduction['description']);

        productions.add(production);
        movies.add(movie);
      }
      return productions;
    } on Exception {
      print('error data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadProductions(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Production>> snapshot) {
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
                    shrinkWrap: true,
                    itemCount: productions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MovieInfo(movies[index])));
                        },
                        title: Text(
                          productions[index].title +
                              " - " +
                              productions[index].role,
                          style: TextStyle(color: MyColors().cyan),
                        ),
                      );
                    }));
          }
        });
  }
}
