import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/actor.dart';
import 'package:theatrical_plays/pages/actors.dart';

import 'loading.dart';

class Loading_actors extends StatefulWidget {
  int page;
  Loading_actors(this.page);
  @override
  _Loading_actorsState createState() => _Loading_actorsState(page: page);
}

class _Loading_actorsState extends State<Loading_actors> {
  int page;
  _Loading_actorsState({this.page});
  List<Actor> actors = [];
  //load actos data from api
  Future<void> load_actors() async {
    try {
      Uri uri =
          Uri.parse("http://localhost:8080/api/people?page=${page}&size=20");
      Response data = await get(uri, headers: {"Accept": "application/json"});
      var json_data = jsonDecode(data.body);

      for (var old_actor in json_data['data']['content']) {
        if (old_actor['image'] == null) {
          old_actor['image'] =
              'http://www.macunepimedium.com/wp-content/uploads/2019/04/male-icon.jpg';
        }
        Actor actor = new Actor(
            old_actor['image'], old_actor['id'], old_actor['fullName']);
        actors.add(actor);
        //print(actor.image);
        //print(actor.fullName);
        //print(actor.id);
      }
      actors_screns.add(Actors(actors));
      setState(() {
        _current = 1;
      });
    } on Exception catch (e) {
      print('error data');
    }
  }

  @override
  void initState() {
    super.initState();
    load_actors();
  }

  int _current = 0;
  final List<Widget> actors_screns = [Loading()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: actors_screns.elementAt(_current));
  }
}
