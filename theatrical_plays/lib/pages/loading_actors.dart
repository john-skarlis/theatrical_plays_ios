import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/actor.dart';
import 'package:theatrical_plays/pages/actors.dart';

import 'loading.dart';

class Loading_actors extends StatefulWidget {
  @override
  _Loading_actorsState createState() => _Loading_actorsState();
}

class _Loading_actorsState extends State<Loading_actors> {
  _Loading_actorsState();
  List<Actor> actors = [];
  //load actos data from api
  Future<List<Actor>> load_actors() async {
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
    } on Exception catch (e) {
      print('error data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: load_actors(),
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
