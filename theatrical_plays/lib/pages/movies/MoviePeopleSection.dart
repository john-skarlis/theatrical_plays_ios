import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/RelatedActor.dart';
import 'package:theatrical_plays/pages/actors/ActorInfo.dart';
import 'package:theatrical_plays/using/MyColors.dart';
import 'package:theatrical_plays/using/SmallLoading.dart';

class MoviePeopleSection extends StatefulWidget {
  final int movieId;
  MoviePeopleSection(this.movieId);
  @override
  State<MoviePeopleSection> createState() => _MoviePeopleSectionState(movieId);
}

class _MoviePeopleSectionState extends State<MoviePeopleSection> {
  int movieId;
  _MoviePeopleSectionState(this.movieId);

  List<RelatedActor> relatedActors = [];

  Future<List<RelatedActor>> loadRelatedActors() async {
    try {
      Uri uri =
          Uri.parse("http://localhost:8080/api/productions/$movieId/people");
      Response data = await get(uri, headers: {"Accept": "application/json"});
      var jsonData = jsonDecode(data.body);

      for (var oldRelatedActor in jsonData['data']) {
        RelatedActor relatedActor = new RelatedActor(
            oldRelatedActor['role'],
            oldRelatedActor['image'],
            oldRelatedActor['id'],
            oldRelatedActor['fullName']);

        if (relatedActor.role == null) {
          relatedActor.role = "No role found";
        }
        relatedActors.add(relatedActor);
      }
      return relatedActors;
    } on Exception {
      print('error data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // call method for load the relative production with the actor id and show at the body of page
        future: loadRelatedActors(),
        builder:
            (BuildContext context, AsyncSnapshot<List<RelatedActor>> snapshot) {
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
                    itemCount: relatedActors.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ActorInfo(relatedActors[index].id)));
                        },
                        title: Text(
                          relatedActors[index].fullName +
                              " - " +
                              relatedActors[index].role,
                          style: TextStyle(color: MyColors().cyan),
                        ),
                      );
                    }));
          }
        });
  }
}
