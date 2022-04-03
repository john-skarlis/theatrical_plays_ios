import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/using/MyColors.dart';

// ignore: must_be_immutable
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
                            image: NetworkImage(latestMovies[index].mediaUrl ??
                                'https://i2.wp.com/9to5google.com/wp-content/uploads/sites/4/2017/08/youtube_logo_dark.jpg?w=2500&quality=82&strip=all&ssl=1'),
                            fit: BoxFit.cover)),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    dense: true,
                    title: Text(
                      latestMovies[index].title,
                      style: TextStyle(color: MyColors().cyan),
                    ),
                    subtitle: Text(
                      latestMovies[index].producer,
                      style: TextStyle(color: MyColors().white),
                    ),
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
