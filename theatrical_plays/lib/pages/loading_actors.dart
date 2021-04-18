import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/actor.dart';

class Loading_actors extends StatefulWidget {
  @override
  _Loading_actorsState createState() => _Loading_actorsState();
}

class _Loading_actorsState extends State<Loading_actors> {
  Future<void> load_actors() async {
    try {
      Uri uri = Uri.parse("http://localhost:8080/api/people");
      var data = await get(uri);
      var json_data = jsonDecode(data.body);

      List<Actor> actors = [];

      for (var old_actor in json_data['data']['content']) {
        Actor actor = new Actor(
            old_actor['image'], old_actor['id'], old_actor['fullName']);
        actors.add(actor);
        print(actor.image);
        print(actor.fullName);
        print(actor.id);
      }
      Navigator.pushReplacementNamed(context, '/actors',
          arguments: {'actors': actors});
    } on Exception catch (e) {
      print('error data');
    }
  }

  @override
  void initState() {
    super.initState();
    load_actors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: SpinKitFadingCircle(
          color: Colors.black,
          size: 80.0,
        ),
      ),
    );
  }
}
