import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Movie.dart';
import 'package:theatrical_plays/using/MyColors.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieProfile extends StatelessWidget {
  final Movie movie;
  const MovieProfile({key, this.movie}) : super(key: key);

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
          "Duration: " +
              movie.duration +
              " min \nProducer: " +
              movie.producer +
              "\nTrailer: ",
          style: TextStyle(color: MyColors().cyan, fontSize: 18),
        ),
      ),
      // RaisedButton(
      //   onPressed: _launchURL(movie.mediaUrl),
      //   child: new Text(movie.mediaUrl,
      //       style: TextStyle(color: MyColors().cyan, fontSize: 18)),
      // )
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

  // _launchURL(String url) {
  //   if (canLaunch(url) != null) {
  //     launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
