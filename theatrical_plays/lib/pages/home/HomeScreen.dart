import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Actor.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/models/Theater.dart';
import 'package:theatrical_plays/pages/actors/ActorInfo.dart';
import 'package:theatrical_plays/pages/movies/MovieInfo.dart';
import 'package:theatrical_plays/pages/theaters/TheaterInfo.dart';
import 'package:theatrical_plays/using/MyColors.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  List<Movie> homeMovies = [];
  List<Actor> homeActors = [];
  List<Theater> homeTheaters = [];
  HomeScreen(this.homeMovies, this.homeActors, this.homeTheaters);
  @override
  _HomeScreenState createState() => _HomeScreenState(
      homeMovies: homeMovies,
      homeActors: homeActors,
      homeTheaters: homeTheaters);
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> homeMovies = [];
  List<Actor> homeActors = [];
  List<Theater> homeTheaters = [];
  _HomeScreenState({this.homeMovies, this.homeActors, this.homeTheaters});
  @override
  Widget build(BuildContext context) {
    // print(homeActors[0].fullName);
    return Scaffold(
      backgroundColor: MyColors().black,
      body: Container(
        color: MyColors().black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 140,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildActorTile(index);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 12);
                  },
                  itemCount: homeActors.length),
            ),
            SizedBox(
              height: 20,
              width: 10,
              child: FloatingActionButton.extended(
                label: Text('Actors',
                    style: TextStyle(color: MyColors().cyan)), // <-- Text
                backgroundColor: MyColors().gray,
                onPressed: () {},
              ),
            ),
            Divider(color: MyColors().gray),
            SizedBox(
                height: 140,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return buildMovieTile(index);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 12);
                    },
                    itemCount: homeMovies.length)),
            SizedBox(
              height: 20,
              width: 10,
              child: FloatingActionButton.extended(
                label: Text('Movies',
                    style: TextStyle(color: MyColors().cyan)), // <-- Text
                backgroundColor: MyColors().gray,
                onPressed: () {},
              ),
            ),
            Divider(color: MyColors().gray),
            SizedBox(
                height: 140,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return buildTheaterTile(index);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 12);
                    },
                    itemCount: homeTheaters.length)),
            SizedBox(
              height: 20,
              width: 10,
              child: FloatingActionButton.extended(
                label: Text('Theaters',
                    style: TextStyle(color: MyColors().cyan)), // <-- Text
                backgroundColor: MyColors().gray,
                onPressed: () {},
              ),
            ),
            Divider(color: MyColors().gray)
          ],
        ),
      ),
    );
  }

  Widget buildActorTile(int index) => Container(
      width: 120,
      // height: 50,
      color: MyColors().black,
      child: Card(
          color: MyColors().black,
          child: Wrap(children: <Widget>[
            // Image.network(homeActors[index].image),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(homeActors[index].image),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ActorInfo(homeActors[index].id)));
              },
              title: Center(
                child: Text(
                  homeActors[index].fullName,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: MyColors().cyan, fontSize: 12),
                ),
              ),
            ),
          ])));

  Widget buildMovieTile(int index) => Container(
      width: 120,
      color: MyColors().black,
      child: Card(
          color: MyColors().black,
          child: Wrap(children: <Widget>[
            // Image.network(homeActors[index].image),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://thumbs.dreamstime.com/z/print-178440812.jpg'),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieInfo(homeMovies[index].id)));
              },
              title: Center(
                child: Text(
                  homeMovies[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: MyColors().cyan, fontSize: 10),
                ),
              ),
            )
          ])));

  Widget buildTheaterTile(int index) => Container(
      width: 120,
      color: MyColors().black,
      child: Card(
          color: MyColors().black,
          child: Wrap(children: <Widget>[
            // Image.network(homeActors[index].image),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://thumbs.dreamstime.com/z/location-pin-icon-165980583.jpg'),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TheaterInfo(homeTheaters[index].id)));
              },
              title: Center(
                child: Text(
                  homeTheaters[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: MyColors().cyan, fontSize: 12),
                ),
              ),
            )
          ])));
}
