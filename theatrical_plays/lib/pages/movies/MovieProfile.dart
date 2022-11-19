import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/using/MyColors.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class MovieProfile extends StatefulWidget {
  Movie movie;
  MovieProfile(this.movie);
  @override
  _MovieProfile createState() => _MovieProfile(movie: movie);
}

class _MovieProfile extends State<MovieProfile> {
  Movie movie;
  _MovieProfile({this.movie});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildImage(),
      Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text(
            movie.title,
            style: TextStyle(color: MyColors().cyan, fontSize: 18),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
        child: Text(
          "Description: " + movie.description,
          style: TextStyle(color: MyColors().cyan, fontSize: 18),
        ),
      ),
      Divider(color: MyColors().gray),
      Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
        child: Text(
          "Duration: " + movie.duration + " h \nProducer: " + movie.producer,
          style: TextStyle(color: MyColors().cyan, fontSize: 18),
        ),
      ),
      FloatingActionButton.extended(
        label: Text('Trailer',
            style: TextStyle(color: MyColors().cyan, fontSize: 18)), // <-- Text
        backgroundColor: MyColors().gray,
        onPressed: () {
          _launchURL(movie.mediaUrl);
        },
      ),
    ]);
  }

  Widget buildImage() {
    final image =
        NetworkImage("https://thumbs.dreamstime.com/z/print-178440812.jpg");

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
        ),
      ),
    );
  }

  _launchURL(String url) {
    // ignore: deprecated_member_use
    if (canLaunch(url) != null) {
      // ignore: deprecated_member_use
      launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
