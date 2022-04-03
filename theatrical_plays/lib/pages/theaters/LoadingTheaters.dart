import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theatrical_plays/models/Theater.dart';
import 'package:theatrical_plays/using/Loading.dart';

import 'Theaters.dart';

class LoadingTheaters extends StatefulWidget {
  @override
  _LoadingTheatersState createState() => _LoadingTheatersState();
}

class _LoadingTheatersState extends State<LoadingTheaters> {
  List<Theater> theaters = [];

  //fetch data from the api
  // ignore: missing_return
  Future<List<Theater>> loadTheaters() async {
    Uri uri = Uri.parse("http://83.212.111.242:8080/api/venues");
    Response data = await get(uri, headers: {"Accept": "application/json"});
    var jsonData = jsonDecode(data.body);

    try {
      for (var oldTheater in jsonData['data']['content']) {
        Theater theater = new Theater(
            oldTheater['id'], oldTheater['title'], oldTheater['address']);

        theaters.add(theater);
      }
      return theaters;
    } on Exception {
      print('error data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: loadTheaters(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Theater>> snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              } else if (snapshot.hasError) {
                return Text("error loading");
              } else {
                return Theaters(theaters);
              }
            }));
  }
}
