import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/actor.dart';

class Actors extends StatefulWidget {
  @override
  _ActorsState createState() => _ActorsState();
}

class _ActorsState extends State<Actors> {
  List<Actor> actors = [];
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    actors = data['actors'];
    return Scaffold(
      body: Container(
        child: Text(data['actors'].toString()),
        /*child: ListView.builder(
            itemCount: actors.length,
            itemBuilder: (context, int index) {
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(actors[index].image),
                ),
              );
            }),*/
      ),
    );
  }
}
