import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Actor.dart';
import 'package:theatrical_plays/pages/actors/ActorInfo.dart';
import 'package:theatrical_plays/pages/actors/LoadingActors.dart';
import 'package:theatrical_plays/using/MyColors.dart';
import 'package:theatrical_plays/using/SearchWidget.dart';

// ignore: must_be_immutable
class Actors extends StatefulWidget {
  List<Actor> actors = [];
  Actors(this.actors);
  @override
  _ActorsState createState() => _ActorsState(actors: actors);
}

class _ActorsState extends State<Actors> {
  List<Actor> actors = [];
  String query = '';
  _ActorsState({this.actors});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().black,
      body: Column(
        children: [
          buildSearch(),
          Expanded(
            child: ListView.builder(
                itemCount: actors.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ActorInfo(actors[index].id)));
                      // print(index);
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
          )
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Actor name',
        onChanged: searchActors,
      );

  Future searchActors(String query) async {
    // final search = actors.where((actor) {
    //   final searchActors = actor.fullName.toLowerCase();
    //   final searchLower = query.toLowerCase();

    //   return searchActors.contains(searchLower);
    // }).toList();
    // if (query.isEmpty) {
    //   setState(() {
    //     this.query = "";
    //     this.actors = LoadingActors().createState().loadActors() as List<Actor>;
    //   });
    // } else {
    //   setState(() {
    //     this.query = query;
    //     this.actors = search;
    //   });
    // }
    final List<Actor> search =
        await LoadingActors().createState().loadActors(query);
    if (!mounted) return;
    setState(() {
      this.query = query;
      this.actors = search;
    });
  }
}
