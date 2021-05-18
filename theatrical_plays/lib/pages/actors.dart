import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/actor.dart';
import 'package:theatrical_plays/pages/loading_actors.dart';
import 'package:theatrical_plays/using/colors.dart';

class Actors extends StatefulWidget {
  List<Actor> actors = [];
  int page;
  Actors(this.actors, this.page);
  @override
  _ActorsState createState() => _ActorsState(actors: actors, page: page);
}

class _ActorsState extends State<Actors> {
  int page;
  List<Actor> actors = [];
  _ActorsState({this.actors, this.page});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().black,
      body: Container(
        child: ListView.builder(
            itemCount: actors.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Loading_actors(1)));
                },
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(actors[index].image),
                  ),
                ),
                title: Text(
                  actors[index].fullName,
                  style: TextStyle(color: MyColors().cyan),
                ),
              );
            }),
      ),
    );
  }
}
