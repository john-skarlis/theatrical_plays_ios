import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Actor.dart';
import 'package:theatrical_plays/pages/actors/LoadingActors.dart';
import 'package:theatrical_plays/using/MyColors.dart';

// ignore: must_be_immutable
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoadingActors()));
                    // print(index);
                  },
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(actors[index].image[0]),
                    ),
                  ),
                  title: Text(
                    actors[index].fullName,
                    style: TextStyle(color: MyColors().cyan),
                  ),
                );
              }),
        ));
  }
}
