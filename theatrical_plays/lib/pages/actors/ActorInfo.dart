import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/Actor.dart';
import 'package:theatrical_plays/pages/actors/BodyProfileWidget.dart';
import 'package:theatrical_plays/using/AuthorizationStore.dart';
import 'package:theatrical_plays/using/Constants.dart';
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

  // method for load the actor with the id
  // ignore: missing_return
  Future<Actor> loadActor() async {
    try {
      Uri uri =
          Uri.parse("http://${Constants().hostName}:8080/api/people/$actorId");
      Response data = await get(uri, headers: {
        "Accept": "application/json",
        "authorization":
            "${await AuthorizationStore.getStoreValue("authorization")}"
      });
      var jsonData = jsonDecode(data.body);
      if (jsonData['data']['image'] == null ||
          jsonData['data']['image'] == '') {
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
        appBar: AppBar(
          // ignore: deprecated_member_use
          brightness: Brightness.dark,
          title: Text(
            'Actor Info',
            style: TextStyle(color: MyColors().cyan),
          ),
          backgroundColor: MyColors().black,
        ),
        backgroundColor: MyColors().black,
        //call the method to load actor and show
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
                      child: Text('Bio',
                          style:
                              TextStyle(color: MyColors().cyan, fontSize: 22)),
                    )),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                        child: Text(
                          "${actor.fullName} born 13 December 1982, is a Franco-British actor, scriptwriter and director. He adapted Shakespeare's Romeo and Juliet into his play R & J and he has written and staged his own plays, " +
                              "including Le Porteur d'histoire, Le Cercle des illusionnistes, Edmond and Intra Muros. He has acted in a number of films, including Sagan by Diane Kurys and Le Chant du loup by Abel Lanzac and he has acted in a number of " +
                              "TV series, mini-series, and TV films, including the series Kaboul Kitchen by Allan Mauduit and Jean-Patrick Benes. He has received various Molière awards for his plays.",
                          style:
                              TextStyle(color: MyColors().cyan, fontSize: 18),
                        ),
                      ),
                    ),
                    Divider(color: MyColors().gray),
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
