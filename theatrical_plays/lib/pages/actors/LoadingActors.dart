import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/Actor.dart';
import 'package:theatrical_plays/pages/actors/Actors.dart';
import 'package:theatrical_plays/using/Loading.dart';

class LoadingActors extends StatefulWidget {
  @override
  _LoadingActorsState createState() => _LoadingActorsState();
}

class _LoadingActorsState extends State<LoadingActors> {
  _LoadingActorsState();
  List<Actor> actors = [];
  //load actos data from api
  // ignore: missing_return
  Future<List<Actor>> loadActors() async {
    try {
      Uri uri = Uri.parse("http://localhost:8080/api/people");
      Response data = await get(uri, headers: {"Accept": "application/json"});
      var jsonData = jsonDecode(data.body);

      for (var old_actor in jsonData['data']['content']) {
        if (old_actor['image'] == null) {
          old_actor['image'] =
              'http://www.macunepimedium.com/wp-content/uploads/2019/04/male-icon.jpg';
        }
        Actor actor = new Actor(
            old_actor['image'], old_actor['id'], old_actor['fullName']);
        actors.add(actor);
      }
      return actors;
    } on Exception {
      print('error data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: loadActors(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              } else if (snapshot.hasError) {
                return Text("error loading");
              } else {
                return Actors(actors);
              }
            }));
  }
}
