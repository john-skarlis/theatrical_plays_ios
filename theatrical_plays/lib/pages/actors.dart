import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/actor.dart';

class Actors extends StatefulWidget {
  List<Actor> actors = [];
  Actors(this.actors);
  @override
  _ActorsState createState() => _ActorsState(actors: actors);
}

class _ActorsState extends State<Actors> {
  _ActorsState({this.actors});
  List<Actor> actors = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: actors.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(actors[index].image),
                ),
                title: Text(actors[index].fullName),
                subtitle: Text(actors[index].id.toString()),
              );
            }),
      ),
    );
  }
}
