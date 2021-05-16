import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/actor.dart';
import 'package:theatrical_plays/using/colors.dart';

class Actors extends StatefulWidget {
  List<Actor> actors = [];
  Actors(this.actors);
  @override
  _ActorsState createState() => _ActorsState(actors: actors);
}

class _ActorsState extends State<Actors> {
  List<Actor> actors = [];
  _ActorsState({this.actors});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().black,
      body: Container(
        child: ListView.builder(
            itemCount: actors.length,
            itemBuilder: (context, index) {
              return ListTile(
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
