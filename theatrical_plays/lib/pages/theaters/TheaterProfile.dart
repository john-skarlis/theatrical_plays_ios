import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Theater.dart';
import 'package:theatrical_plays/using/MyColors.dart';

class TheaterProfile extends StatelessWidget {
  final Theater theater;
  const TheaterProfile({key, this.theater}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildImage(),
      Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text(
            theater.title,
            style: TextStyle(color: MyColors().cyan, fontSize: 18),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
        child: Text(
          "Address: " + theater.address,
          style: TextStyle(color: MyColors().cyan, fontSize: 18),
        ),
      )
    ]);
  }

  Widget buildImage() {
    final image = NetworkImage(
        'https://thumbs.dreamstime.com/z/location-pin-icon-165980583.jpg');

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
}
