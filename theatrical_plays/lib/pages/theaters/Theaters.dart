import 'package:flutter/material.dart';
import 'package:theatrical_plays/models/Theater.dart';
import 'package:theatrical_plays/pages/theaters/LoadingTheaters.dart';
import 'package:theatrical_plays/using/MyColors.dart';

// ignore: must_be_immutable
class Theaters extends StatefulWidget {
  List<Theater> theaters = [];
  Theaters(this.theaters);
  @override
  _TheatersState createState() => _TheatersState(theaters: theaters);
}

class _TheatersState extends State<Theaters> {
  List<Theater> theaters = [];
  _TheatersState({this.theaters});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().black,
      body: Container(
        child: ListView.builder(
            itemCount: theaters.length,
            itemBuilder: (context, index) {
              return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        //open the tapped item
                        MaterialPageRoute(
                            builder: (context) => LoadingTheaters()));
                  },
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://thumbs.dreamstime.com/z/location-pin-icon-165980583.jpg'),
                    ),
                  ),
                  title: Text(
                    theaters[index].title,
                    style: TextStyle(color: MyColors().cyan),
                  ),
                  subtitle: Text(
                    theaters[index].address,
                    style: TextStyle(color: MyColors().white),
                  ));
            }),
      ),
    );
  }
}
