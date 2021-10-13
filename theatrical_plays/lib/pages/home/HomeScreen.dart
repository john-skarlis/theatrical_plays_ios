import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/using/MyColors.dart';

class HomeScreen extends StatefulWidget {
  List<Movie> latestMovies = [];
  HomeScreen(this.latestMovies);
  @override
  _HomeScreenState createState() =>
      _HomeScreenState(latestMovies: latestMovies);
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> latestMovies = [];
  _HomeScreenState({this.latestMovies});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().black,
      body: Container(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(latestMovies[index].mediaUrl))),
                    child: Text("fveef"),
                  )
                ],
              );
            },
            separatorBuilder: (context, index) =>
                Divider(height: 1.0, color: MyColors().gray),
            itemCount: latestMovies.length),
      ),
    );
  }
}
