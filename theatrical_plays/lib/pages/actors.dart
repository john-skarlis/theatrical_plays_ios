import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/actor.dart';

class Actors extends StatefulWidget {
  @override
  _ActorsState createState() => _ActorsState();
}

class _ActorsState extends State<Actors> {
  Future<List<Actors>> getActors() async {
    Uri uri = Uri.parse("http://localhost:8080/api/people");
    var data = await get(uri);
    var json_data = jsonDecode(data.body);

    List<Actor> actors = [];
    for (var old_actor in json_data['data']['content']) {
      Actor actor =
          new Actor(old_actor['image'], old_actor['id'], old_actor['fullName']);
      actors.add(actor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: getActors(),
          builder: (context, snapshot) {},
        ),
      ),
    );
  }
}
