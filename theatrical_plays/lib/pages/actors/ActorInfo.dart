import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/Actor.dart';
import 'package:theatrical_plays/pages/actors/BodyProfileWidget.dart';
import 'package:theatrical_plays/using/Loading.dart';
import 'package:theatrical_plays/using/MyColors.dart';
import 'package:theatrical_plays/pages/actors/ProfileWidget.dart';

// ignore: must_be_immutable
class ActorInfo extends StatefulWidget {
  int actorId;
  ActorInfo(this.actorId);
  @override
  _ActorInfoState createState() => _ActorInfoState(actorId: actorId);
}

class _ActorInfoState extends State<ActorInfo> {
  int actorId;
  Actor actor;
  _ActorInfoState({this.actorId});

  // ignore: missing_return
  Future<Actor> loadActor() async {
    try {
      Uri uri = Uri.parse("http://83.212.111.242:8080/api/people/$actorId");
      Response data = await get(uri, headers: {"Accept": "application/json"});
      var jsonData = jsonDecode(data.body);
      if (jsonData['data']['image'] == '') {
        jsonData['data']['image'] =
            'http://www.macunepimedium.com/wp-content/uploads/2019/04/male-icon.jpg';
      }
      return actor = new Actor(jsonData['data']['image'],
          jsonData['data']['id'], jsonData['data']['fullName']);
    } on Exception {
      print('error data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors().black,
        body: FutureBuilder(
            future: loadActor(),
            builder: (BuildContext context, AsyncSnapshot<Actor> snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              } else if (snapshot.hasError) {
                return Text("error loading");
              } else {
                return ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    ProfileWidget(
                        imagePath: actor.image, actorName: actor.fullName),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
                      child: Text('Relateded Productions',
                          style:
                              TextStyle(color: MyColors().cyan, fontSize: 22)),
                    )),
                    BodyProfileWidget(actor.id)
                  ],
                );
              }
            }));
  }
}
